#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "Xoodoo_times4ref.h"
#include "Xoodoo_times4sha_interleaving.h"
#include "Xoodoo_times4sha_no_interleaving.h"
#include "Xoodoo_times4no_sha_interleaving.h"
#include "Xoodoo_times4no_sha_no_interleaving.h"
#include "Xoodoo_times4decompose.h"
#include "Xoodoo_times1.h"
#include <math.h> //todelete
#include <time.h>
#include "timing.h"

#define MAX_ROUNDS 1000000
#define LONG 4999999999999999999

#define ten(a)		a;a;a;a;a;a;a;a;a;a
#define thousand(a)	ten(ten(ten(a)))
             

#define start_benchmark\
	benchClock = LONG;\
	for(int i=0; i<MAX_ROUNDS; i++){ \
	asm volatile("mrs %0, cntvct_el0" : "=r"(startClock));
	
#define end_benchmark\
	asm volatile("mrs %0, cntvct_el0" : "=r"(endClock)); \
	if(endClock-startClock<benchClock) benchClock = endClock-startClock;\
	}
	
	

int main(int argc, char *argv[])
{
	if(argc==2)
	{
		float startTime, endTime;
		int64_t startClock, endClock, benchClock;
		int benchmark=0, decompose=0, xoodoo4sha_interleave=0, xoodoo4sha_no_interleave=0, xoodoo4no_sha_interleave=0,
			xoodoo4no_sha_no_interleave=0, xoodoo1=0, xoodoo1ref=0, rollCi=0, rollCn=0, rollEn=0, rollEi=0, roll_benchmark=0, 
			first_roll_benchmark=0, help=0;
		
		for(int i=1; i<argc; i++)
		{
			if(strcmp(argv[1], "benchmark") == 0) benchmark = 1;
			else if(strcmp(argv[1], "roll_benchmark") == 0) roll_benchmark = 1;
			else if(strcmp(argv[1], "first_roll_benchmark") == 0) first_roll_benchmark = 1;
			else if(strcmp(argv[1], "decompose") == 0) decompose = 1;
			else if(strcmp(argv[1], "Xoodoo4si") == 0) xoodoo4sha_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4sn") == 0) xoodoo4sha_no_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4ni") == 0) xoodoo4no_sha_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4nn") == 0) xoodoo4no_sha_no_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo1") == 0) xoodoo1 = 1;
			else if(strcmp(argv[1], "Xoodoo1ref") == 0) xoodoo1ref = 1;
			else if(strcmp(argv[1], "rollCi") == 0) rollCi = 1;
			else if(strcmp(argv[1], "rollCn") == 0) rollCn = 1;
			else if(strcmp(argv[1], "rollEn") == 0) rollEn = 1;
			else if(strcmp(argv[1], "rollEi") == 0) rollEi = 1;
			else if(strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) help = 1;
			else printf("Wrong argument, type %s -h help.\n", argv[0]);
		}
		
		
		
		unsigned int* a = (unsigned int*) malloc(4*12*sizeof(unsigned int));
		//for (int i=0; i<4*12; i++) a[i] = i;// pow(2,16);
		//for (int i=0; i<12; i++) a[i] = i;
		
		for (int j=0; j<4; j++){
			for (int i=0; i<12; i++) a[12*j+i] = i;
		}
		
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
		
		unsigned int* k = (unsigned int*) malloc(4*12*sizeof(unsigned int)); 
			//4 for saving interleaved k value of k in rollEi
		
		for (int i=0; i<12; i++) k[i] = 3*i+1;//12-i;
		
		
		
		if(benchmark)
		{
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodoo_Permute_Nrounds((void*) b, 6);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of Xoodoo with reference C implementation : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes1_PermuteAll_6rounds(a, b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of Xoodoo with optimized implementation : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4sha_interleaving_6rounds(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of 4 Xoodoos with interleaving using SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
			
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4sha_no_interleaving_6rounds(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of 4 Xoodoos without interleaving using SHA3 instructions : %f \n", MAX_ROUNDS, endTime-startTime);
				
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4no_sha_interleaving_6rounds(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of 4 Xoodoos with interleaving without SHA3 instructions : %f \n", MAX_ROUNDS, endTime-startTime);
				
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Xoodootimes4no_sha_no_interleaving_6rounds(a,b);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d times 6 rounds of 4 Xoodoos without interleaving or SHA3 instructions : %f \n",
				MAX_ROUNDS, endTime-startTime);
		}	
		
		
		if(roll_benchmark)
		{
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
					
			/*	
			measureTimingDeclare
			cycles_t dtMin = CalibrateTimer();
						
			
			
			//start_benchmark
			measureTimingBeginDeclared
				//roll_Xc(a, c);
				//ten(roll_Xc(a, c));
				thousand(roll_Xc(a, c));
			//end_benchmark
			measureTimingEnd
			
			
			printf("Clocks spend for 1 Xc roll + 6 rounds of Xoodoo with interleaving : %llu \n",
				(unsigned long long) benchClock);
			
			sleep(1);
			
			
			//start_benchmark
			measureTimingBeginDeclared
				//roll_Xc_sha(a, c);
				//ten(roll_Xc_sha(a, c));
				thousand(roll_Xc_sha(a, c));
			//end_benchmark
			measureTimingEnd
			
			printf("Clocks spend for 1 Xc roll + 6 rounds of Xoodoo without interleaving : %llu \n",
				(unsigned long long) benchClock);
				
			*/
			
			
			roll_Xc(a, c);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				roll_Xc(a, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d Xc rolls + 6 rounds of Xoodoo with interleaving  : %f \n",
				MAX_ROUNDS, endTime-startTime);		
				
			sleep(3);
			roll_Xc_sha(a,c);	
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				roll_Xc_sha(a, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d Xc rolls + 6 rounds of Xoodoo without interleaving  : %f \n",
				MAX_ROUNDS, endTime-startTime);		
			
			
			free(c);
		}
		
		if(first_roll_benchmark)
		{
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
					
			
			measureTimingDeclare
			cycles_t dtMin = CalibrateTimer();
			
						
			//start_benchmark
			measureTimingBeginDeclared
				//roll_Xc_sha_first(a, k, c);
				//ten(roll_Xc_sha_first(a, k, c));
				thousand(roll_Xc_sha_first(a, k, c));
			//end_benchmark
			measureTimingEnd
			
			
			printf("Clocks spend for 1 Xc roll + 6 rounds of Xoodoo w/o interleaving and 4 loads : %llu \n",
				(unsigned long long) benchClock);
			
			sleep(1);
			
			
			//start_benchmark
			measureTimingBeginDeclared
				//roll_Xc_sha_first2(a, k, c);
				//ten(roll_Xc_sha_first2(a, k, c));
				thousand(roll_Xc_sha_first2(a, k, c));
			//end_benchmark
			measureTimingEnd
			
			printf("Clocks spend for 1 Xc roll + 6 rounds of Xoodoo w/o interleaving and 1 load : %llu \n",
				(unsigned long long) benchClock);
				
			/*
			
			
			roll_Xc_sha_first(a, k, c);
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				roll_Xc_sha_first(a, k, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d Xc rolls + 6 rounds of Xoodoo w/o interleaving and 4 loads : %f \n",
				MAX_ROUNDS, endTime-startTime);		
				
			sleep(3);
			roll_Xc_sha_first2(a, k, c);	
			
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				roll_Xc_sha_first2(a, k, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spent for %d Xc rolls + 6 rounds of Xoodoo w/o interleaving and 1 load  : %f \n",
				MAX_ROUNDS, endTime-startTime);		
			*/
			
			free(c);
		}
		
		
		
		if(decompose)
		{
			printf("Sub-timings for %d rounds of 4 Xoodoos with sha3 interleaved implementation:\n", MAX_ROUNDS);
			
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
				Xoodootimes4_Deinterleave();
			endTime = (float)clock()/CLOCKS_PER_SEC;
			printf("De-interleaving: %f \n", endTime-startTime);
			
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
		
			
		if (xoodoo4sha_interleave) Xoodootimes4sha_interleaving_6rounds(a,b); //interleaved optimized
		if (xoodoo4sha_no_interleave) Xoodootimes4sha_no_interleaving_6rounds(a, b); //no interleaving but sha
		if (xoodoo4no_sha_interleave) Xoodootimes4no_sha_interleaving_6rounds(a,b); //interleaved but without sha instructions
		if (xoodoo4no_sha_no_interleave) Xoodootimes4no_sha_no_interleaving_6rounds(a,b); // no interleaving, no sha instructions, but SIMD
		
		if (xoodoo1) Xoodootimes1_PermuteAll_6rounds(a, b); //base implementation single Xoodoo
		
		if (xoodoo1ref){
			memcpy(b, a, 4*12*sizeof(unsigned int));
			Xoodoo_Permute_Nrounds((void*) b, 6); //ref
		}
		
		if (rollCi){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			
			for (int j=0; j<4; j++){
				//for (int i=0; i<12; i++) c[12*j+i] = i;
				//for (int i=0; i<12; i++) c[j+4*i] = i;
			}
			
			roll_Xc_first2(a, k, c);
			roll_Xc(a, c);
			roll_Xc(a, c);
			store(b);
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			free(c);
		}
		
		if (rollCn){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			
			for (int j=0; j<4; j++){
				//for (int i=0; i<12; i++) c[12*j+i] = i;
				//for (int i=0; i<12; i++) c[j+4*i] = i;
			}
			
			roll_Xc_sha_first2(a, k, c);
			roll_Xc_sha(a, c);
			roll_Xc_sha(a, c);
			store_sha(b);
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			free(c);
		}
		
		if (rollEn){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			roll_Xe_sha_first(a, k, c);
			roll_Xe_sha(k, c);
			roll_Xe_sha(k, c);
			store_sha(b);
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			for (int i=0; i<12; i++){
				//printf("k %d | %x:%x-%x:%x\n", i, k[4*i], k[4*i+1], k[4*i+2], k[4*i+3]);
			}
			free(c);
		}
		
		if (rollEi){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			roll_Xe_first(b, a, k, c);
			roll_Xe(b, k, c);
			roll_Xe(b, k, c);
			store(b);
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			for (int i=0; i<12; i++){
				//printf("k %d | %x:%x-%x:%x\n", i, k[4*i], k[4*i+1], k[4*i+2], k[4*i+3]);
			}
			free(c);
		}
		
		
		// Result
		if (xoodoo4sha_interleave || xoodoo4sha_no_interleave || xoodoo4no_sha_interleave || xoodoo4no_sha_no_interleave || xoodoo1 || xoodoo1ref || rollCi || rollCn || rollEi || rollEn){ 
			for (int i=0; i<12; i++){
				printf("%d | %x:%x-%x:%x\n", i, b[4*i], b[4*i+1], b[4*i+2], b[4*i+3]);
			}
		}
		
		
		free(a);
		free(b);
		
		
		
		if(help)
		{
			printf("The %s tool allows testing and performance evalutation for mutiple implementations of Xoofff on an ARMv8 platform.\n", argv[0]);
			printf("\n");
			printf("Options can only be used one by one. For example: \"%s benchmark\"\n", argv[0]);
			printf("The different available options are: \n");
			printf("- benchmark: will run a timed benchmark of each Xoodoo implementation\n");
			printf("- decompose: will run a timed benchmark of a Xoodoo implementation using SIMD, SHA3 instructions and bit interleaving\n");
			printf("- roll_benchmark: will run a timed benchmark of a the rolling function Xc, followed by loading (and interleaving) of the input, and finally 6 rounds of Xoodoo on the XOR of the rolled key and the input. This compares one implemenation using interleaving to another one without interleaving\n");
			printf("- Xoodoo1ref: runs 6 rounds of Xoodoo using a reference C implementation (without SIMD)\n");
			printf("- Xoodoo1: runs 6 rounds of Xoodoo without using SIMD instrucitons\n");
			printf("- Xoodoo4si: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- Xoodoo4sn: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions but NO bit interleaving\n");
			printf("- Xoodoo4ni: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, NO SHA3 instructions but bit Interleaving\n");
			printf("- Xoodoo4nn: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, NO SHA3 instructions and NO bit Interleaving\n");
			printf("- rollCi: 4 parrallel runs of one Xc roll on a key and XOR it with 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- rollCn: 4 parrallel runs of one Xc roll on a key and XOR it with 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- -h or --help: returns this help text\n");
			printf("\n");
			printf("The single use Xoodoo options (Xoodoo1 and Xoodoo4xx, rollCx) take as input a hardcoded message and key and output the result to the terminal.\n");
			printf("\n");
			printf("Please note that this code is only used for internal testing and might encounter some issues. For any questions please contact Gilles Petitjean: gilles.petitjean@gmail.com .\n");
		}
		
	}
	
	else printf("Wrong argument, type %s -h help.\n", argv[0]);
	
	return 0;

}






