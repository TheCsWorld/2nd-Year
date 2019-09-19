/*This program reads in a text file of characters to calculate them
   and outputs the result. */

#include <stdio.h>
#include <stdlib.h>
#include<math.h>
#include <string.h>

int split_file();



//linklist
typedef struct listnode {
	double data;
	struct listnode * next;
};

struct list {			
	struct listnode * head;
};

struct list * newList()
{
	struct list * result;
	result = malloc(sizeof(struct list));
    result->head = NULL;    //points to first value in list
	return result;
};

//pushes data to top of stack
void addDataToFrontOfList(struct list * this, double data){ //pushes value onto stack
	struct listnode * node = malloc (sizeof(struct listnode));  
		node->data=data;
		node->next=this->head;
		this->head=node;
		printf("push %f %f \n", data, this->head->data);
}

//pop data from top of stack
double pop(struct list * this)
{
	double result;
	result = this->head->data;		
	this->head=this->head->next;
	printf("pop %f \n", result);
	return result;
}

typedef struct charlistnode {
	char data;
	struct charlistnode * next;
};

struct charlist {			
	struct charlistnode * head;
};

struct charlist * newCharList()
{
	struct charlist * result;
	result = malloc(sizeof(struct charlist));
    result->head = NULL;    //points to first value in list
	return result;
};

//pushes data to top of stack (char)
void addDataToFrontOfCharList(struct charlist * this, char data){ //pushes value onto stack
	struct charlistnode * node = malloc (sizeof(struct charlistnode));  
		node->data=data;
		node->next=this->head;
		this->head=node;
		printf("push %c %c \n", data, this->head->data);
}

//pop data from top of stack (char
char cpop(struct charlist * this)
{
	char result = 0;
	if(this->head!=NULL)
	{
		result = this->head->data;		
		this->head=this->head->next;
		printf("pop %c \n", result);
	}
	return result;
}
//look at stack (char)
char peek(struct charlist * this)
{
	if(this->head == NULL)
	{
		return 0;
	}
	char result;
	result = this->head->data;		
	return result;
}

int calculatePrecedence(char op)
{
	int currentop = 0;
 			 	 
 	if(op == '+' || op == '-')
 	{
 		currentop = 1;	
 	}
	else if(op == '*' || op == '/' || op == 'x' || op == 'X')
	{
	currentop = 2;	
	}
	else if(op == '^')
	{
	currentop = 3;
	}
	return currentop;
}
//calculates sums in postfix 
double postfix(int size, char inputs[], int i)
{
fprintf(stderr, "start |%s| |%d|\n", inputs, size);
		struct list * stackP = newList();//stack pointer (double)
		double firstNum;
		double secondNum;
		double result;
		
			while(inputs[i]!= '\0')
   			 {
				double value;			//current value 
				
        		printf("current char |%c| %d %d \n", inputs[i], inputs[i], i);
				if(inputs[i] >= '0' && inputs[i] <= '9')
				{
					printf("Got number \n");
					int i2 = i + 1;
					while(inputs[i2] >= '0' && inputs[i2] <= '9')
					{
						i2++;
						
					}
						int arrlength = i2-i;
						char temp[arrlength + 1];	//might neeed malloc
						int j;
						for(j = 0; j < arrlength; j++)
						{
							temp[j] = inputs[i+j];
						}
						temp[arrlength] = '\0';
						double d = atof(temp);
						fprintf(stderr, "g %f \n", d);
						addDataToFrontOfList(stackP, d);
						fprintf(stderr, "p %f \n", d);
						i = i2;
				} 
			
				 
				else if(inputs[i] == ' ' || inputs[i] == '\n')
				{
					i++;
				}
				else if(inputs[i] == '+')		//adds two numbers and prints result
				{
					firstNum = pop(stackP);
					secondNum = pop(stackP);
					result = secondNum + firstNum;
					printf("\n + %f", result);
					addDataToFrontOfList(stackP, result);
					i++;
				} 
				else if(inputs[i] == '-')		//subtracts two numbers and prints result
				{	
					firstNum = pop(stackP);
					secondNum = pop(stackP);
					result = secondNum - firstNum;
					printf("\n - %f", result);
					addDataToFrontOfList(stackP, result);
					i++;	
				}
				else if(inputs[i] == '*' || inputs[i] == 'X' || inputs[i] == 'x')		//multiplies two numbers and prints result
				{		
					firstNum = pop(stackP);
					secondNum = pop(stackP);
					result = secondNum * firstNum;	
					printf("\n * %f %f %f", firstNum, secondNum, result);
					addDataToFrontOfList(stackP, result);
					i++;
				}
				else if(inputs[i] == '/')		//divides two numbers and prints result
				{	
					firstNum = pop(stackP);
					secondNum = pop(stackP);
					result = secondNum / firstNum;
					printf("\n / %f", result);	
					addDataToFrontOfList(stackP, result);
					i++;
				}
			}
    		
		result =pop(stackP);
		
		return result;
}
//converts from infix to postfix
char * infix(int size, char inputs[], int i)
{

struct charlist * cstackP = newCharList(); //stack pointer (char)
			
			char * outString = malloc(sizeof(char)*1000);
			int outStringCount = 0;
			char operator;
	while(inputs[i] != '\0')
	{
			printf("Input: %c\n", inputs[i]);
			if (inputs[i] >= '0' && inputs[i] <= '9') 
			{
    			//add number to the output string
    			outString[outStringCount] = inputs[i];
    			outStringCount++;
  			}
  			//add negative number to output string
  			else if(inputs[i]== '-' && inputs[i+1] >= '0' && inputs[i+1] <= '9')
  			{
  				outString[outStringCount] = inputs[i];
    			outStringCount++;
  			}	
  			else if(inputs[i] == ' ')
  			{
  				outString[outStringCount] = ' ';
    			outStringCount++;
  			}	
  			//add right bracket to stack
  			else if (inputs[i] == '(') 
  			{
    			addDataToFrontOfCharList(cstackP, inputs[i]);
  			}
  			//checks operator precedence
 			else if ( inputs[i] == '+' || inputs[i] == '-' || inputs[i] == '*'||inputs[i] == 'x' || inputs[i] == '/' || inputs[i] == 'X' || inputs[i] == '^' ) 
 			{
 				 char stacktop = peek(cstackP);
 			 	 int highestop =calculatePrecedence(stacktop);
 			 	 int currentop =calculatePrecedence(inputs[i]);
 			 	 fprintf(stderr, "1: %d %d %d %c\n", highestop, currentop, stacktop, stacktop);
 			 	 if(highestop <= currentop)
 			 	 {
 			 	 	highestop = currentop;
 			 	 }
   				 while ( currentop < highestop && stacktop != '(') 
   				 {
      				//pop stack and add popped operator to output string
      				outString[outStringCount] = ' ';
    				outStringCount++;
      				operator= cpop(cstackP);
      				outString[outStringCount] = operator;
    				outStringCount++;
    				outString[outStringCount] = ' ';
    				outStringCount++;
    				stacktop = peek(cstackP);
 			 	 	highestop =calculatePrecedence(operator);
 			 	 	currentop =calculatePrecedence(inputs[i]);
 			 	 	fprintf(stderr, "1: %d %d %d %c\n", highestop, currentop, operator, operator);
    			 }
    			//push operator to stack
    			addDataToFrontOfCharList(cstackP, inputs[i]);
  			}
 			 else if ( inputs[i] == ')' ) 
 			 {
 			 	operator = cpop(cstackP);
    			while ( operator != '(' ) 
    			{
     			// pop operator from stack and add to output string
   				// pop left bracket
   					outString[outStringCount] = ' ';
    				outStringCount++;
   					outString[outStringCount] = operator;
    				outStringCount++;
    				outString[outStringCount] = ' ';
    				outStringCount++; 
    				operator = cpop(cstackP);
  				}
			 }
			 
				 printf("Has: %s\n", outString);
				 i++;
	}
				char op = cpop(cstackP);
			 while(op != 0)
			 {
			 	outString[outStringCount] = ' ';
    			outStringCount++;
      			outString[outStringCount] = op;
    			outStringCount++;
    			outString[outStringCount] = ' ';
    			outStringCount++;
    			op = cpop(cstackP);
			 }
				outString[outStringCount] = '\0';
			 	printf("Out: %s\n", outString);
			 	
			 	return outString;
}

