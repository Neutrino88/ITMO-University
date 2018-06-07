package function.log;

import function.MathFunction;

public class Log10 implements MathFunction {
    private final Ln ln;

    public Log10(Ln ln) {
        this.ln = ln;
    }

    @Override
    public double evaluate(double x) {
        return ln.evaluate(x) / 2.302585092994;
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return ln.evaluate(x, accuracy) / 2.302585092994;
    }
}
