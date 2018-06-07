package function;

public class Function {
    public static double arctg(double x, double eps){
        double result = 0;
        double prevResult;
        int n = 0;

        do {
            prevResult = result;
            result += Math.pow(-1, n) * Math.pow(x, 2 * n + 1) / (2 * n + 1);
            n++;
        } while (Math.abs(result - prevResult) > eps);

        return result;
    }
}
