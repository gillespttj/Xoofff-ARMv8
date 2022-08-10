#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Xoodoo_times4.h"
#include "Xoodoo_times4ref.h"
#include <math.h> //todelete
#include <time.h>

#define MAX_ROUNDS 1000000

extern void Xoodootimes4_Load4Interlace(unsigned int *src);
extern void Xoodootimes4_Theta();
extern void Xoodootimes4_Rho_east_west_Iota_Khi(unsigned long int *C);
extern void Xoodootimes4_Store4Deinterlace(unsigned int *dest);

unsigned long int rc[12] = {0x30C,0x3CC00,0xFF00,0xFC000,0xCF0,0x3C00,0x330,0x30C00,
		0xF300,0xFF000,0xFC0,0x33C0};

void SixXoodoos(unsigned int *src, unsigned int *dest)
{
	unsigned long int* c = (unsigned long int*) malloc(sizeof(unsigned long int));
	
	Xoodootimes4_Load4Interlace(src);
	
	c[0] = rc[0];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	c[0] = rc[1];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	c[0] = rc[2];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	c[0] = rc[3];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	c[0] = rc[4];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	c[0] = rc[5];
	Xoodootimes4_Theta();
	Xoodootimes4_Rho_east_west_Iota_Khi(c);
	
	Xoodootimes4_Store4Deinterlace(dest);
}

void roll_xc();

void roll_xe();

//void 

int main(int argc, char *argv[])
{
	if(argc==2)
	{
		int i = 0;
		
		float startTime, endTime;
		
		//Xoodoo_Load4Interlace();
		printf("This is a test\n");
		/*unsigned long int p = 1;
		unsigned long int s = 1;
		unsigned long int rc_p[7];
		unsigned long int rc_s[6];
		for (int i=0; i<7; i++) {
			rc_p[i] = 3;//p;
			p = p ^ (p << 2);
			if ((p & 16) != 0) p ^= 22;
			if ((p &  8) != 0) p ^= 11;
		}
		for (int i=0; i<6; i++) {
			rc_s[i] = 2;//s;
			s = (s * 5) % 7;
		}*/

		
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
		
		
		startTime = (float)clock()/CLOCKS_PER_SEC;
		for(unsigned int i=0; i<MAX_ROUNDS; i++)
		{
			Xoodoo_Permute_Nrounds((void*) b, 6);
		}
		endTime = (float)clock()/CLOCKS_PER_SEC;
		
		printf("Time spend for %d times 6 rounds of Xoodoo with reference implementation : %f \n",
			MAX_ROUNDS, endTime-startTime);
		
		
		startTime = (float)clock()/CLOCKS_PER_SEC;
		for(unsigned int i=0; i<MAX_ROUNDS; i++)
		{
			SixXoodoos(a,b);
		}
		endTime = (float)clock()/CLOCKS_PER_SEC;
		
		printf("Time spend for %d times 6 rounds of Xoodoo with interlaced implementation : %f \n",
			MAX_ROUNDS, endTime-startTime);
		
		
		// Result
		/*for (int i=0; i<12; i++){
			printf("%x %x:%x-%x:%x\n", i, b[4*i], b[4*i+1], b[4*i+2], b[4*i+3]);
		}*/
		
		
		free(a);
		free(b);
		//free(c);
		
	}
	else
	{
		printf("argument error\n");
	}
	return 0;

}






