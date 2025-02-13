#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>
#include<stdlib.h>

int main()
{
  int pid = 0;
  if(fork() == 0) //child process
  

  {
    int pid = getpid();
    printf("[child] pid %d from [parent] pid %d\n",getpid(),getppid());
    exit(1);
  }

  int status;
  waitpid(pid, &status, 0);
  if ( WIFEXITED(status) ){
    int exit_status = WEXITSTATUS(status); //exit_status variable store the
    printf("Exit status of the child was %d\n", exit_status);
  }
}
