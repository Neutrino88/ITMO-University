package function.trig;

import function.MathFunction;

public class Sec implements MathFunction {
    private final Cos cos;

    public Sec(Cos cos) {
        this.cos = cos;
    }

    @Override
    public double evaluate(double x) {
        return 1 / cos.evaluate(x);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return 1 / cos.evaluate(x, accuracy);
    }
}
