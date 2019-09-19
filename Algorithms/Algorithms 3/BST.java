/*************************************************************************
 *  Binary Search Tree class.
 *  Adapted from Sedgewick and Wayne.
 *
 *  @version 3.0 1/11/15 16:49:42
 *
 *  @author Chloe Conneely 17323080
 *
 *************************************************************************/

import java.util.NoSuchElementException;
import java.util.ArrayList;

public class BST<Key extends Comparable<Key>, Value> {
    private Node root;             // root of BST
    private int maxDepth=0;
    ArrayList list = new ArrayList();
    private int medPos = 0;
    private Key median=null;
    /**
     * Private node class.
     */
    private class Node {
        private Key key;           // sorted by key
        private Value val;         // associated data
        private Node left, right;  // left and right subtrees
        private int N;             // number of nodes in subtree

        public Node(Key key, Value val, int N) {
            this.key = key;
            this.val = val;
            this.N = N;
        }
    }

    // is the symbol table empty?
    public boolean isEmpty() { return size() == 0; }

    // return number of key-value pairs in BST
    public int size() { return size(root); }

    // return number of key-value pairs in BST rooted at x
    private int size(Node x) {
        if (x == null) return 0;
        else return x.N;
    }

    /**
     *  Search BST for given key.
     *  Does there exist a key-value pair with given key?
     *
     *  @param key the search key
     *  @return true if key is found and false otherwise
     */
    public boolean contains(Key key) {
        return get(key) != null;
    }

    /**
     *  Search BST for given key.
     *  What is the value associated with given key?
     *
     *  @param key the search key
     *  @return value associated with the given key if found, or null if no such key exists.
     */
    public Value get(Key key) { return get(root, key); }

