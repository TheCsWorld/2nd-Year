
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "cond.c"

int pnum;  // number updated when producer runs.
int csum;  // sum computed using pnum when consumer runs.
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;	//~mutex
pthread_cond_t sconsumer; 	//~condition
pthread_cond_t sproducer; 	//~condition
int count;				//~counter

int (*pred)(int); // predicate indicating number to be consumed

int produceT() {
  pthread_mutex_lock(&mutex);	//~producer takes control of resource using mutex
  
	while (count)		//~wait if count>0
	{
		pthread_cond_wait(&sproducer, &mutex);
	}
		//~take in number producer
		assert(!count);
		scanf("%d",&pnum);	
		
		count++;
		pthread_cond_signal(&sconsumer);
		pthread_mutex_unlock(&mutex);
  return pnum;
}

void *Produce(void *a) {
  int p;

  p=1;
  while (p) {
    printf("producer thinking...\n");
    sleep(1);
    printf("..done!\n");
    p = produceT();
    printf("PRODUCED %d\n",p);
  }
  printf("EXIT-P\n");
	
	pthread_cond_destroy(&sproducer);
	pthread_mutex_destroy(&mutex);
}


int consumeT() {
   

	pthread_mutex_lock(&mutex);//~consumer takes control of resource using mutex
  while(!count){		
  	pthread_cond_wait(&sconsumer, &mutex);
  }
  		//~take in number consumer
		assert(count);
		if ( pred(pnum) ) {
		csum += pnum;
		}

		count--;
		pthread_cond_signal(&sproducer);
		pthread_mutex_unlock(&mutex);

 
  return pnum;
}

void *Consume(void *a) {
  int p;

  p=1;
  while (p) {
    printf("consumer thinking...\n");
    sleep(rand()%3);
    printf("..done!\n");
    p = consumeT();
    printf("CONSUMED %d\n",csum);
  }
  printf("EXIT-C\n");
	pthread_cond_destroy(&sconsumer);
	pthread_mutex_destroy(&mutex);
}


int main (int argc, const char * argv[]) {
  // the current number predicate
  static pthread_t prod,cons;
	long rc;
	int ret;		//~value to initialise
	
	ret = pthread_cond_init(&sproducer, NULL);		//~initialise condition
	ret = pthread_cond_init(&sconsumer, NULL); 		//~initialise condition
	count = 0;		//~initialise count

  pred = &cond1;
  if (argc>1) {
    if      (!strncmp(argv[1],"2",10)) { pred = &cond2; }
    else if (!strncmp(argv[1],"3",10)) { pred = &cond3; }
  }


  pnum = 999;
  csum=0;
  srand(time(0));

  printf("Creating Producer:\n");
 	rc = pthread_create(&prod,NULL,Produce,(void *)0);
	if (rc) {
			printf("ERROR return code from pthread_create(prod): %ld\n",rc);
			exit(-1);
		}
  printf("Creating Consumer:\n");
 	rc = pthread_create(&cons,NULL,Consume,(void *)0);
	if (rc) {
			printf("ERROR return code from pthread_create(cons): %ld\n",rc);
			exit(-1);
		}

	pthread_join( prod, NULL);
	pthread_join( cons, NULL);


  printf("csum=%d.\n",csum);

  return 0;
}
