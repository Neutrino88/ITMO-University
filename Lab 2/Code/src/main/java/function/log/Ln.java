package function.log;

import function.MathFunction;

import java.util.ArrayList;

public class Ln implements MathFunction{
    private static final double EPSILON = 0.0000001;
    private double allowedError;

    private double doCalculation(double x, int n) {
        ArrayList<Double> coeffs = new ArrayList<>(5);
        // calculate coefficients for needed accuracy
        for (int i = coeffs.size(); i <= n; i++) {
            double val = 1. / (i + 1);
            coeffs.add((i % 2 != 0) ? -val : val);
        }
        // calculate answer
        double answer = 0.0;
        for (int i = 0; i <= n; ++i)
            answer += coeffs.get(i) * Math.pow(x - 1, i + 1);

        return answer;
    }

    @Override
    public double evaluate(double x) {
        if (x == 0.0)
            return Double.NaN;

        int n = 1;
        // calculate needed accuracy
        double prevError = Double.MAX_VALUE;
        double currError;
        while ((currError = 1. / ++n) > allowedError) {
            if (currError > prevError)
                throw new IllegalArgumentException("Function diverges at this point");

            prevError = currError;
        }

        return (x < 0) ? -doCalculation(-x, n) : doCalculation(x, n);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        if (accuracy > 0.5)
            this.allowedError = 0.5;
        else if (allowedError < EPSILON)
            this.allowedError = EPSILON;
        else
            this.allowedError = accuracy;

        return evaluate(x);
    }
}
