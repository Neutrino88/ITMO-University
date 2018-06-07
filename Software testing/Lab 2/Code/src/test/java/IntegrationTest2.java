import java.util.Arrays;
import java.util.stream.Stream;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;
import subsystems.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.Mocker.*;

class IntegrationTest2 {
    private static double[][] results = Results.results;
    private static final double ACCURACY = 0.000001;
    private static MainSystem mainSystem;

    @ValueSource
    @BeforeAll
    static void init() {
        SubSystem1 subSystem1 = new SubSystem1(getCscStub(), getSecStub());
        SubSystem2 subSystem2 = new SubSystem2(getLog3Stub(), getLog5Stub(), getLog10Stub());
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
