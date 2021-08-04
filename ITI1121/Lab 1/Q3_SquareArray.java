//Griffin Taylor - ITI1121
public class Q3_SquareArray {
    public static int[] createArray(int size) {
        int[] x = new int[size];
        for (int i = 0;i<size;i++){
            x[i] = i*i;
        }
        return x;
    }
    public static void sort(int[] values){
        int i, j, argMin, tmp;
        for (i = 0; i < values.length - 1; i++) {
            argMin = i;
            for (j = i + 1; j < values.length; j++) {
                if (values[j] < values[argMin]) {
                    argMin = j;
                    }
                }
            tmp = values[argMin];
            values[argMin] = values[i];
            values[i] = tmp;
        }
}

    public static void main(String[] args){
        int num = 1;
        int [] u = createArray(num);
        for (int i = 0;i<num;i++){
            System.out.println(u[i]);
        }
    }
}
