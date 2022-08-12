#ifndef _Xoodoo_times4sha_interleaving_h_
#define _Xoodoo_times4sha_interleaving_h_

//void Xoodootimes4_Load4Interlace(unsigned int *src);
void Xoodootimes4sha_interleaving_6rounds(unsigned int *src, unsigned int *dest);
//void Xoodootimes4_Store4Deinterleave(unsigned int *dest);
void roll_Xc_first(unsigned int *src, unsigned int *k, unsigned int *work_mem);
void roll_Xc(unsigned int *src, unsigned int *work_mem);
void roll_Xe();

#endif
