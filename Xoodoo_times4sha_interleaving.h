#ifndef _Xoodoo_times4sha_interleaving_h_
#define _Xoodoo_times4sha_interleaving_h_

//void Xoodootimes4_Load4Interlace(unsigned int *src);
void Xoodootimes4sha_interleaving_6rounds(unsigned int *src, unsigned int *dest);
void Xoodootimes4sha_interleaving_6rounds_no_interleave(unsigned int *src, unsigned int *dest);
//void Xoodootimes4_Store4Deinterleave(unsigned int *dest);
void Compressiontimes4i_first(unsigned int *src, unsigned int *k, unsigned int *work_mem);
void Compressiontimes4i_first2(unsigned int *src, unsigned int *k, unsigned int *work_mem);
void Compressiontimes4i(unsigned int *src, unsigned int *work_mem);
void Expansiontimes4i_first(unsigned int *dest, unsigned int *sum, unsigned int *kiplus2, unsigned int *work_mem, unsigned int *work_mem2);
void Expansiontimes4i(unsigned int *dest, unsigned int *kiplus2, unsigned int *work_mem, unsigned int *work_mem2);
void store_i(unsigned int *dest);

#endif
