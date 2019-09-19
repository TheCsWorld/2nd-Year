#include <stdio.h>
#include <stdlib.h>
#include "Constants.h"          //add your own .h files to program

//#define TESTS "box"      //defining a constant #define <name of constant> "value"  **also in Constants.h**

 int main()
 {
    int day = 0;
    float money = 0.01;
    while(day <= 31)
    {
        printf("on day %d your money is: %f \n ", day, money);
        money*=2;
        day++;
    }

      return 0;
 }


//Practice

//1.) printf practice
    /* printf("Hello world! \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nBOO!!!!!!!!\n");
     printf("Doo doo do doo doo \tNO!");
     printf("%s is a string\n", "the string"); // prints "the string" in %s position
     printf("There are %d trees\n", 7); //
     printf("%.1f is a number\n", 17.4444);
     int first = 40;
     int second = 9;
     int total = first-second;
     printf("%d is a number\n", total); //prints number
     */

//2.)  array practice
   /*  char arr [8] = "oooh ah";      // make size one longer than string
     printf("%s \n",arr);
     arr[2] = 'y';                  //'' to change element
     printf("%s \n", arr);

     char arr2 [] = "two two two";      //don't necessarily need to declare size
     printf("I love %s \n", arr2);

     strcpy(arr2, "three trees tee hee"); //change definition of an array
     printf("%s \n", arr2);
    */


//3.)   constants practice using Constants.h
    /*
    printf("Break the %s!\n", TESTS);

    printf("There are %s %s boxes.", BOXVAL, BOXNAME); // assume the constants are strings
    */

//4.)   scanf practice
    /*
    char name[20];
    char name2[20];
    int  people;

    printf("Who are you?\n");
    scanf("%s", name);

    printf("Who is that?\n");
    scanf("%s", name);          //can't use spaces in scanf, program will think it's over

    printf("How many are you?\n");
    scanf("%d", &people);               //need & for every type except arrays
   */

//5.) basic maths
   /* int num1 = 17;
    printf("The first number is: %d\n", num1);
    printf("After dividing 12: %d.%d\n", num1/12, num1%12);

    float num2 = 6.5;
    float num3 = 50.2;
    printf("After dividing the two: %f\n", num2/num3);
    */

 //6.) averages
     /*float a, b, c, av;
    a=2;
    b=4;
    printf("Enter a number:\n");
    scanf("%f", &c);
    av = (a+b+c)/3;
    printf("Average is: %f", av);
    */

//7.) typecasting
/* float av_profit;
     int price = 5;
     int sales = 40;
     int days_worked = 7;
     av_profit = ((float)price*(float)sales)/(float)days_worked;
     printf("Av profit: %f", av_profit);
*/
