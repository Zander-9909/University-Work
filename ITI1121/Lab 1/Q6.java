//This code will work for any amount of marks, not just 10
import java.util.Scanner;
import java.util.Arrays;
public class Q6 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        System.out.println("Please provide a list of grades, between 0 and 100, separated by commas.");
        String[]inputArray = input.nextLine().split(",");
        double[]doubleArray = new double[inputArray.length];
        for (int i = 0; i < doubleArray.length; i++) {
            doubleArray[i] = Double.parseDouble(inputArray[i]);
        }
        Arrays.sort(doubleArray);//Sorting into descending order
        System.out.println("The mean of these marks is:     "+calculateAverage(doubleArray));
        System.out.println("The median of these marks is:   "+calculateMedian(doubleArray));
        System.out.println("The number of passed marks is:  "+calculateNumberPassed(doubleArray));
        System.out.println("The number of failed marks are: "+calculateNumberFailed(doubleArray));
    }

    public static double calculateAverage(double[] notes){
        double sum = 0;
        for (int i = 0; i < notes.length; i++) {
            sum += notes[i];
        }
        return sum/notes.length;
    }

    public static double calculateMedian(double[] notes){
        double median;
        if(notes.length%2==0){//even number of marks
            median = (notes[notes.length/2-1]+notes[notes.length/2])/2;//needs to have -1 because of indices starting at 0;
        }
        else{//odd number of marks
            median = notes[notes.length/2];
        }
        return median;
    }

    public static int calculateNumberFailed(double[] notes){
        int sum = 0;
        for (int i = 0; i < notes.length; i++) {
            if(notes[i]<50){
                sum+=1;
            }
        }
        return sum;
    }

    public static int calculateNumberPassed(double[] notes){
        int sum = 0;
        for (int i = 0; i < notes.length; i++) {
            if(notes[i]>=50){
                sum+=1;
            }
        }
        return sum;
    }
}
