//Griffin Taylor - ITI1121
public class Q3_AverageDemo {
    public static void main(String[] args){
        double[] valuesArray;
        valuesArray = new double[]{0.0};
        System.out.println("The average is: " + calculateAverage(valuesArray));
    }

    //method that calculates the average of the numbers in an array
    public static double calculateAverage(double[] values){
        double result,sum = 0;
        for (int i = 0;i<values.length;i++){
            sum +=values[i];
        }
        return result = sum/values.length;
    }
}
