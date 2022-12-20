/*
The eXtended Keccak Code Package (XKCP)
https://github.com/XKCP/XKCP

The Xoodoo permutation, designed by Joan Daemen, Seth Hoffert, Gilles Van Assche and Ronny Van Keer.

Implementation by Conno Boel, hereby denoted as "the implementer".

For more information, feedback or questions, please refer to the Keccak Team website:
https://keccak.team/

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#ifndef _Xoodoo_times4sha_no_interleaving_h_
#define _Xoodoo_times4sha_no_interleaving_h_

/** For the documentation, see PlSnP-documentation.h. */

#define Xoodootimes4_implementation        "Optimized ARM Cortex-A7(/A8/A9) NEON assembler implementation"
#define Xoodootimes4_statesSizeInBytes     (4*3*4*4)
#define Xoodootimes4_statesAlignment       16

#define Xoodootimes4_StaticInitialize()

void Xoodootimes4sha_no_interleaving_6rounds(unsigned int *src, unsigned int *dest);

void Compressiontimes4n_first(unsigned int *src, unsigned int *k, unsigned int *work_mem); 
void Compressiontimes4n(unsigned int *src, unsigned int *work_mem);
void Compressiontimes4n_first_sum(unsigned int *src, unsigned int *k, unsigned int *work_mem, unsigned int *accumulator); 
void Compressiontimes4n_sum(unsigned int *src, unsigned int *work_mem, unsigned int *accumulator);

void Expansiontimes4n_first(unsigned int *out, unsigned int *sum, unsigned int *k, unsigned int *work_mem, unsigned int *work_mem2); 
void Expansiontimes4n_first2(unsigned int *out, unsigned int *sum, unsigned int *k, unsigned int *work_mem, unsigned int *work_mem2); 
void Expansiontimes4n(unsigned int *out, unsigned int *work_mem, unsigned int *work_mem2);

void store_n(unsigned int *dest);

#endif
