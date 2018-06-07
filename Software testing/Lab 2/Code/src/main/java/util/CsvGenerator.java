package util;

import java.io.FileWriter;
import function.MathFunction;

public class CsvGenerator {
    private static final char SEPARATOR = ',';
    private static final char LINE_SEPARATOR = '\n';

    public static void generateCsv(MathFunction mathFunction, double l, double r, double step, String moduleName) {
        try {
            FileWriter writer = new FileWriter(moduleName + ".csv");
            for (Double x = l; x < r; x += step) {
                Double y = mathFunction.evaluate(x);
                writer.append("" + x + SEPARATOR + y + LINE_SEPARATOR);
            }

            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
