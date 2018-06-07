package functionTest;

import org.junit.Test;
import function.*;

import static org.junit.Assert.*;

public class functionTest {
    private static final double EPS = 1E-5;
    private static final double DELTA = 1E-5;

    @Test // x = -INF
    public void testFunctionNegInfinity() {
        double x = Double.NEGATIVE_INFINITY;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = INF
    public void testFunctionPosInfinity() {
        double x = Double.POSITIVE_INFINITY;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = Pi / 3
    public void testFunctionPiDiv3() {
        double x = Math.PI / 3;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = Pi / 4
    public void testFunctionPiDiv4() {
        double x = Math.PI / 4;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = Pi / 6
    public void testFunctionPiDiv6() {
        double x = Math.PI / 6;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = -Pi / 3
    public void testFunctionMinusPiDiv3() {
        double x = -Math.PI / 3;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = -Pi / 4
    public void testFunctionMinusPiDiv4() {
        double x = -Math.PI / 4;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = -Pi / 6
    public void testFunctionMinusPiDiv6() {
        double x = -Math.PI / 6;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = 0
    public void testFunctionZero() {
        double x = 0;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = 0 - 0.01
    public void testFunctionZeroL() {
        double x = -0.01;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }

    @Test // x = 0 + 0.01
    public void testFunctionZeroR() {
        double x = 0.01;
        assertEquals(Math.atan(x), Function.arctg(x, EPS), DELTA);
    }
}