import java.util.Stack;

// -------------------------------------------------------------------------
/**
 *  Utility class containing validation/evaluation/conversion operations
 *  for prefix and postfix arithmetic expressions.
 *
 *  @author  Chloe Conneely 17323080
 *  @version 1/12/15 13:03:48
 */

public class Arith 
{


  //~ Validation methods ..........................................................


  /**
   * Validation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals hopefully in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in prefix notation, and false otherwise.
   **/
	/*
	 * The run time is O(N). This method iterates through the array and decides if the element 
	 * is a number, an operator or an invalid element. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. O(N) + O(1) This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array and the counter. 
	 */
  public static boolean validatePrefixOrder(String prefixLiterals[])
  {
	  int counter = 1;
	  for(int i=0; i<prefixLiterals.length; i++) {
		  if(prefixLiterals[i].equals("+") || prefixLiterals[i].equals("*") || 	//if operator increase counter
		     prefixLiterals[i].equals("-") || prefixLiterals[i].equals("/")) {
			  counter+=1;
		  }
		  else {
			  try {												//check for invalid inputs (chars)
				  Integer.parseInt(prefixLiterals[i]);
				  counter-=1;
				  if(i!=prefixLiterals.length - 1 && counter<=0) {
					  return false;
				  }
			  } catch (NumberFormatException e) {
				  return false;
			  }
		  }
	  }
	  if(counter>0)
	  {
		  return false;
	  }
	  return true;
  }
  
  public static String[] reverse(String[] input) {
	  String temp;
	  for(int i=0; i<input.length/2; i++)
	  {
		  temp = input[i];
		  input[i] = input[input.length - i - 1];
		  input[input.length - i - 1] = temp;
	  }
	  return input;
  }


  /**
   * Validation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals hopefully in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in postfix notation, and false otherwise.
   **/
  	/*
	 * The run time is O(N). This method calls the reverse method which reverses the order of the
	 * array which is O(N/2) as it iterates through the array but swaps the elements in the array
	 * rather than moving them to a new array in the reversed order. The array is now in prefix order
	 * and the reverse method calls validatePrefixOrder. validatePrefixOrder iterates through 
	 * the array and decides if the element is a number, an operator or an invalid element.
	 * Iterating through the array takes O(N) times as there are N elements in an array.
	 * Each if statement takes O(1) times as there is only one action. O(N) + O(N/2) + O(1) 
	 * This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array and the counter.
	 */
  public static boolean validatePostfixOrder(String postfixLiterals[])
  {
	  return validatePrefixOrder(reverse(postfixLiterals));
	  
  }


  //~ Evaluation  methods ..........................................................


  /**
   * Evaluation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  	/*
  	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. O(N) + O(1) This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
  	 */
  public static int evaluatePrefixOrder(String prefixLiterals[])
  {
	  Stack<Integer> postfixStack = new Stack<>();
	  int firstNum = 0;
	  int secondNum = 0;
	  int total = 0;
	  for(int i=prefixLiterals.length-1; i>=0; i--) {
		if(prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*" || prefixLiterals[i] == "/") {
			firstNum = postfixStack.pop();
			secondNum = postfixStack.pop();
			if(prefixLiterals[i] == "+") {
				total = firstNum + secondNum;
			}
			else if(prefixLiterals[i] == "-") {
				total = firstNum - secondNum;
			}
			else if(prefixLiterals[i] == "*") {
				total = firstNum * secondNum;
			}
			else if(prefixLiterals[i] == "/") {		//???????
				total = firstNum / secondNum;
			}
			postfixStack.push(total);
			
		}
		else {
			Integer.parseInt(prefixLiterals[i]);
			postfixStack.push(Integer.parseInt(prefixLiterals[i]));
		}
		//System.out.println(postfixStack.toString());
	  }
	  return total;
  }


  /**
   * Evaluation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  	/*
	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. Pushing and popping on the stack takes O(1) times as there is only one action. O(N) + O(1)
	 *  This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
	 */
  public static int evaluatePostfixOrder(String postfixLiterals[])
  {
	  Stack<Integer> postfixStack = new Stack<>();
	  int firstNum = 0;
	  int secondNum = 0;
	  int total = 0;
	  for(int i=0; i<postfixLiterals.length; i++) {
		if(postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*" || postfixLiterals[i] == "/") {
			firstNum = postfixStack.pop();
			secondNum = postfixStack.pop();
			if(postfixLiterals[i] == "+") {
				total = secondNum + firstNum;
			}
			else if(postfixLiterals[i] == "-") {
				total = secondNum - firstNum;
			}
			else if(postfixLiterals[i] == "*") {
				total = secondNum * firstNum;
			}
			else if(postfixLiterals[i] == "/") {		//?????? 
				System.out.println("Dividing");
				total = secondNum / firstNum;
			}
			postfixStack.push(total);
		}
		else {
			Integer.parseInt(postfixLiterals[i]);
			postfixStack.push(Integer.parseInt(postfixLiterals[i]));
		}
	  }
	  return total;
  }


