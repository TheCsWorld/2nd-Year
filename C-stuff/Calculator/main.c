/*This program reads in a text file of characters to calculate them
   and outputs the result. */
#include <stdio.h>
#include <stdlib.h>
//#include<math.h>

int split_file();
//linklist
typedef struct listnode {
	int data;
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
void addDataToFrontOfList(struct list * this, int data){ //pushes value onto stack
	struct listnode * node = malloc (sizeof(struct listnode));
		node->data=data;
		node->next=this->head;
		this->head=node;
}
//pop function
int pop(struct list * this)
{
	int result;
	result = this->head->data;
	this->head=this->head->next;
	return result;
}
//reads in file
int main() {
	FILE *fp;     //file pointer
	fp = fopen("input.txt", "r"); //opens file
	struct list * stackP = newList();//stack pointer
    char inputs;                   //characters in file
	while((inputs = fgetc(fp))!= EOF) //reads file contents
    {
		int value;			//current value
		int firstNum;
		int secondNum;
		int result;
        printf("%c", inputs);

		if(inputs >= '0' && inputs <= '9')
		{
			value = inputs - 30;
		}
		else if(inputs == ' ')
		{
			addDataToFrontOfList(stackP, value);
		}
		else if(inputs == '+')		//adds two numbers and prints result
		{
			firstNum = pop(stackP);
			secondNum = pop(stackP);
			result = secondNum + firstNum;
			printf("%d", result);
		}
		else if(inputs == '-')		//subtracts two numbers and prints result
		{
			firstNum = pop(stackP);
			secondNum = pop(stackP);
			result = secondNum - firstNum;
			printf("%d", result);
		}
		else if(inputs == '*' || inputs == 'X' || inputs == 'x')		//multiplies two numbers and prints result
		{
			firstNum = pop(stackP);
			secondNum = pop(stackP);
			result = secondNum * firstNum;
			printf("%d", inputs);
		}
		else if(inputs == '/')		//divides two numbers and prints result
		{
			firstNum = pop(stackP);
			secondNum = pop(stackP);
			result = secondNum / firstNum;
			printf("%d", inputs);
		}
    }





}
