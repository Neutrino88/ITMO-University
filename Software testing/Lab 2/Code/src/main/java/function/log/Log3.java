package function.log;

import function.MathFunction;

public class Log3 implements MathFunction {
    private final Ln ln;

    public Log3(Ln ln) {
        this.ln = ln;
    }

    @Override
    public double evaluate(double x) {
        return ln.evaluate(x) / 1.098612288668109;
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return ln.evaluate(x, accuracy) / 1.098612288668109;
    }
}
