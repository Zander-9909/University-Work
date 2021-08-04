import java.util.NoSuchElementException;

public class OrderedList implements OrderedStructure {

    // Implementation of the doubly linked nodes (nested-class)

    private static class Node {

        private Comparable value;
        private Node previous;
        private Node next;

        private Node ( Comparable value, Node previous, Node next ) {
            this.value = value;
            this.previous = previous;
            this.next = next;
        }
    }

    // Instance variables

    private Node head;

    // Representation of the empty list.

    public OrderedList() {
        head = new Node(null,null,null);
    }

    // Calculates the size of the list

    public int size() {
        int count = 0;
        Node current = head;
        while(current.next!=null){
            count++;
            current = current.next;
        }
        return count;
    }


    public Object get( int pos ) {
        if(pos>=0&&pos<size()) {//checking for index allowance
            Node current = head.next;
            for (int i = 0; i < pos; i++) {
                current = current.next;
            }
            return current.value;
        }
        else throw new IndexOutOfBoundsException();
        //return new Object();
    }

    // Adding an element while preserving the order

    public boolean add( Comparable o ) {
        if(o == null) throw new IllegalArgumentException();
        //adding first value
        if(head.next == null){
            head.next = new Node(o,null,null);
            return true;
        }
        else{
            Node current = head.next;//starts at first value in list
            while(current!=null) {
                if (current.value.compareTo(o) == 0) {//equal to (adding after the equal node)
                    if(current.next != null){//if there is a node after this
                        Node toInsert = new Node(o,current,current.next);
                        current.next.previous = toInsert;
                        current.next = toInsert;
                        return true;
                    }
                    else{//end of list
                        current.next = new Node(o,current,null);
                        return true;
                    }
                }
                else if (current.value.compareTo(o) > 0){//greater than
                    if(current.next == null){//end of the list
                        if(current.previous==null){//If current is the only element in the list
                            Node toInsert = new Node(o,null,current);
                            current.previous = toInsert;
                            head.next = toInsert;
                            return true;
                        }
                        Node toInsert = new Node(o,current.previous,current);
                        current.previous.next = toInsert;
                        current.previous = toInsert;
                        return true;
                    }
                    else if(current.previous == null){//beginning of the list
                        Node toInsert = new Node(o,null,current);
                        head.next = toInsert;
                        current.previous = toInsert;
                        return true;
                    }
                    else{//somewhere in the middle
                        Node toInsert = new Node(o,current.previous,current);
                        current.previous.next = toInsert;
                        return true;
                    }
                }
                else{//less than
                    if(current.next == null){//end of the list
                        current.next = new Node(o,current,null);
                        return true;
                    }
                    else{
                        current = current.next;
                    }
                }
            }
        }
        return true;
    }

    //Removes one item from the position pos.

    public void remove( int pos ) {
        if(pos < 0) throw new IndexOutOfBoundsException();
        Node current = head.next;
        for (int i = 0; i < pos; i++) {
            current = current.next;
        }
        if(current.next == null){//end of list
            if(current.previous == null){//only item in list
                head.next = null;
                return;
            }
            current.previous.next = null;
            return;
        }
        else if(current.previous == null){//beginning of list
            head.next = current.next;
            current.next.previous = null;
            return;
        }
        else{
            current.next.previous = current.previous;
            current.previous.next = current.next;
            return;
        }
    }

    // Knowing that both lists store their elements in increasing
    // order, both lists can be traversed simultaneously.

    public void merge( OrderedList other ) {
        for (int i = 0; i < other.size(); i++) {
            add((Comparable)other.get(i));
        }
    }
}