#ifndef _Xoodoo_times1_h_
#define _Xoodoo_times1_h_

void Xoodootimes1_PermuteAll_6rounds(unsigned int *src, unsigned int *dest);
void Compressiontimes1first(unsigned int *src, unsigned int *k, unsigned int *dest);
void Compressiontimes1(unsigned int *src, unsigned int *roll_dest, unsigned int *dest);
void Expansiontimes1first(unsigned int *sum, unsigned int *k, unsigned int *dest);
void Expansiontimes1(unsigned int *sum, unsigned int *roll_dest, unsigned int *dest);

#endif
