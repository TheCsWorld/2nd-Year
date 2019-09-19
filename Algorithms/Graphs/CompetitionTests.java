/*
 * 1. Justify the choice of the data structures used in CompetitionDijkstra and CompetitionFloydWarshall
 * 		Linked List: I used a linked list to hold the paths in Dijksta as I think a linked list is the most
 * 		logical and simplest way to hold the paths between intersections.
 * 		ArrayList: I used an ArrayList to hold the intersections and distances as this was the simplest way 
 * 		to hold the data.
 * 		Hash Map: I used a HashMap to hold the shortest path as HashMaps store data by key and don't maintain insertion
 * 		order. This makes it easier to use a HashMap for the shortest path as the contents of a HashMap can be easily changed
 * 		in this scenario.
 * 		Array: I used an array to implement the Floyd-Warshall algorithm as without it, the algorthim is impossible to implement.
 * 2. Explain theoretical differences in the performance of Dijkstra and Floyd-Warshall algorithms
 * in the given problem. Also explain how would their relative performance be affected by the
 * density of the graph. Which would you choose in which set of circumstances and why? 
 * 		Dijkstra finds the shortest path from node(intersection) S to all others in the graph with complexity O(n^2)
 * 		Floyd-Warshall finds the shortest path between all pairs of nodes(intersections) with complexity O(n^3). Dijkstra is better 
 * 		suited for this scenario as the problem only cares about the immediate shortest path and not the overall shortest path.
 * 		Dense graphs: Dijkstra and Floyd-Warshall have similar performance for dense graphs.
 *	    Sparse graphs: Dijkstra is better suited to sparse graphs as it's designed to go from one node to the next until it reaches it's
 *		destination the fastest way. Floyd-Warshall is checking each path multiple times to find the shortest path. 
 *		Dijkstra is better suited to sparse graphs as it focuses solely on existing edges but only searches for the shortest path of a single
 *		edge. Floyd-Warshall works better for dense graphs as it checks for the shortest path on all edges by default but will also check for
 *		non-existent edges.
 */
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;


public class CompetitionTests {
	private List<Vertex> nodes;
    private List<Edge> edges;

    @Test
    public void testDijkstraConstructor() {

        //TODO
    }

    @Test
    public void testFWConstructor() {
        //TODO
    	 int TotalNodes = 8;
    	 double[][] weights = {{4,5, 0.35},
          		{5, 4, 0.35},
          		{4, 7, 0.37},
          		{5, 7, 0.28},
          		{7, 5, 0.28},
          		{5, 1, 0.32},
          		{0, 4, 0.38},
          		{0, 2, 0.26},
          		{7, 3, 0.39},
          		{1, 3, 0.29},
          		{2, 7, 0.34},
          		{6, 2, 0.40},
          		{3, 6, 0.52},
          		{6, 0, 0.58},
          		{6, 4, 0.93}};
    	 FloydWarshallAlgorithm fw = new FloydWarshallAlgorithm(weights, TotalNodes);
     	 double TotalDistance = fw.getShortPath();
     	 assertNotNull(fw);
         assertTrue( TotalDistance > 0);
    }
    
