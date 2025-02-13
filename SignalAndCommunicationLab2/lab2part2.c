#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/wait.h>

void sigHandler (int);

int main()
{ 

	signal(SIGUSR1, sigHandler);
	signal(SIGUSR2, sigHandler);

	int	pid = fork();
	
	if(pid == 0) 
	{
		while(1)
		{
			int r = (rand() % 6) + 1; 
			if((r%2 == 0))
			{
				raise(SIGUSR1);
			}
			else
			{ 
				raise(SIGUSR2);
			} 	
			sleep(r);  	
		}
	}  
	wait(NULL);

	
} 


void sigHandler(int sigNum)
{ 
	if(sigNum == SIGUSR1)
	{
		printf("SIGUSR1 recieved\n");
	}
	else if(sigNum == SIGUSR2)
	{ 
		printf("SIGUSR2 recieved\n");
	}  
} 