  //~ Conversion  methods ..........................................................


  /**
   * Converts prefix to postfix.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in postfix order.
   **/
  	/*
	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. Pushing and popping on the stack takes O(1) times as there is only one action. O(N) + O(1)
	 * This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
	 */
  public static String[] convertPrefixToPostfix(String prefixLiterals[])
  {
	  Stack<String> operandStack = new Stack<>();
	  String temp = "";
	  for(int i = prefixLiterals.length-1; i>=0; i--) {
		  if(prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*" || prefixLiterals[i] == "/") {
			 temp = operandStack.pop() + " " + operandStack.pop() + " " + prefixLiterals[i];
			 operandStack.push(temp);
		  }
		  else {
			  operandStack.push(prefixLiterals[i]);
		  }
	  }
	  return operandStack.pop().split(" ");
  }


  /**
   * Converts postfix to prefix.
   *
   * @param prefixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in prefix order.
   **/
  	/*
	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. Pushing and popping on the stack takes O(1) times as there is only one action. O(N) + O(1)
	 * This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
	 */
  public static String[] convertPostfixToPrefix(String postfixLiterals[])
  {
	  Stack<String> operandStack = new Stack<>();
	  String op1, op2;
	  String temp;
	  for(int i = 0; i<postfixLiterals.length; i++) {
		  if(postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*" || postfixLiterals[i] == "/") {
			  op1 = operandStack.pop();
			  op2 = operandStack.pop();
			  temp = postfixLiterals[i] + " " + op2 + " " + op1;
			  operandStack.push(temp);
		  }
		  else {
			  operandStack.push(postfixLiterals[i]);
		  }
	  }
	  return operandStack.pop().split(" ");
  }

  /**
   * Converts prefix to infix.
   *
   * @param infixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
  	/*
	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. Pushing and popping on the stack takes O(1) times as there is only one action. O(N) + O(1)
	 * This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
	 */
  public static String[] convertPrefixToInfix(String prefixLiterals[])
  {
	  Stack<String> operandStack = new Stack<>();
	  String op1, op2;
	  String temp;
	  for(int i=prefixLiterals.length-1; i>=0; i--) {
		  if(prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*" || prefixLiterals[i] == "/") {
			  
			  op1 = operandStack.pop(); 
			  op2 = operandStack.pop();
			  temp =  "( " + op1 + " "  + prefixLiterals[i] + " " + op2 + " )";
			  operandStack.push(temp);
		  }
		  else {
			  operandStack.push(prefixLiterals[i]);
		  }
	  }
	  return operandStack.pop().split(" ");
  }

  /**
   * Converts postfix to infix.
   *
   * @param infixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
  	/*
	 * The run time for this method is O(N). This method iterates through the array and decides if the element 
	 * is a number or an operator. Iterating through the array takes O(N) times
	 * as there are N elements in an array. Each if statement takes O(1) times as there is only one
	 * action. Pushing and popping on the stack takes O(1) times as there is only one action. O(N) + O(1)
	 * This gets simplified to O(N) overall as we disregard the lower order terms.
	 * I think my implementation is optimal with respect to both time and memory usage as memory is only
	 * used for the string array by pushing and popping elements on and off the stack.  
	 */
  public static String[] convertPostfixToInfix(String postfixLiterals[])
  {
	  Stack<String> operandStack = new Stack<>();
	  String op1, op2;
	  String temp;
	  for(int i=0; i<postfixLiterals.length; i++) {
		  if(postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*" || postfixLiterals[i] == "/") {
			  
			  op1 = operandStack.pop();
			  op2 = operandStack.pop();
			  temp =  "( " + op2 + " "  + postfixLiterals[i] + " " + op1 + " )";
			  operandStack.push(temp);
		  }
		  else {
			  operandStack.push(postfixLiterals[i]);
		  } 
	  }
	  return operandStack.pop().split(" ");
  }



}



/*
 * Research:
 * The data structures I used are stacks and arrays.
 * The stack is used in evaluatePrefixOrder, evaluatePostfixOrder, convertPrefixToPostfix, convertPostfixToPreFix
 * convertPrefixToInfix and convertPostfixToInfix.
 * The run time of each stack is O(1) for the actions push and pop. This information is found in the lecture 5 
 * slides
 * The array is used in all methods as each method uses a string array to carry out the operations of 
 * validation, evaluation and conversion of prefix and postfix expressions
 * The run time of each array is O(N) in validation as validation requires iterating through the array and 
 * checking each element is valid. The run time of each array is O(N) in evaluation as evaluation requires
 * iterating through the array and carrying out mathematical operations on the expressions. The run time of
 * each array is O(N) in conversion as conversion requires iterating through the array and changing the 
 * structure of the array to be postfix, prefix or infix. The runtime information can be fund in the lecture 4
 * slides.  
 */




