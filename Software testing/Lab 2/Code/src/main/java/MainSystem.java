import function.MathFunction;
import subsystems.SubSystem1;
import subsystems.SubSystem2;

public class MainSystem implements MathFunction {
    private static final double DEFAULT_ACCURACY = 0.001;
    private SubSystem1 subSystem1;
    private SubSystem2 subSystem2;

    public MainSystem(SubSystem1 subSystem1, SubSystem2 subSystem2) {
        this.subSystem1 = subSystem1;
        this.subSystem2 = subSystem2;
    }

    @Override
    public double evaluate(double x) {
        return evaluate(x, DEFAULT_ACCURACY);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        if (x <= 0) {
            return subSystem1.evaluate(x, accuracy);
        } else {
            return subSystem2.evaluate(x, accuracy);
        }
    }
}
