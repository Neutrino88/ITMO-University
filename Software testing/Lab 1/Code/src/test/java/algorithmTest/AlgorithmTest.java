package algorithmTest;

import algorithm.*;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class AlgorithmTest {
    private AlgorithmDijkstra dijkstra;
    private int[][] matrix;
    private int nodesCount;

    @Before
    public void setUp(){
        matrix = new int[][]{{0,1,2,3,-1},
                             {1,0,3,-1,1},
                             {2,3,0,1,1},
                             {3,-1,1,0,2},
                             {-1,1,1,2,0}};

        nodesCount = matrix.length;
        dijkstra = new AlgorithmDijkstra(nodesCount, matrix);
    }

    @Test
    public void testGraph5(){
        int[] distance = dijkstra.dijkstra(1);
        assertArrayEquals(new int[] {0,1,2,3,2}, distance);
    }

}
