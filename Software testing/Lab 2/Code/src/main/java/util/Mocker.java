package util;
import static org.mockito.ArgumentMatchers.anyDouble;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import function.MathFunction;
import function.log.*;
import function.trig.*;
import subsystems.*;

public class Mocker {
    private static final double delta = 0.0001;

    private static final double[][] SinAnswers = {
            {0, 0},
            {0 - delta, Math.sin(0 - delta)},
            {-Math.PI/8, Math.sin(-Math.PI/8)},
            {-Math.PI/4 + delta, Math.sin(-Math.PI/4 + delta)},
            {-Math.PI/4, Math.sin(-Math.PI/4)},
            {-Math.PI/4 - delta, Math.sin(-Math.PI/4 - delta)},
            {-Math.PI*3/8, Math.sin(-Math.PI*3/8)},
            {-Math.PI/2 + delta, Math.sin(-Math.PI/2 + delta)},
            {-Math.PI/2, Math.sin(-Math.PI/2)},
            {-Math.PI/2 - delta, Math.sin(-Math.PI/2 - delta)},
            {-Math.PI*5/8, Math.sin(-Math.PI*5/8)},
            {-Math.PI*3/4 + delta, Math.sin(-Math.PI*3/4 + delta)},
            {-Math.PI*3/4, Math.sin(-Math.PI*3/4)},
            {-Math.PI*3/4 - delta, Math.sin(-Math.PI*3/4 - delta)},
            {-Math.PI*7/8, Math.sin(-Math.PI*7/8)},
            {-Math.PI + delta, Math.sin(-Math.PI + delta)},
            {-Math.PI, 0},
            {-Math.PI - delta, Math.sin(-Math.PI - delta)},
            {0, Math.sin(0)},
            {0 + delta, Math.sin(0 + delta)},
            {0.2, Math.sin(0.2)},
            {0.4, Math.sin(0.4)},
            {0.5668 - delta, Math.sin(0.5668 - delta)},
            {0.5668, Math.sin(0.5668)},
            {0.5668 + delta, Math.sin(0.5668 + delta)},
            {0.7408 - delta, Math.sin(0.7408 - delta)},
            {0.7408, Math.sin(0.7408)},
            {0.7408 + delta, Math.sin(0.7408 + delta)},
            {1 - delta, Math.sin(1 - delta)},
            {1, Math.sin(1)},
            {1 + delta, Math.sin(1 + delta)},
            {1.4, Math.sin(1.4)},
            {2, Math.sin(2)}
    };
    private static final double[][] CosAnswers = {
            {0, Math.cos(0)},
            {0 - delta, Math.cos(0 - delta)},
            {-Math.PI/8, Math.cos(-Math.PI/8)},
            {-Math.PI/4 + delta, Math.cos(-Math.PI/4 + delta)},
            {-Math.PI/4, Math.cos(-Math.PI/4)},
            {-Math.PI/4 - delta, Math.cos(-Math.PI/4 - delta)},
            {-Math.PI*3/8, Math.cos(-Math.PI*3/8)},
            {-Math.PI/2 + delta, Math.cos(-Math.PI/2 + delta)},
            {-Math.PI/2, Double.POSITIVE_INFINITY},
            {-Math.PI/2 - delta, Math.cos(-Math.PI/2 - delta)},
            {-Math.PI*5/8, Math.cos(-Math.PI*5/8)},
            {-Math.PI*3/4 + delta, Math.cos(-Math.PI*3/4 + delta)},
            {-Math.PI*3/4, Math.cos(-Math.PI*3/4)},
            {-Math.PI*3/4 - delta, Math.cos(-Math.PI*3/4 - delta)},
            {-Math.PI*7/8, Math.cos(-Math.PI*7/8)},
            {-Math.PI + delta, Math.cos(-Math.PI + delta)},
            {-Math.PI, -1},
            {-Math.PI - delta, Math.cos(-Math.PI - delta)},
            {0, Math.cos(0)},
            {0 + delta, Math.cos(0 + delta)},
            {0.2, Math.cos(0.2)},
            {0.4, Math.cos(0.4)},
            {0.5668 - delta, Math.cos(0.5668 - delta)},
            {0.5668, Math.cos(0.5668)},
            {0.5668 + delta, Math.cos(0.5668 + delta)},
            {0.7408 - delta, Math.cos(0.7408 - delta)},
            {0.7408, Math.cos(0.7408)},
            {0.7408 + delta, Math.cos(0.7408 + delta)},
            {1 - delta, Math.cos(1 - delta)},
            {1, Math.cos(1)},
            {1 + delta, Math.cos(1 + delta)},
            {1.4, Math.cos(1.4)},
            {2, Math.cos(2)}
    };
    private static final double[][] SecAnswers = {
            {0, 1 / Math.sin(0)},
            {0 - delta, 1 / Math.cos(0 - delta)},
            {-Math.PI/8, 1 / Math.cos(-Math.PI/8)},
            {-Math.PI/4 + delta, 1 / Math.cos(-Math.PI/4 + delta)},
            {-Math.PI/4, 1 / Math.cos(-Math.PI/4)},
            {-Math.PI/4 - delta, 1 / Math.cos(-Math.PI/4 - delta)},
            {-Math.PI*3/8, 1 / Math.cos(-Math.PI*3/8)},
            {-Math.PI/2 + delta, 1 / Math.cos(-Math.PI/2 + delta)},
            {-Math.PI/2, Double.POSITIVE_INFINITY},
            {-Math.PI/2 - delta, 1 / Math.cos(-Math.PI/2 - delta)},
            {-Math.PI*5/8, 1 / Math.cos(-Math.PI*5/8)},
            {-Math.PI*3/4 + delta, 1 / Math.cos(-Math.PI*3/4 + delta)},
            {-Math.PI*3/4, 1 / Math.cos(-Math.PI*3/4)},
            {-Math.PI*3/4 - delta, 1 / Math.cos(-Math.PI*3/4 - delta)},
            {-Math.PI*7/8, 1 / Math.cos(-Math.PI*7/8)},
            {-Math.PI + delta, 1 / Math.cos(-Math.PI + delta)},
            {-Math.PI, -1},
            {-Math.PI - delta, 1 / Math.cos(-Math.PI - delta)},
            {0, 1 / Math.cos(0)},
            {0 + delta, 1 / Math.cos(0 + delta)},
            {0.2, 1 / Math.cos(0.2)},
            {0.4, 1 / Math.cos(0.4)},
            {0.5668 - delta, 1 / Math.cos(0.5668 - delta)},
            {0.5668, 1 / Math.cos(0.5668)},
            {0.5668 + delta, 1 / Math.cos(0.5668 + delta)},
            {0.7408 - delta, 1 / Math.cos(0.7408 - delta)},
            {0.7408, 1 / Math.cos(0.7408)},
            {0.7408 + delta, 1 / Math.cos(0.7408 + delta)},
            {1 - delta, 1 / Math.cos(1 - delta)},
            {1, 1 / Math.cos(1)},
            {1 + delta, 1 / Math.cos(1 + delta)},
            {1.4, 1 / Math.cos(1.4)},
            {2, 1 / Math.cos(2)}
    };
    private static final double[][] CscAnswers = {
            {0, Double.NEGATIVE_INFINITY},
            {0 - delta, 1 / Math.sin(0 - delta)},
            {-Math.PI/8, 1 / Math.sin(-Math.PI/8)},
            {-Math.PI/4 + delta, 1 / Math.sin(-Math.PI/4 + delta)},
            {-Math.PI/4, 1 / Math.sin(-Math.PI/4)},
            {-Math.PI/4 - delta, 1 / Math.sin(-Math.PI/4 - delta)},
            {-Math.PI*3/8, 1 / Math.sin(-Math.PI*3/8)},
            {-Math.PI/2 + delta, 1 / Math.sin(-Math.PI/2 + delta)},
            {-Math.PI/2, 1 / Math.sin(-Math.PI/2)},
            {-Math.PI/2 - delta, 1 / Math.sin(-Math.PI/2 - delta)},
            {-Math.PI*5/8, 1 / Math.sin(-Math.PI*5/8)},
            {-Math.PI*3/4 + delta, 1 / Math.sin(-Math.PI*3/4 + delta)},
            {-Math.PI*3/4, 1 / Math.sin(-Math.PI*3/4)},
            {-Math.PI*3/4 - delta, 1 / Math.sin(-Math.PI*3/4 - delta)},
            {-Math.PI*7/8, 1 / Math.sin(-Math.PI*7/8)},
            {-Math.PI + delta, 1 / Math.sin(-Math.PI + delta)},
            {-Math.PI, Double.POSITIVE_INFINITY},
            {-Math.PI - delta, 1 / Math.sin(-Math.PI - delta)},
            {0, 1 / Math.sin(0)},
            {0 + delta, 1 / Math.sin(0 + delta)},
            {0.2, 1 / Math.sin(0.2)},
            {0.4, 1 / Math.sin(0.4)},
            {0.5668 - delta, 1 / Math.sin(0.5668 - delta)},
            {0.5668, 1 / Math.sin(0.5668)},
            {0.5668 + delta, 1 / Math.sin(0.5668 + delta)},
            {0.7408 - delta, 1 / Math.sin(0.7408 - delta)},
            {0.7408, 1 / Math.sin(0.7408)},
            {0.7408 + delta, 1 / Math.sin(0.7408 + delta)},
            {1 - delta, 1 / Math.sin(1 - delta)},
            {1, 1 / Math.sin(1)},
            {1 + delta, 1 / Math.sin(1 + delta)},
            {1.4, 1 / Math.sin(1.4)},
            {2, 1 / Math.sin(2)}
    };
    private static final double[][] Log3Answers = {
            {0 - delta, Math.log(0 - delta) / Math.log(3)},
            {-Math.PI/8, Math.log(-Math.PI/8) / Math.log(3)},
            {-Math.PI/4 + delta, Math.log(-Math.PI/4 + delta) / Math.log(3)},
            {-Math.PI/4, Math.log(-Math.PI/4) / Math.log(3)},
            {-Math.PI/4 - delta, Math.log(-Math.PI/4 - delta) / Math.log(3)},
            {-Math.PI*3/8, Math.log(-Math.PI*3/8) / Math.log(3)},
            {-Math.PI/2 + delta, Math.log(-Math.PI/2 + delta) / Math.log(3)},
            {-Math.PI/2, Math.log(-Math.PI/2) / Math.log(3)},
            {-Math.PI/2 - delta, Math.log(-Math.PI/2 - delta) / Math.log(3)},
            {-Math.PI*5/8, Math.log(-Math.PI*5/8) / Math.log(3)},
            {-Math.PI*3/4 + delta, Math.log(-Math.PI*3/4 + delta) / Math.log(3)},
            {-Math.PI*3/4, Math.log(-Math.PI*3/4) / Math.log(3)},
            {-Math.PI*3/4 - delta, Math.log(-Math.PI*3/4 - delta) / Math.log(3)},
            {-Math.PI*7/8, Math.log(-Math.PI*7/8) / Math.log(3)},
            {-Math.PI + delta, Math.log(-Math.PI + delta) / Math.log(3)},
            {-Math.PI, Math.log(-Math.PI) / Math.log(3)},
            {-Math.PI - delta, Math.log(-Math.PI - delta) / Math.log(3)},
            {0 + delta, Math.log(0 + delta) / Math.log(3)},
            {0.2, Math.log(0.2) / Math.log(3)},
            {0.4, Math.log(0.4) / Math.log(3)},
            {0.5668 - delta, Math.log(0.5668 - delta) / Math.log(3)},
            {0.5668, Math.log(0.5668) / Math.log(3)},
            {0.5668 + delta, Math.log(0.5668 + delta) / Math.log(3)},
            {0.7408 - delta, Math.log(0.7408 - delta) / Math.log(3)},
            {0.7408, Math.log(0.7408) / Math.log(3)},
            {0.7408 + delta, Math.log(0.7408 + delta) / Math.log(3)},
            {1 - delta, Math.log(1 - delta) / Math.log(3)},
            {1, Math.log(1) / Math.log(3)},
            {1 + delta, Math.log(1 + delta) / Math.log(3)},
            {1.4, Math.log(1.4) / Math.log(3)},
            {2, Math.log(2) / Math.log(3)}
    };
    private static final double[][] Log5Answers = {
            {0 - delta, Math.log(0 - delta) / Math.log(5)},
            {-Math.PI/8, Math.log(-Math.PI/8) / Math.log(5)},
            {-Math.PI/4 + delta, Math.log(-Math.PI/4 + delta) / Math.log(5)},
            {-Math.PI/4, Math.log(-Math.PI/4) / Math.log(5)},
            {-Math.PI/4 - delta, Math.log(-Math.PI/4 - delta) / Math.log(5)},
            {-Math.PI*3/8, Math.log(-Math.PI*3/8) / Math.log(5)},
            {-Math.PI/2 + delta, Math.log(-Math.PI/2 + delta) / Math.log(5)},
            {-Math.PI/2, Math.log(-Math.PI/2) / Math.log(5)},
            {-Math.PI/2 - delta, Math.log(-Math.PI/2 - delta) / Math.log(5)},
            {-Math.PI*5/8, Math.log(-Math.PI*5/8) / Math.log(5)},
            {-Math.PI*3/4 + delta, Math.log(-Math.PI*3/4 + delta) / Math.log(5)},
            {-Math.PI*3/4, Math.log(-Math.PI*3/4) / Math.log(5)},
            {-Math.PI*3/4 - delta, Math.log(-Math.PI*3/4 - delta) / Math.log(5)},
            {-Math.PI*7/8, Math.log(-Math.PI*7/8) / Math.log(5)},
            {-Math.PI + delta, Math.log(-Math.PI + delta) / Math.log(5)},
            {-Math.PI, Math.log(-Math.PI) / Math.log(5)},
            {-Math.PI - delta, Math.log(-Math.PI - delta) / Math.log(5)},
            {0 + delta, Math.log(0 + delta) / Math.log(5)},
            {0.2, Math.log(0.2) / Math.log(5)},
            {0.4, Math.log(0.4) / Math.log(5)},
            {0.5668 - delta, Math.log(0.5668 - delta) / Math.log(5)},
            {0.5668, Math.log(0.5668) / Math.log(5)},
            {0.5668 + delta, Math.log(0.5668 + delta) / Math.log(5)},
            {0.7408 - delta, Math.log(0.7408 - delta) / Math.log(5)},
            {0.7408, Math.log(0.7408) / Math.log(5)},
            {0.7408 + delta, Math.log(0.7408 + delta) / Math.log(5)},
            {1 - delta, Math.log(1 - delta) / Math.log(5)},
            {1, Math.log(1) / Math.log(5)},
            {1 + delta, Math.log(1 + delta) / Math.log(5)},
            {1.4, Math.log(1.4) / Math.log(5)},
            {2, Math.log(2) / Math.log(5)}
    };
    private static final double[][] Log10Answers = {
            {0 - delta, Math.log(0 - delta) / Math.log(10)},
            {-Math.PI/8, Math.log(-Math.PI/8) / Math.log(10)},
            {-Math.PI/4 + delta, Math.log(-Math.PI/4 + delta) / Math.log(10)},
            {-Math.PI/4, Math.log(-Math.PI/4) / Math.log(10)},
            {-Math.PI/4 - delta, Math.log(-Math.PI/4 - delta) / Math.log(10)},
            {-Math.PI*3/8, Math.log(-Math.PI*3/8) / Math.log(10)},
            {-Math.PI/2 + delta, Math.log(-Math.PI/2 + delta) / Math.log(10)},
            {-Math.PI/2, Math.log(-Math.PI/2) / Math.log(10)},
            {-Math.PI/2 - delta, Math.log(-Math.PI/2 - delta) / Math.log(10)},
            {-Math.PI*5/8, Math.log(-Math.PI*5/8) / Math.log(10)},
            {-Math.PI*3/4 + delta, Math.log(-Math.PI*3/4 + delta) / Math.log(10)},
            {-Math.PI*3/4, Math.log(-Math.PI*3/4) / Math.log(10)},
            {-Math.PI*3/4 - delta, Math.log(-Math.PI*3/4 - delta) / Math.log(10)},
            {-Math.PI*7/8, Math.log(-Math.PI*7/8) / Math.log(10)},
            {-Math.PI + delta, Math.log(-Math.PI + delta) / Math.log(10)},
            {-Math.PI, Math.log(-Math.PI) / Math.log(10)},
            {-Math.PI - delta, Math.log(-Math.PI - delta) / Math.log(10)},
            {0 + delta, Math.log(0 + delta) / Math.log(10)},
            {0.2, Math.log(0.2) / Math.log(10)},
            {0.4, Math.log(0.4) / Math.log(10)},
            {0.5668 - delta, Math.log(0.5668 - delta) / Math.log(10)},
            {0.5668, Math.log(0.5668) / Math.log(10)},
            {0.5668 + delta, Math.log(0.5668 + delta) / Math.log(10)},
            {0.7408 - delta, Math.log(0.7408 - delta) / Math.log(10)},
            {0.7408, Math.log(0.7408) / Math.log(10)},
            {0.7408 + delta, Math.log(0.7408 + delta) / Math.log(10)},
            {1 - delta, Math.log(1 - delta) / Math.log(10)},
            {1, Math.log(1) / Math.log(10)},
            {1 + delta, Math.log(1 + delta) / Math.log(10)},
            {1.4, Math.log(1.4) / Math.log(10)},
            {2, Math.log(2) / Math.log(10)}
    };
    private static final double[][] LnAnswers = {
            {0 - delta, Math.log(0 - delta)},
            {-Math.PI/8, Math.log(-Math.PI/8)},
            {-Math.PI/4 + delta, Math.log(-Math.PI/4 + delta)},
            {-Math.PI/4, Math.log(-Math.PI/4)},
            {-Math.PI/4 - delta, Math.log(-Math.PI/4 - delta)},
            {-Math.PI*3/8, Math.log(-Math.PI*3/8)},
            {-Math.PI/2 + delta, Math.log(-Math.PI/2 + delta)},
            {-Math.PI/2, Math.log(-Math.PI/2)},
            {-Math.PI/2 - delta, Math.log(-Math.PI/2 - delta)},
            {-Math.PI*5/8, Math.log(-Math.PI*5/8)},
            {-Math.PI*3/4 + delta, Math.log(-Math.PI*3/4 + delta)},
            {-Math.PI*3/4, Math.log(-Math.PI*3/4)},
            {-Math.PI*3/4 - delta, Math.log(-Math.PI*3/4 - delta)},
            {-Math.PI*7/8, Math.log(-Math.PI*7/8)},
            {-Math.PI + delta, Math.log(-Math.PI + delta)},
            {-Math.PI, Math.log(-Math.PI)},
            {-Math.PI - delta, Math.log(-Math.PI - delta)},
            {0 + delta, Math.log(0 + delta)},
            {0.2, Math.log(0.2)},
            {0.4, Math.log(0.4)},
            {0.5668 - delta, Math.log(0.5668 - delta)},
            {0.5668, Math.log(0.5668)},
            {0.5668 + delta, Math.log(0.5668 + delta)},
            {0.7408 - delta, Math.log(0.7408 - delta)},
            {0.7408, Math.log(0.7408)},
            {0.7408 + delta, Math.log(0.7408 + delta)},
            {1 - delta, Math.log(1 - delta)},
            {1, Math.log(1)},
            {1 + delta, Math.log(1 + delta)},
            {1.4, Math.log(1.4)},
            {2, Math.log(2)}
    };
    private static final double[][] SubSystem1Answers = {
            {0, Double.NEGATIVE_INFINITY},
            {0 - delta, Double.NEGATIVE_INFINITY},
            {-Math.PI/8, -16 * Math.sqrt(2)},
            {-Math.PI/4 + delta, -8},
            {-Math.PI/4, -8},
            {-Math.PI/4 - delta, -8},
            {-Math.PI*3/8, -16 * Math.sqrt(2)},
            {-Math.PI/2 + delta, Double.NEGATIVE_INFINITY},
            {-Math.PI/2, Double.NaN},
            {-Math.PI/2 - delta, Double.POSITIVE_INFINITY},
            {-Math.PI*5/8, 16 * Math.sqrt(2)},
            {-Math.PI*3/4 + delta, 8},
            {-Math.PI*3/4, 8},
            {-Math.PI*3/4 - delta, 8},
            {-Math.PI*7/8, 16 * Math.sqrt(2)},
            {-Math.PI + delta, Double.POSITIVE_INFINITY},
            {-Math.PI, Double.NaN},
            {-Math.PI - delta, Double.NEGATIVE_INFINITY}
    };
    private static final double[][] SubSystem2Answers = {
            {0 + delta, Double.POSITIVE_INFINITY},
            {0.2, 4.97726},
            {0.4, 0.120575},
            {0.5668 - delta, 1.87960 / 1000000000},
            {0.5668, 1.79675},
            {0.5668 + delta, 1.71567 / 1000000000},
            {0.7408 - delta, 0.00488597},
            {0.7408, 0.00488597},
            {0.7408 + delta, 0.00488597},
            {1 - delta, 0},
            {1, 0},
            {1 + delta, 0},
            {1.4, 0.0387190},
            {2, 0.207690151}
    };