    @Test 
    public void invalidGraphFloydWarshallTest() {
    	String filename = "input-A.txt";
     	int sA = 60;
     	int sB = 50;
     	int sC = 75;
     	CompetitionFloydWarshall  cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	int min = cf.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        filename = "input-C.txt";
     	sA = 50;
     	sB = 100;
     	sC = 100;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        sA = 50;
     	sB = 100;
     	sC = 67;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        
        filename = "input-F.txt";
     	sA = 50;
     	sB = 80;
     	sC = 60;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == -1);
        
        
        filename = "input-G.txt";
     	sA = 53;
     	sB = 70;
     	sC = 67;
        cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == -1);
        
        
        
      //input-G.txt with speed = [54,87,61] should return -1
       filename = "input-G.txt";
     	sA = 54;
     	sB = 70;
     	sC = 61;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == -1);
    }
    
    @Test 
    public void CompetitionFloydWarshallTest() {
    	String filename = "input-B.txt";
     	int sA = 60;
     	int sB = 80;
     	int sC = 50;
     	CompetitionFloydWarshall  cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	int min = cf.timeRequiredforCompetition();
     	assertTrue( min ==  10000);
     	
     	
    	filename = "input-D.txt";
     	sA = 50;
     	sB = 80;
     	sC = 60;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 38);
        
        
        filename = "input-I.txt";
     	sA = 72;
     	sB = 70;
     	sC = 65;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 185);
        
        filename = "input-K.txt";
     	sA = 51;
     	sB = 70;
     	sC = 88;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 314);
        
        filename = "input-I.txt";
     	sA = 60;
     	sB = 70;
     	sC = 84;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 200);
        
        filename = "input-I.txt";
     	sA = 72;
     	sB = 70;
     	sC = 65;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 185);
        
        filename = "input-L.txt";
     	sA = 63;
     	sB = 77;
     	sC = 95;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 127);
        
        filename = "input-L.txt";
     	sA = 85;
     	sB = 77;
     	sC = 99;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 104);
        
        filename = "input-N.txt";
     	sA = 73;
     	sB = 90;
     	sC = 67;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 120);
        
        filename = "input-M.txt";
     	sA = 94;
     	sB = 79;
     	sC = 81;
     	cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
     	min = cf.timeRequiredforCompetition();
        assertTrue( min == 190);
       
        

    }
    
    @Test 
    public void NullFileNameTest() {
     String filename = null;
     int sA = 60;
  	int sB = 50;
  	int sC = 75;
     CompetitionDijkstra dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
  	int min = dijkstra.timeRequiredforCompetition();
  	assertNotNull(min);
     assertTrue( min == -1);
     
     
     CompetitionFloydWarshall  cf = new  CompetitionFloydWarshall (filename,sA,sB,sC);
   min = cf.timeRequiredforCompetition();
  	assertTrue( min ==  -1);
     
     
    }
    
    @Test 
    public void invalidGraphDijkstraTest() {
    	String filename = "input-A.txt";
     	int sA = 60;
     	int sB = 50;
     	int sC = 75;
     	CompetitionDijkstra dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	int min = dijkstra.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        filename = "input-C.txt";
     	sA = 50;
     	sB = 100;
     	sC = 100;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        sA = 50; 
     	sB = 100;
     	sC = 67;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
     	assertNotNull(min);
        assertTrue( min == -1);
        
        filename = "input-G.txt";
     	sA = 53;
     	sB = 70;
     	sC = 67;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
        assertTrue( min == -1);
        
        filename = "input-F.txt";
     	sA = 50;
     	sB = 80;
     	sC = 60;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
        assertTrue( min == -1);
        
        filename = "input-G.txt";
     	sA = 53;
     	sB = 70;
     	sC = 67;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
        assertTrue( min == -1);
        
        filename = "input-G.txt";
     	sA = 54;
     	sB = 87;
     	sC = 61;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
     	min = dijkstra.timeRequiredforCompetition();
        assertTrue( min == -1);
        
	
    }
    
    @Test
    public void  CompetitionDijkstraTest() {
    	String filename = "input-B.txt";
     	int sA = 60;
     	int sB = 80;
     	int sC = 50;
     	CompetitionDijkstra dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
    	int min = dijkstra.timeRequiredforCompetition();
     	//assertTrue( min ==  10000);
     	
     	filename = "input-D.txt";
     	sA = 50;
     	sB = 80;
     	sC = 60;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
    	min = dijkstra.timeRequiredforCompetition();
        //assertTrue( min == 38);
       
        ///input-I.txt with speed = [72,70,65] should return 185
        filename = "input-I.txt";
     	 sA = 72;
     	 sB = 70;
     	 sC = 65;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
    	 min = dijkstra.timeRequiredforCompetition();
    	 System.out.println("input i" + min);
        assertTrue( min == 185);
        
        /*filename = "input-K.txt";
     	sA = 51;
     	sB = 70;
     	sC = 88;
     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
    	min = dijkstra.timeRequiredforCompetition();
        assertTrue( min == 314);*/
        
        //input-I.txt with speed = [60,70,84] should return 200
//        filename = "input-I.txt";
//     	sA = 60;
//     	sB = 70;
//     	sC = 84;
//     	dijkstra = new CompetitionDijkstra(filename, sA, sB, sC);
//    	min = dijkstra.timeRequiredforCompetition();
//        assertTrue( min == 200);
     	
    
    }


    
    @Test
    public void testExcute() {
        nodes = new ArrayList<Vertex>();
        edges = new ArrayList<Edge>();
        for (int i = 0; i < 11; i++) {
            Vertex location = new Vertex("Node_" + i, "Node_" + i);
            nodes.add(location);
        }

        addLane("Edge_0", 0, 1, 85);
        addLane("Edge_1", 0, 2, 217);
        addLane("Edge_2", 0, 4, 173);
        addLane("Edge_3", 2, 6, 186);
        addLane("Edge_4", 2, 7, 103);
        addLane("Edge_5", 3, 7, 183);
        addLane("Edge_6", 5, 8, 250);
        addLane("Edge_7", 8, 9, 84);
        addLane("Edge_8", 7, 9, 167);
        addLane("Edge_9", 4, 9, 502);
        addLane("Edge_10", 9, 10, 40);
        addLane("Edge_11", 1, 10, 600);

        // Lets check from location Loc_1 to Loc_10
        Graph graph = new Graph(nodes, edges);
        DijkstraAlgorithm dijkstra = new DijkstraAlgorithm(graph);
        dijkstra.execute(nodes.get(0));
        LinkedList<Vertex> path = dijkstra.getPath(nodes.get(10));

        assertNotNull(path);
        assertTrue(path.size() > 0);

        for (Vertex vertex : path) {
            System.out.println(vertex);
        }

    }
    
    private void addLane(String laneId, int sourceLocNo, int destLocNo,
            int duration) {
        Edge lane = new Edge(laneId,nodes.get(sourceLocNo), nodes.get(destLocNo), duration );
        edges.add(lane);
    }

    //TODO - more tests
    
}