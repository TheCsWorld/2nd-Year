import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import static java.lang.String.format;
import java.util.Arrays;



/*
 * A Contest to Meet (ACM) is a reality TV contest that sets three contestants at three random
 * city intersections. In order to win, the three contestants need all to meet at any intersection
 * of the city as fast as possible.
 * It should be clear that the contestants may arrive at the intersections at different times, in
 * which case, the first to arrive can wait until the others arrive.
 * From an estimated walking speed for each one of the three contestants, ACM wants to determine the
 * minimum time that a live TV broadcast should last to cover their journey regardless of the contestants’
 * initial positions and the intersection they finally meet. You are hired to help ACM answer this question.
 * You may assume the following:
 *     Each contestant walks at a given estimated speed.
 *     The city is a collection of intersections in which some pairs are connected by one-way
 * streets that the contestants can use to traverse the city.
 *
 * This class implements the competition using Floyd-Warshall algorithm
 */

public class CompetitionFloydWarshall {
	static String filename;
	static int sA;
	static int sB;
	static int sC;
	

	private List<Vertex> nodes;
	private List<Edge> edges;
	 
	private int TotalNodes;
	private static FloydWarshallAlgorithm fw;
	
	private double[][] weights;
	private double TotalDistance = 0;
	
    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
     * @throws FileNotFoundException 
     */
    CompetitionFloydWarshall (String filename, int sA, int sB, int sC){
    	this.filename = filename;
    	this.sA = sA;
    	this.sB = sB;
    	this.sC = sC;
    	if(filename == null || sA<50 || sB<50 || sC<50 || sA>100 || sB>100 || sC>100) {
    		sA = -1;
    		sB = -1;
    		sC = -1;
    		TotalDistance = -1;
    	} else {
    	
    	ReadFile(filename);
    	fw = new FloydWarshallAlgorithm(weights, TotalNodes);
    	TotalDistance = fw.getShortPath();
    	}
    }
    
    private void addLane(String laneId, int sourceLocNo, int destLocNo,
            Double duration) {
        Edge lane = new Edge(laneId,nodes.get(sourceLocNo), nodes.get(destLocNo), duration );
        edges.add(lane);
    } 

    private void ReadFile(String filename) { 
        int totalLine = GetFileTotalLine(filename);
		// TODO Auto-generated method stub
    	BufferedReader br = null;
		FileReader fr = null;
		
		nodes = new ArrayList<Vertex>();
        edges = new ArrayList<Edge>();
        

		try {
			fr = new FileReader(filename);
			br = new BufferedReader(fr);

			String sCurrentLine;
			
			int line = 0;
			while ((sCurrentLine = br.readLine()) != null) {
				if(line==0) {
					TotalNodes = Integer.parseInt(sCurrentLine);
					weights = new double[totalLine-2][3];
				} else if(line>1){
						int i=line-2;
						String[] edges = sCurrentLine.split(" ");
			              for (int j=0; j<edges.length; j++) {
			                 weights[i][j] = j<2 ?Integer.parseInt(edges[j]) : Double.parseDouble(edges[j]);
			              }
				}
				line ++;
			}

		} catch (IOException e) {
			//e.printStackTrace();

		} finally {
			try {
				if (br != null)
					br.close();
				if (fr != null)
					fr.close();
			} catch (IOException ex) {
				//ex.printStackTrace();

			}

		}
	}

    private int GetFileTotalLine(String fileName) {
    	BufferedReader reader;
    	int lines = 0;
		try {
			reader = new BufferedReader(new FileReader(fileName));
			
	    	while (reader.readLine() != null) lines++;
	    	reader.close();
	        
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return lines;
 
	}

	/**
     * @return int: minimum minutes that will pass before the three contestants can meet
     */
    public int timeRequiredforCompetition(){
    	if(TotalDistance == -1) {
    		return -1;
    	}
    	
    	int[] numbers = new int[3];
    	numbers[0] = sA;
    	numbers[1] = sB;
    	numbers[2] = sC;
    	
    	double avgSpeed = getMinValue(numbers);
    	int minutes = (int) Math.ceil((TotalDistance * 1000 / avgSpeed));
    	System.out.println("Total distance is " + TotalDistance + " ACM Max time is " + minutes);
        return minutes;
    }
    
    public static int getMinValue(int[] numbers){
    	  int minValue = numbers[0];
    	  for(int i=1;i<numbers.length;i++){
    	    if(numbers[i] < minValue){
    		  minValue = numbers[i];
    		}
    	  }
    	  return minValue;
    }
    
    

}




class FloydWarshallAlgorithm {
	private static double TotalDistance;
	private static int TotalNodes;
 
	
    public FloydWarshallAlgorithm(double[][] weights, int numVertices) {
    	TotalNodes = numVertices;
    	TotalDistance = 0;
        double[][] dist = new double[numVertices][numVertices];
        for (double[] row : dist)
            Arrays.fill(row, Double.POSITIVE_INFINITY);
  
        try {
        	for (double[] w : weights)
                dist[(int) (w[0])][(int) (w[1])] = w[2];
        }catch(Exception e) {
        	System.out.println("exception"+e.getMessage());
        }
        
 
        int[][] next = new int[numVertices][numVertices];
        for (int i = 0; i < next.length; i++) {
            for (int j = 0; j < next.length; j++)
                if (i != j)
                    next[i][j] = j + 1;
        }
 
        for (int k = 0; k < numVertices; k++)
            for (int i = 0; i < numVertices; i++)
                for (int j = 0; j < numVertices; j++)
                    if (dist[i][k] + dist[k][j] < dist[i][j]) {
                        dist[i][j] = dist[i][k] + dist[k][j];
                        next[i][j] = next[i][k];
                    }
 
        printResult(dist, next);
       
    }
 
    public double getShortPath() {
    	
    	TotalDistance = TotalDistance==0 || TotalDistance ==  Double.POSITIVE_INFINITY ? -1 : TotalDistance;
    	return TotalDistance;
    }
    static void printResult(double[][] dist, int[][] next) {
        System.out.println("pair     dist    path");
        for (int i = 0; i < next.length; i++) {
            for (int j = 0; j < next.length; j++) {
                if (i != j) {
                    int u =  i+1;
                    int v =  j+1;
                    String path = format("%d -> %d    %2f     %s", u-1, v-1,
                            dist[i][j], u-1);
                   
                    do {
                    	u =  next[u - 1][v - 1];
                        path += " -> " + (u-1);
                        
                        //if() {
                        	System.out.println("**** shortest ***"+format("%d -> %d    %2f     %s", u-1, v-1,
                                    dist[i][j], u-1));
                        	if(TotalDistance ==0 || Double.compare(dist[i][j], TotalDistance)>0) {
                    			TotalDistance = dist[i][j];
                    			System.out.println(" total " + TotalDistance);
                    		}
                    	//} 
                        
                    } while (u != v);
                    System.out.println(path);
                }
            }
        }
    }
    
    private static int countOccurences(
    		  String someString, char searchedChar, int index) {
    		    if (index >= someString.length()) {
    		        return 0;
    		    }
    		     
    		    int count = someString.charAt(index) == searchedChar ? 1 : 0;
    		    return count + countOccurences(
    		      someString, searchedChar, index + 1);
    		}

}














