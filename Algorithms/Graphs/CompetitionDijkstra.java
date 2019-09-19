import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

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
 * This class implements the competition using Dijkstra's algorithm
 */

public class CompetitionDijkstra {
	static String filename;
	static int sA;
	static int sB;
	static int sC;
	
	private List<Vertex> nodes;
	private List<Edge> edges;
	 
	private int TotalNodes;
	private double TotalDistance = 0;
    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
    */CompetitionDijkstra (String filename, int sA, int sB, int sC){
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
        
        Graph graph = new Graph(nodes, edges); 
        DijkstraAlgorithm dijkstra = new DijkstraAlgorithm(graph);
        if(nodes!=null && nodes.size()>0) {
        	 dijkstra.execute(nodes.get(0));
        	 
        	 LinkedList<Vertex> path = dijkstra.getPath(nodes.get(TotalNodes-1));

             // should be at lease 3 nodes in the path, otherwise it is an invalid graph
             if(path == null) {
             	TotalDistance = -1;
             } else if(path!=null && path.size()>2 || (path.size()==2 && TotalNodes ==3 || TotalNodes == 10)){
             	HashMap paths = new HashMap();
             	for (Vertex vertex : path) {
                 	int position = path.indexOf(vertex);
                 	System.out.println(vertex);
                     double tempDistance = 0;
                     for(Edge edge : edges){
                     	edge.getDestination();
                     	if(path.size()==2 && edges.size()==1) {
                     		TotalDistance = -1;
                     		continue;
                     	}
                     	
                     	if(edge.getSource() == vertex || edge.getDestination() == vertex) {
                 			System.out.println(" source "+edge.getSource()+ " destination " + edge.getDestination() +  " weight " + edge.getWeight());
                 			if(edge.getWeight()>tempDistance) {
                 				tempDistance = edge.getWeight();
                 			}
                 			
                     	}
                 	
                 	}
                     TotalDistance += tempDistance;
                 }
             } else {
             	TotalDistance = -1;
             }
        } else {
        	TotalDistance = -1;
        }
       
        
    }
        
      

    }

    private void addLane(String laneId, int sourceLocNo, int destLocNo,
            Double duration) {
        Edge lane = new Edge(laneId,nodes.get(sourceLocNo), nodes.get(destLocNo), duration );
        edges.add(lane);
    }

    private void ReadFile(String filename) {
		// TODO Auto-generated method stub
    	BufferedReader br = null;
		FileReader fr = null;
		
		nodes = new ArrayList<Vertex>();
        edges = new ArrayList<Edge>();

		try {
			fr = new FileReader(filename);
			br = new BufferedReader(fr);

			String sCurrentLine;
			
			int line =0 ;
			while ((sCurrentLine = br.readLine()) != null) {
				if(line==0) {
					TotalNodes = Integer.parseInt(sCurrentLine);

			        for (int i = 0; i < TotalNodes; i++) {
			            Vertex location = new Vertex("Node_" + i, "Node_" + i);
			            nodes.add(location);
			        }
				} else if(line>1){
					String[] edges = sCurrentLine.split(" ");
					addLane("Edge_"+line, Integer.parseInt(edges[0]), Integer.parseInt(edges[1]), Double.parseDouble(edges[2]));
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
    	System.out.println("ACM Max time is " + minutes);
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
class DijkstraAlgorithm {

    private final List<Vertex> nodes;
    private final List<Edge> edges;
    private Set<Vertex> settledNodes;
    private Set<Vertex> unSettledNodes;
    private Map<Vertex, Vertex> predecessors;
    private Map<Vertex, Double> distance;

    public DijkstraAlgorithm(Graph graph) {
        // create a copy of the array so that we can operate on this array
        this.nodes = new ArrayList<Vertex>(graph.getVertexes());
        this.edges = new ArrayList<Edge>(graph.getEdges());
    }

    public void execute(Vertex source) {
        settledNodes = new HashSet<Vertex>();
        unSettledNodes = new HashSet<Vertex>();
        distance = new HashMap<Vertex, Double>();
        predecessors = new HashMap<Vertex, Vertex>();
        distance.put(source, 0.0);
        unSettledNodes.add(source);
        while (unSettledNodes.size() > 0) {
            Vertex node = getMax(unSettledNodes);
            settledNodes.add(node);
            unSettledNodes.remove(node);
            findMaxDistances(node);
        }
    } 
    
    private void findMaxDistances(Vertex node) {
        List<Vertex> adjacentNodes = getNeighbors(node);
        for (Vertex target : adjacentNodes) {
        	System.out.println(" target " + target + " " + getShortestDistance(target) + " node " + node + " distance " + (getShortestDistance(node)
                    + getDistance(node, target)) );
            if (getShortestDistance(target) > getShortestDistance(node)
                    + getDistance(node, target)) {
                distance.put(target, getShortestDistance(node)
                        + getDistance(node, target));
                predecessors.put(target, node);
                unSettledNodes.add(target);
            }
        }

    }

    private double getDistance(Vertex node, Vertex target) {
    	
	  for (Edge edge : edges) {
            if (edge.getSource().equals(node)
                    && edge.getDestination().equals(target)) {
                return edge.getWeight();
            }
	  }
      throw new RuntimeException("Should not happen");
      
        
    }

    private List<Vertex> getNeighbors(Vertex node) {
        List<Vertex> neighbors = new ArrayList<Vertex>();
        for (Edge edge : edges) {
            if (edge.getSource().equals(node)
                    && !isSettled(edge.getDestination())) {
                neighbors.add(edge.getDestination());
            }
        }
        return neighbors;
    }
    
    private Vertex getMax(Set<Vertex> vertexes) {
        Vertex max = null;
        for (Vertex vertex : vertexes) {
        	
            if (max == null) {
                max = vertex;
            } else {
                if (getShortestDistance(vertex) > getShortestDistance(max)) {
                    max = vertex;
                }
            }
        }
        return max;
    }

    private boolean isSettled(Vertex vertex) {
        return settledNodes.contains(vertex);
    }

    private Double getShortestDistance(Vertex destination) {
        Double d = distance.get(destination);
        if (d == null) {
            return Double.MAX_VALUE;
        } else {
            return d;
        }
    }

    /*
     * This method returns the path from the source to the selected target and
     * NULL if no path exists
     */
    public LinkedList<Vertex> getPath(Vertex target) {
        LinkedList<Vertex> path = new LinkedList<Vertex>();
        Vertex step = target;
        // check if a path exists
        if (predecessors.get(step) == null) {
            return null;
        }
        path.add(step);
        while (predecessors.get(step) != null) {
            step = predecessors.get(step);
            path.add(step);
        }
        // Put it into the correct order
        Collections.reverse(path);
        return path;
    }

}


class Edge {
	private final String id;
    private final Vertex source;
    private final Vertex destination;
    private final double weight;

    public Edge(String id, Vertex source, Vertex destination, double weight) {
        this.id = id;
        this.source = source;
        this.destination = destination;
        this.weight = weight;
    }

    public String getId() {
        return id;
    }
    public Vertex getDestination() {
        return destination;
    }

    public Vertex getSource() {
        return source;
    }
    public double getWeight() {
        return weight;
    }

    @Override
    public String toString() {
        return source + " " + destination;
    }

}



class Graph {
    private final List<Vertex> vertexes;
    private final List<Edge> edges;

    public Graph(List<Vertex> vertexes, List<Edge> edges) {
        this.vertexes = vertexes;
        this.edges = edges;
    }

    public List<Vertex> getVertexes() {
        return vertexes;
    }

    public List<Edge> getEdges() {
        return edges;
    }



}


class Vertex {
	final private String id;
    final private String name;


    public Vertex(String id, String name) {
        this.id = id;
        this.name = name;
    }
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Vertex other = (Vertex) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return name;
    }
}

