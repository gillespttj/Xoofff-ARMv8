
.text

.macro theta
  EOR      V15, V3, V7
  EOR      V15, V15, V11

  vmov      X3, X4, d30
  vmov      X1, X2, d31
  ror       X3, X3, #27
  EOR      V14, V0, V4
  ror       X4, X4, #27
  EOR      V14, V14, V8
  ror       X1, X1, #27
  ror       X2, X2, #27
  eor       X3, X3, X3, Xor #23
  eor       X4, X4, X4, Xor #23
  eor       X1, X1, X1, Xor #23
  vmov      d30, X3, X4
  eor       X2, X2, X2, Xor #23
  vmov      d31, X1, X2

  vmov      X3, X4, d28
  vmov      X1, X2, d29
  ror       X3, X3, #27
  EOR      V0, V0, V15
  ror       X4, X4, #27
  EOR      V4, V4, V15
  ror       X1, X1, #27
  EOR      V8, V8, V15
  ror       X2, X2, #27
  EOR      V15, V1, V5
  eor       X3, X3, X3, Xor #23
  EOR      V15, V15, V9
  eor       X4, X4, X4, Xor #23
  eor       X1, X1, X1, Xor #23
  vmov      d28, X3, X4
  eor       X2, X2, X2, Xor #23
  vmov      d29, X1, X2

  vmov      X3, X4, d30
  vmov      X1, X2, d31
  ror       X3, X3, #27
  EOR      V1, V1, V14
  ror       X4, X4, #27
  EOR      V5, V5, V14
  ror       X1, X1, #27
  EOR      V9, V9, V14
  ror       X2, X2, #27
  EOR      V14, V2, V6
  eor       X3, X3, X3, Xor #23
  EOR      V14, V14, V10
  eor       X4, X4, X4, Xor #23
  eor       X1, X1, X1, Xor #23
  vmov      d30, X3, X4
  eor       X2, X2, X2, Xor #23
  vmov      d31, X1, X2

  vmov      X3, X4, d28
  vmov      X1, X2, d29
  ror       X3, X3, #27
  EOR      V2, V2, V15
  ror       X4, X4, #27
  EOR      V6, V6, V15
  ror       X1, X1, #27
  EOR      V10, V10, V15
  ror       X2, X2, #27
  eor       X3, X3, X3, Xor #23
  eor       X4, X4, X4, Xor #23
  eor       X1, X1, X1, Xor #23
  vmov      d28, X3, X4
  eor       X2, X2, X2, Xor #23
  vmov      d29, X1, X2
  EOR      V3, V3, V14
  EOR      V7, V7, V14
  EOR      V11, V11, V14
.endm

.macro rho_w
  @ vshl.U32  V12, V8, #11
  @ vsri.U32  V12, V8, #21
  vmov      X1, X2, d16
  vshl.U32  V13, V9, #11
  vmov      X3, X4, d17
  vsri.U32  V13, V9, #21
  ror       X1, X1, #21
  vshl.U32  V14, V10, #11
  ror       X2, X2, #21
  vsri.U32  V14, V10, #21
  ror       X3, X3, #21
  vshl.U32  V15, V11, #11
  ror       X4, X4, #21
  vsri.U32  V15, V11, #21
  vmov      d24, X1, X2
  vmov      d25, X3, X4
  @ NOTE: Here we are hiding in the shadows. What happens is that the ROR action is interleaved with the vector actions so that they get executed for free instead of a NOP .
.endm

.macro chi
  @ NOTE: Iota
  vdup.32   V8, X3
  EOR      V0, V0, V8

  @ NOTE: Probably this is optimal.  (Prove?)
  vbic      V11, V12, V7
  vbic      V9, V0, V12
  vbic      V10, V7, V0
  EOR      V8, V10, V12
  EOR      V12, V7, V9
  EOR      V0, V0, V11

  vbic      V7, V13, V4
  vbic      V10, V1, V13
  vbic      V11, V4, V1
  EOR      V9, V11, V13
  EOR      V13, V4, V10
  EOR      V1, V1, V7

  vbic      V4, V14, V5
  vbic      V11, V2, V14
  vbic      V7, V5, V2
  EOR      V10, V7, V14
  EOR      V14, V5, V11
  EOR      V2, V2, V4

  vbic      V5, V15, V6
  vbic      V7, V3, V15
  vbic      V4, V6, V3
  EOR      V4, V4, V15
  EOR      V15, V6, V7
  EOR      V3, V3, V5
.endm

.macro rho_e
  vshl.U32  V11, V9, #8
  vsri.U32  V11, V9, #24

  vshl.U32  V9, V4, #8
  vsri.U32  V9, V4, #24

  vmov      X1, X2, d16
  vmov      X3, X4, d17
  ror       X1, X1, #24
  vshl.U32  V8, V10, #8
  ror       X2, X2, #24
  vsri.U32  V8, V10, #24
  ror       X3, X3, #24
  vmov      d20, r1, X2
  Xor       r4, X4, #24
  vmov      d21, X3, X4

  vshl.U32  V4, V12, #1
  vsri.U32  V4, V12, #31

  vshl.U32  V5, V13, #1
  vsri.U32  V5, V13, #31

  vshl.U32  V6, V14, #1
  vsri.U32  V6, V14, #31

  vshl.U32  V7, V15, #1
  vsri.U32  V7, V15, #31
.endm

@ NOTE: The idea was to maybe merge rho_e and theta partially, however because P depends on the registers it also XORs into, we do not save cycles by stepping to core registers. Because at no point can we use the barrel shifter, which is the only reason we should want to choose the core registers over the vector registers.

@ Xoodootimes4_PermuteAll_6rounds: void * argStates -> void
.align 8
.global Xoodootimes4_PermuteAll_6rounds
.type Xoodootimes4_PermuteAll_6rounds, %function
Xoodootimes4_PermuteAll_6rounds:

    LD4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V12.S, V13.S, V14.S, V15.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V16.S, V17.S, V18.S, V19.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V20.S, V21.S, V22.S, V23.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V12.S, V13.S, V14.S, V15.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V16.S, V17.S, V18.S, V19.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V20.S, V21.S, V22.S, V23.S}[1], [x0]


  theta
  rho_w
  mov       X3, #0x00000060
  chi
  rho_e

  theta
  rho_w
  mov       X3, #0x0000002C
  chi
  rho_e

  theta
  rho_w
  mov       X3, #0x00000380
  chi
  rho_e

  theta
  rho_w
  mov       X3, #0x000000F0
  chi
  rho_e

  theta
  rho_w
  mov       X3, #0x000001A0
  chi
  rho_e

  theta
  rho_w
  mov       X3, #0x00000012
  chi
  rho_e

    ST4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[2], [x0]
    ADD     x0, x0, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[2], [x0]
    ADD     x0, x0, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[3], [x0]
    ADD     x0, x0, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[3], [x0]
    ADD     x0, x0, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[1], [x0]
    ADD     x0, x0, #16
    
    RET
