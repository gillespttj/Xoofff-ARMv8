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

#define MAX_ROUNDS 1000
#define LONG 4999999999999999999

#define ten(a)		a;a;a;a;a;a;a;a;a;a
#define thousand(a)	ten(ten(ten(a)))
             

#define start_benchmark\
	minClock = LONG;\
	for(int i=0; i<MAX_ROUNDS; i++){ \
	asm volatile("mrs %0, cntvct_el0" : "=r"(startClock));
	
#define end_benchmark\
	asm volatile("mrs %0, cntvct_el0" : "=r"(endClock)); \
	if(endClock-startClock<minClock) minClock = endClock-startClock;\
	}

#define print_results\
	for (int i=0; i<12; i++){\
		printf("%d | %x:%x-%x:%x\n", i, b[4*i], b[4*i+1], b[4*i+2], b[4*i+3]);\
	}
	
#define print_timing_results\
	printf("Clocks spend - avg: %llu ns, min: %llu ns\n", (unsigned long long) avgClock, (unsigned long long) minClock);
	
	

int main(int argc, char *argv[])
{
	if(argc==2)
	{
		float startTime, endTime, computeTime;
		int64_t startClock, endClock, minClock, avgClock;
		int decompose1=0, decompose2=0, decompose3=0, decompose4=0, decompose5=0, decompose6=0,
			xoodoo4sha_interleave=0, xoodoo4sha_no_interleave=0, xoodoo4no_sha_interleave=0,
			xoodoo4no_sha_no_interleave=0, xoodoo1=0, xoodoo1ref=0, comp_i=0, comp_i2=0, comp_n=0, exp_n=0,
			exp_n2=0, exp_i=0, help=0, comp_i_first=0, comp_i_first2=0, comp_i_second=0, comp_n_first=0,
			comp_n_second=0, exp_i_first=0, exp_i_second=0, exp_n_first=0, exp_n_first2=0, exp_n_second=0,
			xoodoo4sha_interleave_no_interleave=0;
		
		for(int i=1; i<argc; i++)
		{
			if(strcmp(argv[1], "decompose1") == 0) decompose1 = 1;
			else if(strcmp(argv[1], "decompose2") == 0) decompose2 = 1;
			else if(strcmp(argv[1], "decompose3") == 0) decompose3 = 1;
			else if(strcmp(argv[1], "decompose4") == 0) decompose4 = 1;
			else if(strcmp(argv[1], "decompose5") == 0) decompose5 = 1;
			else if(strcmp(argv[1], "decompose6") == 0) decompose6 = 1;
			else if(strcmp(argv[1], "Xoodoo4si") == 0) xoodoo4sha_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4sin") == 0) xoodoo4sha_interleave_no_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4sn") == 0) xoodoo4sha_no_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4ni") == 0) xoodoo4no_sha_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo4nn") == 0) xoodoo4no_sha_no_interleave = 1;
			else if(strcmp(argv[1], "Xoodoo1") == 0) xoodoo1 = 1;
			else if(strcmp(argv[1], "Xoodoo1ref") == 0) xoodoo1ref = 1;
			else if(strcmp(argv[1], "compI") == 0) comp_i = 1;
			else if(strcmp(argv[1], "compI2") == 0) comp_i2 = 1;
			else if(strcmp(argv[1], "compN") == 0) comp_n = 1;
			else if(strcmp(argv[1], "expI") == 0) exp_i = 1;
			else if(strcmp(argv[1], "expN") == 0) exp_n = 1;
			else if(strcmp(argv[1], "expN2") == 0) exp_n2 = 1;
			else if(strcmp(argv[1], "compIfirst") == 0) comp_i_first = 1;
			else if(strcmp(argv[1], "compIfirst2") == 0) comp_i_first2 = 1;
			else if(strcmp(argv[1], "compIsecond") == 0) comp_i_second = 1;
			else if(strcmp(argv[1], "compNfirst") == 0) comp_n_first = 1;
			else if(strcmp(argv[1], "compNsecond") == 0) comp_n_second = 1;
			else if(strcmp(argv[1], "expIfirst") == 0) exp_i_first = 1;
			else if(strcmp(argv[1], "expIsecond") == 0) exp_i_second = 1;
			else if(strcmp(argv[1], "expNfirst") == 0) exp_n_first = 1;
			else if(strcmp(argv[1], "expNfirst2") == 0) exp_n_first2 = 1;
			else if(strcmp(argv[1], "expNsecond") == 0) exp_n_second = 1;
			else if(strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) help = 1;
			else printf("Wrong argument, type %s -h help.\n", argv[0]);
		}
		
		
		
		unsigned int* a = (unsigned int*) malloc(2*4*12*sizeof(unsigned int));
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
			//4 for saving interleaved k value of k in exp_i
		
		for (int i=0; i<12; i++) k[i] = 3*i+1;//12-i;
		
		
		
		if (xoodoo4sha_interleave || xoodoo4sha_no_interleave || xoodoo4no_sha_interleave ||
		 xoodoo4no_sha_no_interleave || xoodoo1 || xoodoo1ref || comp_i_first || comp_i_first2 || comp_i_second ||
		 comp_n_first || comp_n_second || exp_i_first || exp_i_second || exp_n_first || exp_n_first2 ||
		 exp_n_second){ 
			measureTimingDeclare
			cycles_t dtMin = CalibrateTimer();
			
			//For comparison with old timing
			startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				nothing();
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			computeTime = endTime - startTime;
			
		}
		
		measureTimingDeclare
		cycles_t dtMin = CalibrateTimer();
		
		
		
		
		if(decompose1)
		{
			measureTimingBeginDeclared
				thousand(Xoodootimes4_Load(a));
			measureTimingEnd
			printf("Loading - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
		if(decompose2)
		{
			measureTimingBeginDeclared
				thousand(Xoodootimes4_Interlace());
			measureTimingEnd
			printf("Interleaving - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
		if(decompose3)
		{
			measureTimingBeginDeclared
				thousand(Xoodootimes4_SixRounds());
			measureTimingEnd
			printf("Execution - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
		if(decompose4)
		{
			measureTimingBeginDeclared
				thousand(Xoodootimes4_Deinterleave());
			measureTimingEnd
			printf("De-interleaving - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
		if(decompose5)
		{
			measureTimingBeginDeclared
				thousand(Xoodootimes4_Store(b));
			measureTimingEnd
			printf("Storing - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
		if(decompose6)
		{
			measureTimingBeginDeclared
				thousand(nothing());
			measureTimingEnd
			printf("Simple function calling (for reference) - avg: %llu, min: %llu \n", 
				(unsigned long long) avgClock, (unsigned long long) minClock);
		}
			
		
			
		if (xoodoo4sha_interleave) { //interleaved optimized
			Xoodootimes4sha_interleaving_6rounds(a,b); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodootimes4sha_interleaving_6rounds(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		if (xoodoo4sha_interleave_no_interleave) { //interleaved optimized but without the interleaving itself
			//no results printed as input isn't interleaved
			measureTimingBeginDeclared
				thousand(Xoodootimes4sha_interleaving_6rounds_no_interleave(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		
		if (xoodoo4sha_no_interleave) { //no interleaving but sha
			Xoodootimes4sha_no_interleaving_6rounds(a,b); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodootimes4sha_no_interleaving_6rounds(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		
		if (xoodoo4no_sha_interleave) { //interleaved but without sha instructions
			Xoodootimes4no_sha_interleaving_6rounds(a,b); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodootimes4no_sha_interleaving_6rounds(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		
		if (xoodoo4no_sha_no_interleave) { // no interleaving, no sha instructions, but SIMD
			Xoodootimes4no_sha_no_interleaving_6rounds(a,b); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodootimes4no_sha_no_interleaving_6rounds(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		
		if (xoodoo1) { //base implementation single Xoodoo
			Xoodootimes1_PermuteAll_6rounds(a,b); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodootimes1_PermuteAll_6rounds(a,b)); 
			measureTimingEnd
			print_timing_results
		}
		
		if (xoodoo1ref) { //reference implementation single Xoodoo
			memcpy(b, a, 4*12*sizeof(unsigned int));
			Xoodoo_Permute_Nrounds((void*) b, 6); 
			print_results
			
			measureTimingBeginDeclared
				thousand(Xoodoo_Permute_Nrounds((void*) b, 6)); 
			measureTimingEnd
			print_timing_results
		}
		
		
		
		
		
		if (comp_i){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			
			for (int j=0; j<4; j++){
				//for (int i=0; i<12; i++) c[12*j+i] = i;
				//for (int i=0; i<12; i++) c[j+4*i] = i;
			}
			
			Compressiontimes4i_first(a, k, c);
			Compressiontimes4i(a, c);
			Compressiontimes4i(a, c);
			store_i(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			free(c);
		}
		if (comp_i2){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			
			for (int j=0; j<4; j++){
				//for (int i=0; i<12; i++) c[12*j+i] = i;
				//for (int i=0; i<12; i++) c[j+4*i] = i;
			}
			
			Compressiontimes4i_first2(a, k, c);
			Compressiontimes4i(a, c);
			Compressiontimes4i(a, c);
			store_i(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			free(c);
		}
		
		if (comp_n){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			
			for (int j=0; j<4; j++){
				//for (int i=0; i<12; i++) c[12*j+i] = i;
				//for (int i=0; i<12; i++) c[j+4*i] = i;
			}
			
			Compressiontimes4n_first(a, k, c);
			Compressiontimes4n(a, c);
			Compressiontimes4n(a, c);
			store_n(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			free(c);
		}
		
		if (exp_n){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			Expansiontimes4n_first(a, k, c);
			Expansiontimes4n(k, c);
			Expansiontimes4n(k, c);
			store_n(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			for (int i=0; i<12; i++){
				//printf("k %d | %x:%x-%x:%x\n", i, k[4*i], k[4*i+1], k[4*i+2], k[4*i+3]);
			}
			free(c);
		}
		
		if (exp_n2){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			Expansiontimes4n_first2(a, k, c);
			Expansiontimes4n(k, c);
			Expansiontimes4n(k, c);
			store_n(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			for (int i=0; i<12; i++){
				//printf("k %d | %x:%x-%x:%x\n", i, k[4*i], k[4*i+1], k[4*i+2], k[4*i+3]);
			}
			free(c);
		}
		
		if (exp_i){
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
			Expansiontimes4i_first(b, a, k, c);
			Expansiontimes4i(b, k, c);
			Expansiontimes4i(b, k, c);
			store_i(b);
			
			print_results
			
			for (int i=0; i<12; i++){
				//printf("c %d | %x:%x-%x:%x\n", i, c[4*i], c[4*i+1], c[4*i+2], c[4*i+3]);
			}
			for (int i=0; i<12; i++){
				//printf("k %d | %x:%x-%x:%x\n", i, k[4*i], k[4*i+1], k[4*i+2], k[4*i+3]);
			}
			free(c);
		}
		
		
		
		if (comp_i_first) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));
				
			measureTimingBeginDeclared
				thousand(Compressiontimes4i_first(a, k, c));
			measureTimingEnd
			print_timing_results // */
			
			/*startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Compressiontimes4i_first(a, k, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times: %f ns\n", MAX_ROUNDS, (endTime-startTime-computeTime)*1.0e9); // */
		}
		if (comp_i_first2) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Compressiontimes4i_first2(a, k, c));
			measureTimingEnd
			print_timing_results
		}
		if (comp_i_second) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			
			measureTimingBeginDeclared
				thousand(Compressiontimes4i(a, c));
			measureTimingEnd
			print_timing_results // */
			
			/*startTime = (float)clock()/CLOCKS_PER_SEC;
			for(unsigned int i=0; i<MAX_ROUNDS; i++)
			{
				Compressiontimes4i(a, c);
			}
			endTime = (float)clock()/CLOCKS_PER_SEC;
			
			printf("Time spend for %d times: %f ns\n", MAX_ROUNDS, (endTime-startTime-computeTime)*1.0e9); // */
		}
		
		if (comp_n_first) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Compressiontimes4n_first(a, k, c));
			measureTimingEnd
			print_timing_results
		}
		if (comp_n_second) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Compressiontimes4n(a, c));
			measureTimingEnd
			print_timing_results
		}
		
		if (exp_i_first) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Expansiontimes4i_first(b, a, k, c));
			measureTimingEnd
			print_timing_results
		}
		if (exp_i_second) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Expansiontimes4i(b, k, c));
			measureTimingEnd
			print_timing_results
		}
		
		if (exp_n_first) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Expansiontimes4n_first(a, k, c));
			measureTimingEnd
			print_timing_results
		}
		if (exp_n_first2) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Expansiontimes4n_first2(a, k, c));
			measureTimingEnd
			print_timing_results
		}
		if (exp_n_second) {
			unsigned int* c = (unsigned int*) malloc(4*12*sizeof(unsigned int));	
			measureTimingBeginDeclared
				thousand(Expansiontimes4n(k, c));
			measureTimingEnd
			print_timing_results
		}
		
		
		
		
		free(a);
		free(b);
		
		
		
		if(help)
		{
			printf("The %s tool allows testing and performance evalutation for mutiple implementations of Xoofff on an ARMv8 platform.\n", argv[0]);
			printf("\n");
			printf("Options can only be used one by one. For example: \"%s benchmark\"\n", argv[0]);
			printf("The different available options are: \n");
			printf("- decompose[1-6]: decomposes Xoodoo4si into loading, interleaving, execution, de-interleaving and storing\n");
			printf("- Xoodoo1ref: runs 6 rounds of Xoodoo using a reference C implementation (without SIMD)\n");
			printf("- Xoodoo1: runs 6 rounds of Xoodoo without using SIMD instrucitons\n");
			printf("- Xoodoo4si: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- Xoodoo4sin: similar to Xoodoo4si without the executing the interleaving (does not print results)\n");
			printf("- Xoodoo4sn: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, SHA3 instructions but NO bit interleaving\n");
			printf("- Xoodoo4ni: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, NO SHA3 instructions but bit Interleaving\n");
			printf("- Xoodoo4nn: 4 parrallel runs of 6 rounds of Xoodoo on the implementation using SIMD, NO SHA3 instructions and NO bit Interleaving\n");
			printf("- compI(2): 4 parrallel runs of Xoofff compression using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- compN: 4 parrallel runs of Xoofff compression using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- expI: 4 parrallel runs of Xoofff expansion using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- expN(2): 4 parrallel runs of Xoofff expansion using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- compIfirst(2): first 4 parrallel rounds of Xoofff compression using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- compIsecond: 4 next rounds of Xoofff compression using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- compNfirst: first 4 parrallel rounds of Xoofff compression using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- compNsecond: 4 next rounds of Xoofff compression using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- expIfirst: first 4 parrallel rounds of Xoofff expansion using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- expIsecond: 4 next rounds of Xoofff expansion using SIMD, SHA3 instructions and bit Interleaving\n");
			printf("- expNfirst(2): first 4 parrallel rounds of Xoofff expansion using SIMD, SHA3 instructions but no bit Interleaving\n");
			printf("- expNsecond: 4 next rounds of Xoofff expansion using SIMD, SHA3 instructions but no bit Interleaving\n");
			
			printf("- -h or --help: returns this help text\n");
			printf("\n");
			printf("Otions Xoodoo1, Xoodo1ref, Xoodoo4xx, compX and expX take as input a hardcoded message and key and output the result to the terminal.\n");
			printf("Otions Xoodoo1, Xoodo1ref, Xoodoo4xx, compXfirst, compXseond, expXfirst and expXsecond time the implementations and output the results to the terminal.\n");
			printf("\n");
			printf("Please note that this code is only used for internal testing and might encounter some issues. For any questions please contact Gilles Petitjean: gilles.petitjean@gmail.com .\n");
		}
		
	}
	
	else printf("Wrong argument, type %s -h help.\n", argv[0]);
	
	return 0;

}