    private Value get(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) return get(x.left, key);
        else if (cmp > 0) return get(x.right, key);
        else              return x.val;
    }

    /**
     *  Insert key-value pair into BST.
     *  If key already exists, update with new value.
     *
     *  @param key the key to insert
     *  @param val the value associated with key
     */
    public void put(Key key, Value val) {
        if (val == null) { delete(key); return; }
        root = put(root, key, val);
    }

    private Node put(Node x, Key key, Value val) {
        if (x == null) return new Node(key, val, 1);
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) x.left  = put(x.left,  key, val);
        else if (cmp > 0) x.right = put(x.right, key, val);
        else              x.val   = val;
        x.N = 1 + size(x.left) + size(x.right);
        return x;
    }

    /**
     * Tree height.
     *
     * Asymptotic worst-case running time using Theta notation: TODO Theta(N). The whole tree needs to be searched in order to find the height.
     * To search each node takes N times as there are N nodes in the tree. Height calls the recursive method heightDfs N times to find the height.
     * To find the depth of the tree, heightDfs needs to search the entire tree to find the deepest node, as a tree contains N nodes, the search takes
     * N times.
     *
     * @return the number of links from the root to the deepest leaf.
     *
     * Example 1: for an empty tree this should return -1.
     * Example 2: for a tree with only one node it should return 0.
     * Example 3: for the following tree it should return 2.
     *   B
     *  / \
     * A   C
     *      \
     *       D
     */
    private void heightDfs(Node node, int currDepth) {
		if(node.left!=null)
		{
			heightDfs(node.left, currDepth+1);
		}
		if (node.right!= null)
		{
			heightDfs(node.right, currDepth+1);
		}
		if (currDepth > this.maxDepth)
		{
			this.maxDepth = currDepth;
		}
	}
    
    public int height() {
    	if(root == null)
    	{
    		return -1;
    	}
    	this.heightDfs(this.root, 0);
    	return this.maxDepth;
    }

    /**
     * Median key.
     * If the tree has N keys k1 < k2 < k3 < ... < kN, then their median key 
     * is the element at position (N+1)/2 (where "/" here is integer division)
     *
     * @return the median key, or null if the tree is empty.
     */
    private void medianDfs(Node node) {
    	
		if(node.left!=null)
		{
			medianDfs(node.left);
		}
		list.add(node.val);
		if (node.right!= null)
		{
			medianDfs(node.right);
		}
	}
    public Key median() {	//dfs put vals in list find median pos then get from list
      //TODO fill in the correct implementation. The running time should be Theta(h), where h is the height of the tree.
    	if(root == null)
    	{
    		return null;
    	}
    	medianDfs(root);
    	medPos = (this.list.size()-1) / 2;
    	median = (Key) list.get(medPos);
    			
      return median;
    }


    /**
     * Print all keys of the tree in a sequence, in-order.
     * That is, for each node, the keys in the left subtree should appear before the key in the node.
     * Also, for each node, the keys in the right subtree should appear before the key in the node.
     * For each subtree, its keys should appear within a parenthesis.
     *
     * Example 1: Empty tree -- output: "()"
     * Example 2: Tree containing only "A" -- output: "(()A())"
     * Example 3: Tree:
     *   B
     *  / \
     * A   C
     *      \
     *       D
     *
     * output: "((()A())B(()C(()D())))"
     *
     * output of example in the assignment: (((()A(()C()))E((()H(()M()))R()))S(()X()))
     *
     * @return a String with all keys in the tree, in order, parenthesized.
     * 
     */
    
    private String keyString = "";
    private void pprintKeysInOrder(Node node) {
    	keyString += "(";
    	if (node == null) {
    		keyString += ")";
    	}
    	else {
    		pprintKeysInOrder(node.left);
    		keyString += node.key;
    		pprintKeysInOrder(node.right);
        	keyString += ")";
    	}
    	
    	
    	
    }
    public String printKeysInOrder() {
      if (isEmpty()) return "()";
      // TODO fill in the correct implementation
      keyString = "";
      pprintKeysInOrder(root);
      return this.keyString;
    }
    
    /**
     * Pretty Printing the tree. Each node is on one line -- see assignment for details.
     *
     * @return a multi-line string with the pretty ascii picture of the tree.
     */
    
    private String pString = "";
    private void pprint(Node node, String prefix)
    {
    	if(node == null)
    	{
    		pString += prefix + "-null\n";
    	}
    	else
    	{
    		pString += prefix + "-" + node.key + "\n";
    		pprint(node.left, prefix + " |");
    		pprint(node.right, prefix + "  ");
    	}
    }
    
   
    public String prettyPrintKeys() {
      //TODO fill in the correct implementation.
    	if (isEmpty()) return "-null\n";
    	pString = "";
    	pprint(root, "");
      return pString;
    }
    public Node getParentNode(Key key) {
    	
		return getParentNode(root, key);
    	
    }
    private Node getParentNode(Node node, Key key) {
    	if(node.left == null && node.right == null) return null;
    	if(node.left != null)
    	{
    		if(node.left.key == key)
    		{
    			return node;
    		}
    	}
    	if(node.right != null)
    	{
    		if(node.right.key == key)
    		{
    			return node;
    		}
    	}
    	int cmp = key.compareTo(node.key);
        if      (cmp < 0) return getParentNode(node.left, key);
        else return getParentNode(node.right, key);
    }

    /**
     * Deteles a key from a tree (if the key is in the tree).
     * Note that this method works symmetrically from the Hibbard deletion:
     * If the node to be deleted has two child nodes, then it needs to be
     * replaced with its predecessor (not its successor) node.
     *
     * @param key the key to delete
     */
    private Node rightMost(Node node)
    {
    	if(node.right == null)
    	{
    		return node;
    	}
    	return rightMost(node.right);
 	
    	
    }
    	   	
    	    	
    
    public void delete(Key key) {
    	
    	if (root == null) return;
    	Node parent = getParentNode(key);
    	//delete root
    	if(parent == null && root.key != key)
    	{
    		System.out.println("Returning!");
    		return;
    	}
    	Node toDelete;
    	if(root.key == key)
    	{
    		toDelete = root;
    	}
    	if(parent.key.compareTo(key) < 0 ) {
    		toDelete = parent.right;
    	}
    	else
    	{
    		toDelete = parent.left;
    	}
    	
    	System.out.println("To delete: " + toDelete.key);
    	//to delete has no children checks marent's right children until match is found
    	if(toDelete.left == null && toDelete.right == null)
    	{
    		
    		if (parent.key.compareTo(key) < 0) parent.right = null;
    		else parent.left = null;
    	}
    	else if(toDelete.left == null)
    	{
    		if(toDelete == root) root = root.right;
    		else parent.left = toDelete.right;
    	}
    	else if(toDelete.right == null)
    	{
    		System.out.println("Deleting " + toDelete.key);
    		System.out.println("Parent " + parent.key);
    		if(toDelete.key == root.key) root = root.left;
    		else parent.right = toDelete.left;
    	}
    	else
    	{
    		if(toDelete.left.right != null)
    		{
    			Node replacement = rightMost(toDelete.left);
        		Node rParent = getParentNode(replacement.key);
        		toDelete.key = replacement.key;
        		toDelete.val = replacement.val;
        		rParent.right = null;
    		}
    		else
    		{
    			if(toDelete.key == root.key) root = root.left;
        		else parent.left = toDelete.left;
    		}
    		
    		
    	}	
    	
    }

    
    
}

	

//2hrs
//30mins
//2hrs
//3hrs 10mins
//1hr
//1hr
//2hrs
//2hrs
//1hr
//2hrs
//1hr