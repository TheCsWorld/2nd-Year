import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)

/*
 * Test class for Arith.java
 *  @author  Chloe Conneely 17323080
 */

public class ArithTest {

	//prefix tests
	@Test
	public void testValidPrefix() {
		//true
		String[] prefixLiterals = {"+", "-", "3", "4", "+", "2", "7"};	
		assertTrue(Arith.validatePrefixOrder(prefixLiterals)); 
		//counter>0, equal number of operators and numbers
		String[] prefixLiterals1 = {"*", "-", "3", "4", "/", "2"};
		assertFalse(Arith.validatePrefixOrder(prefixLiterals1));
		//counter<0,total operators two less than total numbers
		String[] prefixLiterals2 = {"+", "-", "3", "4", "2", "7"};
		assertFalse(Arith.validatePrefixOrder(prefixLiterals2));
		//invalid input, char
		String[] prefixLiterals3 = {"+", "-", "3", "4", "a", "7"};
		assertFalse(Arith.validatePrefixOrder(prefixLiterals3));
	}
	//postfix tests
	@Test
	public void testValidPostfix() {
		//true
		String[] postfixLiterals = {"7", "2", "+", "4", "3", "-", "+"};
		assertTrue(Arith.validatePostfixOrder(postfixLiterals));
		//counter>1, total operators two less than total numbers
		String[] postfixLiterals1 = {"7", "2", "+", "4", "3", "/"};
		assertFalse(Arith.validatePostfixOrder(postfixLiterals1));
		//counter<1, equal number of operators and numbers
		String[] postfixLiterals2 = {"7", "2", "+", "4", "3", "-", "+", "*"};
		assertFalse(Arith.validatePostfixOrder(postfixLiterals2));
		//invalid input, char
		String[] postfixLiterals3 = {"7", "v", "+", "4", "3", "-", "+"};
		assertFalse(Arith.validatePostfixOrder(postfixLiterals3));
	}
	@Test
	public void testEvaluatePrefix() {
		String[] prefixLiterals = {"*", "5", "-", "3", "4"};
		assertEquals(-5, Arith.evaluatePrefixOrder(prefixLiterals));
		String[] prefixLiterals1 = {"+", "4", "8"};
		assertEquals(12, Arith.evaluatePrefixOrder(prefixLiterals1));
		String[] prefixLiterals2 = {"/", "2", "2"};
		assertEquals(1, Arith.evaluatePrefixOrder(prefixLiterals2)); 
		
	}
	@Test
	public void testEvaluatePostfix() {
		String[] postfixLiterals = {"7", "2", "+"};
		assertEquals(Arith.evaluatePostfixOrder(postfixLiterals), 9);
		
		String[] postfixLiterals1 = {"3", "4", "-", "5", "*"};
		assertEquals(-5, Arith.evaluatePostfixOrder(postfixLiterals1));
		//div test 
		String[] postfixLiterals2 = {"3", "3", "/"};
		assertEquals(1, Arith.evaluatePostfixOrder(postfixLiterals2));
	}
	@Test
	public void testConvertPrefixToPostfix() {
		String[] prefixLiterals = {"-", "*", "/", "4", "3", "1", "2"};
		String[] postfixLiterals = {"4", "3", "/", "1", "*", "2", "-"};
		assertArrayEquals(postfixLiterals, Arith.convertPrefixToPostfix(prefixLiterals));
		
		String[] prefixLiterals1 = {"+", "2", "6"};
		String[] postfixLiterals1 = {"2", "6", "+"};
		assertArrayEquals(postfixLiterals1, Arith.convertPrefixToPostfix(prefixLiterals1));
		
	}
	@Test
	public void testConvertPostfixToPrefix() {
		String[] prefixLiterals = {"-", "*", "/", "4", "3", "1", "2"};
		String[] postfixLiterals = {"4", "3", "/", "1", "*", "2", "-"};
		assertArrayEquals(prefixLiterals, Arith.convertPostfixToPrefix(postfixLiterals));
		
		String[] prefixLiterals1 = {"+", "2", "6"};
		String[] postfixLiterals1 = {"2", "6", "+"};
		assertArrayEquals(prefixLiterals1, Arith.convertPostfixToPrefix(postfixLiterals1)); 
		
	}
	@Test
	public void testConvertPrefixToInfix() {
		String[] postfixLiterals = {"-", "+", "6", "5", "+", "4", "3"};
		String[] infixLiterals = {"(", "(", "6", "+", "5", ")", "-", "(", "4", "+", "3", ")", ")"};
		assertArrayEquals(infixLiterals, Arith.convertPrefixToInfix(postfixLiterals));
		
		String[] postfixLiterals1 = {"*", "6", "5"};
		String[] infixLiterals1 = {"(", "6", "*", "5", ")"};
		assertArrayEquals(infixLiterals1, Arith.convertPrefixToInfix(postfixLiterals1)); 
		
		String[] postfixLiterals2 = {"/", "6", "5"};
		String[] infixLiterals2 = {"(", "6", "/", "5", ")"};
		assertArrayEquals(infixLiterals2, Arith.convertPrefixToInfix(postfixLiterals2));
		
	}
	@Test 
	public void testConvertPostfixToInfix() {
		String[] postfixLiterals = {"6", "5", "+", "4", "3", "+", "-"};
		String[] infixLiterals = {"(", "(", "6", "+", "5", ")", "-", "(", "4", "+", "3", ")", ")"};
		assertArrayEquals(infixLiterals, Arith.convertPostfixToInfix(postfixLiterals)); 
		
		String[] postfixLiterals1 = {"6", "5", "*"};
		String[] infixLiterals1 = {"(", "6", "*", "5", ")"};
		assertArrayEquals(infixLiterals1, Arith.convertPostfixToInfix(postfixLiterals1)); 
		
		String[] postfixLiterals2 = {"6", "5", "/"};
		String[] infixLiterals2 = {"(", "6", "/", "5", ")"};
		assertArrayEquals(infixLiterals2, Arith.convertPostfixToInfix(postfixLiterals2));
	} 

}

/*
 * stack: push,pop
 * O(1) as shown in lecture 5
 * 
 * array O(N)
 * reverse string O)(N)/2
 * 
 * valid O(N)
 * 
 * eval O(N) uses O(1) but overall O(N)
 * 
 * convert O(N) uses O(1) but overall O(N)
 * 
 * Q7
 * valid Sape used for arr and counter O(N)
 * 
 * eval space used for arr 
 */
