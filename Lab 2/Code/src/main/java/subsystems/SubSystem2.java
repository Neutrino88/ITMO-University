package subsystems;

import function.MathFunction;
import function.log.Log3;
import function.log.Log5;
import function.log.Log10;

public class SubSystem2 implements MathFunction {
    private Log3 log3;
    private Log5 log5;
    private Log10 log10;

    public SubSystem2(Log3 log3, Log5 log5, Log10 log10) {
        this.log3 = log3;
        this.log5 = log5;
        this.log10 = log10;
    }

    @Override
    public double evaluate(double x) {
        return evaluate(x, 0.0000001);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        return Math.pow(((Math.pow(log5.evaluate(x, accuracy), 2)
                - log5.evaluate(x, accuracy))
                * log3.evaluate(x, accuracy))
                - log10.evaluate(x, accuracy), 2);
    }
}
