
#define NUM 5 /* Number of philosophers, and forks! */

/* We want to record which philosopher is holding which fork */
/*  fork[NUM][NUM] where fork[p][f] is true if 'p' holds 'f' */

bool Fork[NUM*NUM]; /* 2-d arrays not supported, so ... */

#define FORK(p,f) Fork[NUM*p+f]
#define leftFork(p) (p%NUM)
#define rightFork(p) ((p+1)%NUM)
#define myForkOnly(p,f) !(    FORK(((p+1)%NUM),f) \
                           || FORK(((p+2)%NUM),f) \
                           || FORK(((p+3)%NUM),f) \
                           || FORK(((p+4)%NUM),f) )

/*put starvation check in here*/
bool fed;
bool start_think;
 ltl fed { []<>(start_think implies fed) };  /* starvation check: if not thinking it means phil is not eating but if thinking then will eventually eat*/
/*ltl starve {![]<>(myForkOnly(p, lfork) && myForkOnly(p, rfork))};*/
/*ltl tp {think -> []<>progress_eat};*/

active [NUM] proctype phil()
{ int p, lfork, rfork ;
  p = _pid;
  lfork = leftFork(p);
  rfork = rightFork(p);

	start_think = true;
  think: printf("P%d thinks..\n",_pid);
	atomic{
		if				/*~~~~fork not taken*/
  		::(myForkOnly(p,lfork)) ->	firstfork:  FORK(p,lfork) = true;
  		fi
	}
	atomic{
  		if
  		::(myForkOnly(p,rfork)) ->	secondfork: FORK(p,rfork) = true;
  		fi
	}

	
   
  assert(myForkOnly(p,lfork));
  assert(myForkOnly(p,rfork));
  fed = true;
  progress_eat: printf("P%d eats!\n",_pid);
  dropfork1: FORK(p,lfork) = false;
  dropfork2: FORK(p,rfork) = false;
  goto think


}










