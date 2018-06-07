package algorithm;

import lombok.experimental.FieldDefaults;
import lombok.extern.log4j.Log4j2;

import static lombok.AccessLevel.PRIVATE;

@Log4j2
@FieldDefaults(level = PRIVATE)
public class AlgorithmDijkstra {
    final static int INF = Integer.MAX_VALUE;       // "Бесконечность"
    int nodesCount;                                 // Кол-во вершин
    int[][] matrix;                                 // Матрица смежности

    public AlgorithmDijkstra(int nodesCount, int[][] matrix){
        this.matrix = matrix;
        this.nodesCount = nodesCount;

        for (int i = 0; i < nodesCount; ++i)
            for (int j = 0; j < nodesCount; ++j)
                if (matrix[i][j] < 0)
                    matrix[i][j] = INF;
    }

    /* Алгоритм Дейкстры за O(V^2) */
    public int[] dijkstra(int start) {
        boolean[] used = new boolean [nodesCount];  // массив пометок
        int[] distance = new int [nodesCount];      // массив расстояния. dist[v] = минимальное_расстояние(start, v)

        // Устанавливаем расстояния до всех вершин
        distance[start] = 0;
        for (int i = 1; i < nodesCount; ++i)
            distance[i] = INF;

        printToLog(0, distance, used);

        // Пытаемся уменьшить расстояния
        while(true) {
            int node = -1;
            for (int i = 0; i < nodesCount; i++) { // перебираем вершины
                printToLog(1, node, distance, used);

                if (!used[i] && distance[i] < INF && (node == -1 || distance[node] > distance[i])) { // Выбираем самую близкую непомеченную вершину
                    node = i;
                    printToLog(2, node, distance, used);
                }
            }

            if (node == -1) {
                break; // Мы обошли все доступные вершины
            }
            used[node] = true;     // Помечаем найденную вершину

            printToLog(3, node, distance, used);

            for (int i = 0; i < nodesCount; i++)
                if (!used[i] && matrix[node][i] < INF) { // Для всех непомеченных смежных
                    distance[i] = Math.min(distance[i], distance[node] + matrix[node][i]); // Обновляем расстояния
                    printToLog(5, distance, used);
                }
        }

        printToLog(6, distance, used);
        return distance;
    }

    private void printToLog(int step, int[] distance, boolean[] used){
        String dist = "[";
        for (int i = 0; i < distance.length - 1; ++i)
            dist += distance[i] + ",";
        dist += distance[distance.length - 1] + "]";

        String us = "[";
        for (int i = 0; i < used.length - 1; ++i)
            us += used[i] + ",";
        us += used[used.length - 1] + "]";

        System.out.println("STEP " + step);
        System.out.println("   Distance: " + dist);
        System.out.println("   Used: " + us);
    }

    private void printToLog(int step, int node, int[] distance, boolean[] used){
        String dist = "[";
        for (int i = 0; i < distance.length - 1; ++i)
            dist += distance[i] + ",";
        dist += distance[distance.length - 1] + "]";

        String us = "[";
        for (int i = 0; i < used.length - 1; ++i)
            us += used[i] + ",";
        us += used[used.length - 1] + "]";

        System.out.println("STEP " + step);
        System.out.println("   Node = " + node);
        System.out.println("   Distance: " + dist);
        System.out.println("   Used: " + us);
    }
}