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

#ifndef _Xoodoo_times4sha_h_
#define _Xoodoo_times4sha_h_

/** For the documentation, see PlSnP-documentation.h. */

#define Xoodootimes4_implementation        "Optimized ARM Cortex-A7(/A8/A9) NEON assembler implementation"
#define Xoodootimes4_statesSizeInBytes     (4*3*4*4)
#define Xoodootimes4_statesAlignment       16

#define Xoodootimes4_StaticInitialize()

void Xoodootimes4_PermuteAll_6rounds(unsigned int *src, unsigned int *dest);

#endif