//reads in file
int main(int argc, char ** argv) {
	char * filename;

  if ( argc == 1 ) {
    printf("Error: No input filename provided\n");
    printf("Usage: %s <input filename>\n", argv[0]);
    exit(1);
  }
  else if ( argc > 2 ) {
    printf("Error: Too many command line parameters\n");
    printf("Usage: %s <input filename>\n", argv[0]);
    exit(1);
  }
  else {
    filename = argv[1];
  }
  
  	char outFile[1000];
  	int inputFileLen = strlen(filename);
  	for(int j = 0; j < inputFileLen; j++)
  	{
  	outFile[j] = filename[j];
  	}
  	outFile[inputFileLen] = '.';
  	outFile[inputFileLen + 1] = 'r';
  	outFile[inputFileLen + 2] = 'e';
  	outFile[inputFileLen + 3] = 's';
  	outFile[inputFileLen + 4] = 'u';
  	outFile[inputFileLen + 5] = 'l';
  	outFile[inputFileLen + 6] = 't';
  	outFile[inputFileLen + 7] = 's';
  	outFile[inputFileLen + 8] = '\0';
  	FILE * outFileP = f_open(outFile, "w");    
	FILE *fp;     //file pointer
	fp = fopen(filename, "r"); //opens file
	int const size = 1000;
    char inputs[size]; //characters in file
	char * eof;  		//file pointer
	int i = 0;
	char * outString;

	//struct list * stackP = newList();//stack pointer (double)
	
	                
	eof = fgets(inputs, size, fp);	//reads file contents and puts into array
	if ( eof != NULL) 
	{
		printf("%s", inputs);
		if(inputs[0] == 'p' && inputs[1] == 'o' && inputs[2] == 's' && inputs[3] == 't' && inputs[4] == 'f' && inputs[5] == 'i' && inputs[6] == 'x')
		{
			i+=7;
			double result = postfix(size, inputs, i);
			//postfix(size, inputs, i);
			printf("Result:  %f\n", postfix(size, inputs, i));
			fprintf(outFileP, "%s\n", inputs);
			fprintf(outFileP, "%f\n", result);
		}
//check to see if input is infix and converts
		else if(inputs[0] == 'i' && inputs[1] == 'n' && inputs[2] == 'f' && inputs[3] == 'i' && inputs[4] == 'x')
		{
		printf("B\n");
			i+=5;			
			outString = infix(size, inputs, i);	
			postfix(strlen(outString), outString, 0);
		}
		else
	 	{
			printf("Incompatible request \n");
	  	}	
	}
	
			//print final result
}




