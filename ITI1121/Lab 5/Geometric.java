public class Geometric extends AbstractSeries {

    private double nextPow = 0.0;
    private double lastVal = 0.0;

    public double next() {
     double toReturn = 1/Math.pow(2,nextPow)+lastVal;
     lastVal = toReturn;
     nextPow++;
     return toReturn;
    }
}
