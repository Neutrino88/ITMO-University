import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeAll;

import util.CsvGenerator;
import function.log.*;
import function.trig.*;
import subsystems.*;

class WriterTest {
    private static MainSystem mainSystem;

    @BeforeAll
    static void init() {
        Sin sin = new Sin();
        Cos cos = new Cos(sin);
        Csc csc = new Csc(sin);
        Sec sec = new Sec(cos);

        Ln ln = new Ln();
        Log3 log3 = new Log3(ln);
        Log5 log5 = new Log5(ln);
        Log10 log10 = new Log10(ln);

        SubSystem1 subSystem1 = new SubSystem1(csc, sec);
        SubSystem2 subSystem2 = new SubSystem2(log3, log5, log10);
        mainSystem = new MainSystem(subSystem1, subSystem2);
    }

    @Test
    void testWriter() {
        CsvGenerator.generateCsv(mainSystem, -5, 2, 0.1, "allIntegrated");
    }
}
