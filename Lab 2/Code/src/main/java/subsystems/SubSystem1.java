package subsystems;

import function.MathFunction;
import function.trig.Csc;
import function.trig.Sec;

public class SubSystem1 implements MathFunction {
    private Csc csc;
    private Sec sec;

    public SubSystem1(Csc csc, Sec sec) {
        this.csc = csc;
        this.sec = sec;
    }

    @Override
    public double evaluate(double x) {
        return evaluate(x, 0.0000001);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        if (x == 0) return Double.NEGATIVE_INFINITY;
        if (x == -Math.PI / 2 || x == -Math.PI){
            return Double.NaN;
        }

        return Math.pow(csc.evaluate(x, accuracy) * sec.evaluate(x, accuracy), 3);
    }
}
