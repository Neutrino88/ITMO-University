package function.trig;

import function.MathFunction;

public class Cos implements MathFunction {
    private final Sin sin;

    public Cos(Sin sin) {
        this.sin = sin;
    }

    @Override
    public double evaluate(double x) {
        return evaluate(x, 0.0000001);
    }

    @Override
    public double evaluate(double x, double accuracy) {
        int cosNumber = (int)(Math.abs(x) / Math.PI + 0.5);

        double sin = this.sin.evaluate(x, accuracy);
        double cos = Math.sqrt(1 - Math.pow(sin, 2));
        return (cosNumber % 2 == 1) ? -cos : cos;
    }
}
