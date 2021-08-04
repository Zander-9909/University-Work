public class Arithmetic extends AbstractSeries {
    private double nextVal = 1.0;
    private double last = 0.0;
    public double next(){
        double returnVal = nextVal+last;
        last += nextVal;
        nextVal++;
        return returnVal;
    }
}
