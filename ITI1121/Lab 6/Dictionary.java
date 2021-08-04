public class Dictionary implements Map<String, Integer> {

    private final static int INITIAL_CAPACITY = 10;
    private final static int INCREMENT = 5;
    private int count;

    private Pair[] elems;

    public int getCount() {
        return count;
    }

    public int getCapacity() {
        return elems.length;
    }

    public Dictionary() {
        elems = new Pair[INITIAL_CAPACITY];
        count = 0;
    }

    @Override
    public void put(String key, Integer value) {
        if(count == elems.length)increaseCapacity();
        elems[count] = new Pair(key,value);
        count++;
    }

    private void increaseCapacity() {
        Pair[]newElems = new Pair[elems.length+INCREMENT];
        for (int i = 0; i < elems.length; i++) {
            newElems[i] = elems[i];
        }
        elems = newElems;
    }

    private void decreaseCapacity(){
        Pair[]newElems = new Pair[elems.length-INCREMENT];
        for (int i = 0; i < elems.length; i++) {
            newElems[i] = elems[i];
        }
        elems = newElems;
    }

    @Override
    public boolean contains(String key) {
        for (int i = count-1; i > -1; i--) {
            return elems[i].getKey().equals(key);
        }
        return false;
    }

    @Override
    public Integer get(String key) {
        Integer value = 0;
        for (int i = count-1; i > -1; i--) {
            if(elems[i].getKey().equals(key)){
                value= elems[i].getValue();
                break;
            }
        }
        return value;
    }

    @Override
    public void replace(String key, Integer value) {
        for (int i = count-1; i > -1; i--) {
            if(elems[i].getKey().equals(key))elems[i].setValue(value);
        }
    }

    @Override
    public Integer remove(String key) {
        Integer toRemove = 0;
        for (int i = count-1; i > -1; i--) {
            if(elems[i].getKey().equals(key))toRemove = elems[i].getValue();
        }
        count--;
        if(elems.length-count == INCREMENT)decreaseCapacity();
        return toRemove;
    }

    @Override
    public String toString() {
        String res;
        res = "Dictionary: {elems = [";
        for (int i = count-1; i >= 0 ; i--) {
            res += elems[i];
            if(i > 0) {
                res += ", ";
            }
        }
        return res +"]}";
    }

}