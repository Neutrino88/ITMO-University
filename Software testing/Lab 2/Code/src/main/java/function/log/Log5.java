package function.log;

import function.MathFunction;

public class Log5 implements MathFunction {
    private final Ln ln;

    public Log5(Ln ln) {
        this.ln = ln;
    }

    @Override
    public double evaluate(double x) {
        return ln.evaluate(x) / 1.60943791243;
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return ln.evaluate(x, accuracy) / 1.60943791243;
    }
}
