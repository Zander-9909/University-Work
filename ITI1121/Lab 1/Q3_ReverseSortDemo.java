public class Q3_ReverseSortDemo {
    public static void main(String[] args){
        char[] unorderedLetters;
        unorderedLetters = new char[]{};
        reverseSort(unorderedLetters);
        for (int i = 0 ; i < unorderedLetters.length; i++ )
            System.out.print(unorderedLetters[i]);
    }

    //method that sorts a char array into its reverse alphabetical order
    public static void reverseSort(char[] values){
        for (int i = 0; i < values.length-1; i++) {
            for (int j = 0; j < values.length-i-1; j++) {
                if(values[j]<values[j+1]){//to make it in alphabetical you would just need to switch < to >
                    char temp = values[j];
                    values[j] = values[j+1];
                    values[j+1] = temp;
                }
            }
        }
    }
}