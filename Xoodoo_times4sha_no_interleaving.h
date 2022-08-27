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
void roll_Xc_sha_first(unsigned int *src, unsigned int *k, unsigned int *work_mem); //might still be optimized with normal regs
void roll_Xc_sha(unsigned int *src, unsigned int *work_mem);
void store_sha(unsigned int *dest);

#endif
