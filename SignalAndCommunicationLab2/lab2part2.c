// lab2part2.c
// Alex Johnson
// 2/14/2025
// for cs321 lab 2 

#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/wait.h>

void sigReporter(int);
void sigHandler(int);

int main()
{ 

  int	pid = fork();	
  signal(SIGINT, sigHandler);	
	if(pid == 0) 
	{
    printf("Forked %d, into child %d\n", getppid(), getpid());
    int ppid = getppid(); 
		while(1)
		{
			int r = (rand() % 6) + 1; 
			if((r%2 == 0))
			{
          kill(ppid, SIGUSR1);
			}
			else
			{ 
        kill(ppid, SIGUSR2);
			} 	
			sleep(r);  	
		}
	}
  else if(pid < 0) 
  {
    printf("Fork() failed to create a thread\n");
    exit(1);
  } 
  else
  {
	  signal(SIGUSR1, sigReporter);
	  signal(SIGUSR2, sigReporter);
	  wait(NULL);
  } 
}
void sigReporter(int sigNum)
{ 
  printf("Recieved signal %d, ", sigNum);
  if(sigNum == SIGUSR1) 
  { 
    printf("SIGUSR1\n");
  } 
  else if(sigNum == SIGUSR2)
  {
    printf("SIGUSR2\n");
  } 
}
void sigHandler(int sigNum)
{
  printf("Exitting process %d, child of %d\n", getpid(),getppid());
  exit(0);

}
