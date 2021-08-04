public abstract class AbstractSeries implements Series {
    public double[]take(int k){
        double[] arr = new double[k];
        for (int i = 0; i < k; i++) {
            arr[i] = next();
        }
        return arr;
    }
}
