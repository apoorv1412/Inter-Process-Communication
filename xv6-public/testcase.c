#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"  
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"

int main(int argc, char *argv[])
{
	int key = 2;  				//allots a key
	char* buff = (char *) malloc(6000);
	char* tmp1 = buff;

	/*
	attach the page to the current process. Virtual address is returned
	*/

	int va = attachpage(key);	

	/*
	Constructing the message, or the buffer
	'.' indicates end of buffer. Buffer is populated by 1s.
	*/
	for (int i = 0; i < 5000; ++i)
	{
		*buff = '1';
		buff++;
	}
	*buff = '.';


	int pid = fork();
	if (pid == 0)
	{

		//The child process reads

		int va2 = attachpage(key);
		readBuffer((char *) va2);
	}
	else
	{
		if (va != -1)
		{

			//The parent process writes

			char* x = (char *) va;
			
			/*
			Populate the buffer by null values, in this case, 'A'
			*/

			for (int i = 0; i < 4096; ++i)
		    {
		      *x = 'A';
		      x++;
		    }
			writeBuffer(tmp1, (char *) va);
		}
		wait();
	}

	exit();
}