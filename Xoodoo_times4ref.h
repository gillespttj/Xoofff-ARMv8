#ifndef _Xoodoo_times4ref_h_
#define _Xoodoo_times4ref_h_

#include <stddef.h>
#include <stdint.h>


#define Xoodoo_implementation      "32-bit reference implementation"
#define Xoodoo_stateSizeInBytes    (3*4*4)
#define Xoodoo_stateAlignment      4
#define Xoodoo_HasNround

void Xoodoo_Permute_Nrounds(void *state, unsigned int nrounds);

#endif