    private static Sin sinStub;
    private static Cos cosStub;
    private static Csc cscStub;
    private static Sec secStub;
    private static Log3 log3Stub;
    private static Log5 log5Stub;
    private static Log10 log10Stub;
    private static Ln lnStub;
    private static SubSystem1 subSystem1Stub;
    private static SubSystem2 subSystem2Stub;

    static {
        sinStub = mock(Sin.class);
        cosStub = mock(Cos.class);
        cscStub = mock(Csc.class);
        secStub = mock(Sec.class);
        log3Stub = mock(Log3.class);
        log5Stub = mock(Log5.class);
        log10Stub = mock(Log10.class);
        lnStub = mock(Ln.class);
        subSystem1Stub = mock(SubSystem1.class);
        subSystem2Stub = mock(SubSystem2.class);

        do_mock(sinStub, SinAnswers);
        do_mock(cosStub, CosAnswers);
        do_mock(secStub, SecAnswers);
        do_mock(cscStub, CscAnswers);
        do_mock(log3Stub, Log3Answers);
        do_mock(log5Stub, Log5Answers);
        do_mock(log10Stub, Log10Answers);
        do_mock(lnStub, LnAnswers);
        do_mock(subSystem1Stub, SubSystem1Answers);
        do_mock(subSystem2Stub, SubSystem2Answers);
    }

    private static void do_mock(MathFunction function, double [][] points) {
        for (double[] point : points) {
            when(function.evaluate(point[0])).thenReturn(point[1]);
            when(function.evaluate(eq(point[0]), anyDouble())).thenReturn(point[1]);
        }
    }

    public static Sin getSinStub() {
        return sinStub;
    }

    public static Cos getCosStub() {
        return cosStub;
    }

    public static Csc getCscStub() {
        return cscStub;
    }

    public static Sec getSecStub() {
        return secStub;
    }

    public static Log3 getLog3Stub() {
        return log3Stub;
    }

    public static Log5 getLog5Stub() {
        return log5Stub;
    }

    public static Log10 getLog10Stub() {
        return log10Stub;
    }

    public static Ln getLnStub() {
        return lnStub;
    }

    public static SubSystem1 getSubSystem1Stub() {
        return subSystem1Stub;
    }

    public static SubSystem2 getSubSystem2Stub() {
        return subSystem2Stub;
    }
}
