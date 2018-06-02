import java.util.Arrays;
import java.util.stream.Stream;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

import function.log.*;
import function.trig.*;
import subsystems.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.Mocker.*;

class IntegrationTest4 {
    private static double[][] results = Results.results;
    private static final double ACCURACY = 0.000001;
    private static MainSystem mainSystem;

    @ValueSource
    @BeforeAll
    static void init() {
        Csc csc = new Csc(getSinStub());
        Cos cos = new Cos(getSinStub());
        Sec sec = new Sec(cos);
        Log3 log3 = new Log3(getLnStub());
        Log5 log5 = new Log5(getLnStub());
        Log10 log10 = new Log10(getLnStub());

        SubSystem1 subSystem1 = new SubSystem1(csc, sec);
        SubSystem2 subSystem2 = new SubSystem2(log3, log5, log10);
        mainSystem = new MainSystem(subSystem1, subSystem2);
    }

    @ParameterizedTest
    @MethodSource(value = "getResults")
    void testSystemWithSubSystem2Stub(double[] point) {
        assertEquals(point[1], mainSystem.evaluate(point[0], ACCURACY), ACCURACY);
    }

    private static Stream getResults() {
        return Arrays.stream(results);
    }
}
