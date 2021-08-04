public interface Map< K, V> {

    /* Make the necessary abstract method definitions */
    V get (K key);
    boolean contains(K key);
    void put(K key,V value);
    void replace(K key,V value);
    V remove(K key);
}