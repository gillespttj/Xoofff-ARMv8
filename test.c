#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Xoodoo_times4.h"
#include "Xoodoo_times4ref.h"
#include "Xoodoo_times4sha.h"
#include "Xoodoo_times4no_sha.h"
#include "Xoodoo_times4classic.h"
#include "Xoodoo_times4decompose.h"
#include "Xoodoo_times1.h"
#include <math.h> //todelete
#include <time.h>

#define MAX_ROUNDS 1000000

		
void SixXoodoos(unsigned int *src, unsigned int *dest)
{
	//Xoodootimes4_Load4Interlace(src);
	Xoodootimes4_SixRounds(src, dest);
	//Xoodootimes4_Store4Deinterlace(dest);
}

void SixXoodoosNoSha(unsigned int *src, unsigned int *dest)
{
	Xoodootimes4_Load4InterlaceNoSha(src);
	Xoodootimes4_SixRoundsNoSha();
	Xoodootimes4_Store4DeinterlaceNoSha(dest);
}


int main(int argc, char *argv[])
{
	if(argc==2)
	{
		float startTime, endTime;
		int benchmark=0, decompose=0, Xoodoo4=0, Xoodoo4sha=0, Xoodoo4no_sha=0, Xoodoo4classic=0, 
			Xoodoo1=0, Xoodoo1ref=0;
		
		for(int i=1; i<argc; i++)
		{
			if(strstr(argv[i], "benchmark")) benchmark = 1;
			else if(strstr(argv[i], "decompose")) decompose = 1;
			else if(strstr(argv[i], "Xoodoo4")) Xoodoo4 = 1;
			else if(strstr(argv[i], "Xoodoo4sha")) Xoodoo4sha = 1;
			else if(strstr(argv[i], "Xoodoo4no_sha")) Xoodoo4no_sha = 1;
			else if(strstr(argv[i], "Xoodoo4classic")) Xoodoo4classic = 1;
			else if(strstr(argv[i], "Xoodoo1")) Xoodoo1 = 1;
			else if(strstr(argv[i], "Xoodoo1ref")) Xoodoo1ref = 1;
		}
		
		
		unsigned int* a = (unsigned int*) malloc(4*12*sizeof(unsigned int));
		//for (int i=0; i<4*12; i++) a[i] = i;// pow(2,16);
		for (int i=0; i<12; i++) a[i] = i;
		//a[0] = 1;// pow(2,17);
		
		/*a[0] = 0x1;
		a[1] = 0x0;
		a[2] = 0x0;
		a[3] = 0x0;
		a[4] = 0x0;
		a[5] = 0x0;
		a[6] = 0x0;
		a[7] = 0x0;
		a[8] = 0x0;
		a[9] = 0x0;
		a[10] = 0x0;
		a[11] = 0x0;
		*/
		
		unsigned int* b = (unsigned int*) malloc(4*12*sizeof(unsigned int));
		
		
		
		
		if(benchmark)
		{
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodoo_Permute_Nrounds((void*) b, 6);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of Xoodoo with reference C implementation : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes1_PermuteAll_6rounds(a, b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of Xoodoo with optimized implementation : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				SixXoodoos(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of 4 Xoodoos with interleaving using SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4_PermuteAll_6rounds(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of 4 Xoodoos without interleaving using SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
				
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				SixXoodoosNoSha(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of 4 Xoodoos with interleaving without SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
				
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4_SixRoundsClassic(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times 6 rounds of 4 Xoodoos without interleaving or SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
		}	
		
		
		
		if(decompose)
		{
			printf("Sub-timings for %d rounds of 4 Xoodoos with sha3 interlaced implementation:\n", MAX_ROUNDS);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				Xoodootimes4_Load(a);
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("Loading: %f \n", endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				Xoodootimes4_Interlace();
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("Interlacing: %f \n", endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				//Xoodootimes4_SixRounds_old();
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("Execution: %f \n", endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				Xoodootimes4_Deinterlace();
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("De-interlacing: %f \n", endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				Xoodootimes4_Store(b);
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("Storing: %f \n", endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
				nothing();
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("Nothing (reference): %f \n", endTime-startTime);
		}
		
			
		if (Xoodoo4) SixXoodoos(a,b); //interleaved optimized
		if (Xoodoo4sha) Xoodootimes4_PermuteAll_6rounds(a, b); //no interleaving but sha
		if (Xoodoo4no_sha) SixXoodoosNoSha(a,b); //interleaved but without sha instructions
		if (Xoodoo4classic) Xoodootimes4_SixRoundsClassic(a,b); // no interleaving, no sha instructions, but SIMD
		
		if (Xoodoo1) Xoodootimes1_PermuteAll_6rounds(a, b); //base implementation single Xoodoo
		
		if (Xoodoo1ref){
			memcpy(b, a, 4*12*sizeof(unsigned int));
			Xoodoo_Permute_Nrounds((void*) b, 6); //ref
		}
		
		
		// Result
		if (Xoodoo4 || Xoodoo4sha || Xoodoo4no_sha || Xoodoo4classic || Xoodoo1 || Xoodoo1ref){ 
			for (int i=0; i<12; i++){
				printf("%x %x:%x-%x:%x\n", i, b[4*i], b[4*i+1], b[4*i+2], b[4*i+3]);
			}
		}
		
		
		free(a);
		free(b);
		
	}
	else
	{
		printf("argument error\n");
	}
	return 0;

}






