package function.trig;

import function.MathFunction;

public class Sin implements MathFunction{
    @Override
    public double evaluate(double x) {
        return evaluate(x, 0.0000001);
    }

    @Override
    public double evaluate(double x, double eps){
        double result = 0;
        double prevResult;
        int k = 0;
        long fact = 1;

        do {
            prevResult = result;
            if (k > 0) fact *= (2*k) * (2*k+1);
            result += Math.pow(-1, k) * Math.pow(x, 2 * k + 1) / fact;
            k++;
        } while (Math.abs(result - prevResult) > eps);

        return result;
    }
}
