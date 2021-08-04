//Griffin Taylor - ITI1121
public class Q3_ArrayInsertionDemo {
    public static int[] insertIntoArray(int[] beforeArray, int indexToInsert, int valueToInsert){
        int[]afterArray = new int[beforeArray.length+1];
        int j = 0;
        if(indexToInsert == beforeArray.length){
            for (int i = 0; i < beforeArray.length; i++) {
                afterArray[i] = beforeArray[i];
            }
            afterArray[afterArray.length-1] = valueToInsert;
        }

        for (int i = 0;i<beforeArray.length;i++){
            if(i!=indexToInsert){
                afterArray[j] = beforeArray[i];
                j++;
            }
            else{
                afterArray[j] = valueToInsert;
                afterArray[j+1]=beforeArray[i];
                j+=2;
            }
        }
        return afterArray;
    }

    public static void main(String[] args){
        System.out.println("Before:");
        int[]x = new int[]{};
        for (int i = 0;i<x.length;i++){
            System.out.println(x[i]);
        }
        System.out.println("After:");
        int[]y = insertIntoArray(x,x.length,15);
        for (int i = 0;i<y.length;i++){
            System.out.println(y[i]);
        }
    }

}
