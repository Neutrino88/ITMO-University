import java.util.Arrays;
import java.util.stream.Stream;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.Mocker.getSubSystem1Stub;
import static util.Mocker.getSubSystem2Stub;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

class IntegrationTest1 {
    private static double[][] results = Results.results;
    private static final double ACCURACY = 0.0000001;
    private static MainSystem mainSystem;

    @BeforeAll
    static void init() {
        mainSystem = new MainSystem(getSubSystem1Stub(), getSubSystem2Stub());
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
