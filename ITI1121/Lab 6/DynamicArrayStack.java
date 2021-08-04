
public class DynamicArrayStack<E> implements Stack<E> {

    // Instance variables

    private E[] elems;  // Used to store the elements of this ArrayStack
    private int top;    // Designates the first free cell
    private static final int DEFAULT_INC = 25;   //Used to store default increment / decrement

    @SuppressWarnings( "unchecked" )

    // Constructor
    public DynamicArrayStack( int capacity ) {
        if(capacity < DEFAULT_INC){
            capacity = DEFAULT_INC;
        }
        elems = (E[]) new Object[capacity];
        top = 0;
    }

    // Gets current capacity of the array
    public int getCapacity() {
        return elems.length;
    }

    // Returns true if this DynamicArrayStack is empty
    public boolean isEmpty() {
        return ( top == 0 );
    }

    // Returns the top element of this ArrayStack without removing it
    public E peek() {
        return elems[ top-1 ];
    }

    @SuppressWarnings( "unchecked" )

    // Removes and returns the top element of this stack
    public E pop() {
        top--;
        E toReturn = elems[top];
        elems[top] = null;
        checkSize(true);//inputs boolean which is true if popping
        return toReturn;
    }

    @SuppressWarnings( "unchecked" )

    // Puts the element onto the top of this stack.
    public void push( E element ) {
        checkSize(false);
        elems[top] = element;
        top++;
    }

    @SuppressWarnings( "unchecked" )

    public void clear() {
        for (int i = 0; i < elems.length; i++) {
            pop();
        }
        checkSize(true);
    }

    @SuppressWarnings( "unchecked" )

    private void checkSize(boolean popping){
        int count = 0;
        for (int i = top; i < elems.length; i++) {
            if(elems[i]!=null)count++;
        }
        if(count%DEFAULT_INC==0&&popping&&elems.length!=DEFAULT_INC){//removes if too big
            E[] newElems = (E[])new Object[elems.length-DEFAULT_INC];
            for (int i = 0; i < newElems.length; i++) {
                newElems[i] = elems[i];
            }
            elems = newElems;
        }
        else if(count%DEFAULT_INC == 0&&!popping){//add if too small
            E[] newElems = (E[])new Object[elems.length+DEFAULT_INC];
            for (int i = 0; i < newElems.length; i++) {
                newElems[i] = elems[i];
            }
            elems = newElems;
        }
    }

}