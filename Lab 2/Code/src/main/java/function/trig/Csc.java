package function.trig;

import function.MathFunction;

public class Csc implements MathFunction {
    private final Sin sin;

    public Csc(Sin sin) {
        this.sin = sin;
    }

    @Override
    public double evaluate(double x) {
        return 1 / this.sin.evaluate(x);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return 1 / this.sin.evaluate(x, accuracy);
    }
}
