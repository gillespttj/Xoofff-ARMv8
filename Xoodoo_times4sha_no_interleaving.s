.text

.macro theta
	EOR3	V12.16B, V3.16B, V7.16B, V11.16B
	EOR3	V13.16B, V0.16B, V4.16B, V8.16B
	EOR3	V14.16B, V1.16B, V5.16B, V9.16B
	EOR3	V15.16B, V2.16B, V6.16B, V10.16B
	SRI	V16.4S, V12.4S, #27
	SRI	V17.4S, V13.4S, #27
	SRI	V18.4S, V14.4S, #27
	SRI	V19.4S, V15.4S, #27
	SRI	V20.4S, V12.4S, #18
	SRI	V21.4S, V13.4S, #18
	SRI	V22.4S, V14.4S, #18
	SRI	V23.4S, V15.4S, #18
	SLI	V16.4S, V12.4S, #5
	SLI	V17.4S, V13.4S, #5
	SLI	V18.4S, V14.4S, #5
	SLI	V19.4S, V15.4S, #5
	SLI	V20.4S, V12.4S, #14
	SLI	V21.4S, V13.4S, #14
	SLI	V22.4S, V14.4S, #14
	SLI	V23.4S, V15.4S, #14
	EOR3	V12.16B, V8.16B,  V20.16B, V16.16B
	EOR3	V13.16B, V9.16B,  V21.16B, V17.16B
	EOR3	V14.16B, V10.16B, V22.16B, V18.16B
	EOR3	V15.16B, V11.16B, V23.16B, V19.16B
	EOR3	V0.16B,  V0.16B, V20.16B, V16.16B
	EOR3	V1.16B,  V1.16B, V21.16B, V17.16B
	EOR3	V2.16B,  V2.16B, V22.16B, V18.16B
	EOR3	V3.16B,  V3.16B, V23.16B, V19.16B
	EOR3	V4.16B,  V4.16B, V20.16B, V16.16B
	EOR3	V5.16B,  V5.16B, V21.16B, V17.16B
	EOR3	V6.16B,  V6.16B, V22.16B, V18.16B
	EOR3	V7.16B,  V7.16B, V23.16B, V19.16B
.endm

.macro iota_1
	EOR	V0.16B, V0.16B, V25.16B
.endm

.macro iota_2
	MOV	V25.2D[0], x4
	MOV	V25.2D[1], x4
	EOR	V0.16B, V0.16B, V25.16B
.endm

.macro rho_w_chi
	SRI	V8.4S,  V12.4S, #21
	SRI	V9.4S,  V13.4S, #21
	SRI	V10.4S, V14.4S, #21
	SRI	V11.4S, V15.4S, #21
	SLI	V8.4S,  V12.4S, #11
	SLI	V9.4S,  V13.4S, #11
	SLI	V10.4S, V14.4S, #11
	SLI	V11.4S, V15.4S, #11
	BCAX	V16.16B, V7.16B, V0.16B, V8.16B
	BCAX	V17.16B, V4.16B, V1.16B, V9.16B
	BCAX	V18.16B, V5.16B, V2.16B, V10.16B
	BCAX	V19.16B, V6.16B, V3.16B, V11.16B
	BCAX	V20.16B, V8.16B,  V7.16B, V0.16B
	BCAX	V21.16B, V9.16B,  V4.16B, V1.16B
	BCAX	V22.16B, V10.16B, V5.16B, V2.16B
	BCAX	V23.16B, V11.16B, V6.16B, V3.16B
	BCAX	V0.16B, V0.16B, V8.16B,  V7.16B
	BCAX	V1.16B, V1.16B, V9.16B,  V4.16B
	BCAX	V2.16B, V2.16B, V10.16B, V5.16B
	BCAX	V3.16B, V3.16B, V11.16B, V6.16B

	//just for tests:
	MOV	V4.16B, V16.16B
	MOV	V5.16B, V17.16B
	MOV	V6.16B, V18.16B
	MOV	V7.16B, V19.16B
	MOV	V8.16B, V20.16B
	MOV	V9.16B, V21.16B
	MOV	V10.16B, V22.16B
	MOV	V11.16B, V23.16B
.endm

.macro rho_e
	SRI	V4.4S, V16.4S, #31
	SRI	V5.4S, V17.4S, #31
	SRI	V6.4S, V18.4S, #31
	SRI	V7.4S, V19.4S, #31
	SRI	V10.4S, V20.4S, #24
	SRI	V11.4S, V21.4S, #24
	SRI	V8.4S,  V22.4S, #24
	SRI	V9.4S,  V23.4S, #24
	SLI	V4.4S, V16.4S, #1
	SLI	V5.4S, V17.4S, #1
	SLI	V6.4S, V18.4S, #1
	SLI	V7.4S, V19.4S, #1
	SLI	V10.4S, V20.4S, #8
	SLI	V11.4S, V21.4S, #8
	SLI	V8.4S,  V22.4S, #8
	SLI	V9.4S,  V23.4S, #8
.endm

.macro load0 reg
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[1], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[1], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[1], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[2], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[2], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[2], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[3], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[3], [\reg\()]
	ADD	\reg\(), \reg\(), #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[3], [\reg\()]
.endm

.macro load0linear reg
	LD1	{V0.4S, V1.4S, V2.4S, V3.4S}, [\reg\()]
	ADD	\reg\(), \reg\(), #64
	LD1	{V4.4S, V5.4S, V6.4S, V7.4S}, [\reg\()]
	ADD	\reg\(), \reg\(), #64
	LD1	{V8.4S, V9.4S, V10.4S, V11.4S}, [\reg\()]
	SUB	\reg\(), \reg\(), #128
.endm

.macro load12 reg
	LD4	{V12.S, V13.S, V14.S, V15.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[3], [\reg]
	SUB	\reg\(), \reg\(), #176
.endm

.macro load12linear reg
	LD1	{V12.4S, V13.4S, V14.4S, V15.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V16.4S, V17.4S, V18.4S, V19.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V20.4S, V21.4S, V22.4S, V23.4S}, [\reg]
	SUB	\reg\(), \reg\(), #128
.endm

.macro store0 reg
	ST4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[3], [\reg]
.endm

.macro store0linear reg
	ST1	{V0.4S, V1.4S, V2.4S, V3.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V4.4S, V5.4S, V6.4S, V7.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V8.4S, V9.4S, V10.4S, V11.4S}, [\reg]
.endm

.macro store12 reg	
	ST4	{V12.S, V13.S, V14.S, V15.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[0], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[1], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[2], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[3], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[3], [\reg]
.endm

.macro store12linear reg	
	ST1	{V12.4S, V13.4S, V14.4S, V15.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V16.4S, V17.4S, V18.4S, V19.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V20.4S, V21.4S, V22.4S, V23.4S}, [\reg]
.endm

.macro Xoodoo
	theta
	MOVI	V25.4S, #0x60
	iota_1
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0x2C
	iota_1
	rho_w_chi
	rho_e

	theta
	MOV	x4, #0x0000038000000380
	iota_2
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0xF0
	iota_1
	rho_w_chi
	rho_e

	theta
	MOV	x4, #0x000001A0
	MOVK	x4, #0x000001A0, LSL #32
	iota_2
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0x12
	iota_1
	rho_w_chi
	rho_e
.endm

.macro first_roll_Xc_part1
	SRI	V1.4S, V16.4S, #29
	SRI	V3.4S, V20.4S, #29
	SRI	V5.4S, V13.4S, #29
	
	SHL	V0.4S, V12.4S, #13
	SHL	V2.4S, V16.4S, #13
	SHL	V4.4S, V20.4S, #13
	
	SLI	V1.4S, V16.4S, #3
	SLI	V3.4S, V20.4S, #3
	SLI	V5.4S, V13.4S, #3
	
	EOR3	V25.16B, V12.16B, V0.16B, V1.16B
	EOR3	V26.16B, V16.16B, V2.16B, V3.16B
	EOR3	V27.16B, V20.16B, V4.16B, V5.16B
	
	MOV	V12.S[1], V16.S[0]
	MOV	V13.S[1], V17.S[0]
	MOV	V14.S[1], V18.S[0]
	MOV	V15.S[1], V19.S[0]
	
	MOV	V16.S[1], V20.S[0]
	MOV	V17.S[1], V21.S[0]
	MOV	V18.S[1], V22.S[0]
	MOV	V19.S[1], V23.S[0]
	
	MOV	V20.S[1], V13.S[0]
	MOV	V21.S[1], V14.S[0]
	MOV	V22.S[1], V15.S[0]
	MOV	V23.S[1], V25.S[0]
	
	MOV	V12.S[2], V20.S[0]
	MOV	V13.S[2], V21.S[0]
	MOV	V14.S[2], V22.S[0]
	MOV	V15.S[2], V23.S[0]
	
	MOV	V16.S[2], V13.S[0]
	MOV	V17.S[2], V14.S[0]
	MOV	V18.S[2], V15.S[0]
	MOV	V19.S[2], V25.S[0]
	
	MOV	V20.S[2], V17.S[0]
	MOV	V21.S[2], V18.S[0]
	MOV	V22.S[2], V19.S[0]
	MOV	V23.S[2], V26.S[0]
	
	MOV	V12.S[3], V13.S[0]
	MOV	V13.S[3], V14.S[0]
	MOV	V14.S[3], V15.S[0]
	MOV	V15.S[3], V25.S[0]
	
	MOV	V16.S[3], V17.S[0]
	MOV	V17.S[3], V18.S[0]
	MOV	V18.S[3], V19.S[0]
	MOV	V19.S[3], V26.S[0]
	
	MOV	V20.S[3], V21.S[0]
	MOV	V21.S[3], V22.S[0]
	MOV	V22.S[3], V23.S[0]
	MOV	V23.S[3], V27.S[0]
.endm

.macro first_storeK place, reg
	ST4	{V12.S, V13.S, V14.S, V15.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
.endm

.macro first_storeK_full reg
	first_storeK	0, \reg
	first_storeK	1, \reg
	first_storeK	2, \reg
	first_storeK	3, \reg
.endm

	
.macro loadK place, reg
	LD4	{V12.S, V13.S, V14.S, V15.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[\place], [\reg]
.endm

.macro load4roll reg
	loadK	0, \reg
	ADD	\reg\(), \reg\(), #16
	loadK	1, \reg
	ADD	\reg\(), \reg\(), #16
	loadK	2, \reg
	ADD	\reg\(), \reg\(), #16
	loadK	3, \reg
	SUB	\reg\(), \reg\(), #176
.endm

.macro first_load4roll reg
	loadK	0, \reg
	SUB	\reg\(), \reg\(), #32
	loadK	1, \reg
	SUB	\reg\(), \reg\(), #32
	loadK	2, \reg
	SUB	\reg\(), \reg\(), #32
	loadK	3, \reg
.endm

.macro spreadK size
	MOV	V12.\size\()[1], V12.\size\()[0]
	MOV	V13.\size\()[1], V13.\size\()[0]
	MOV	V14.\size\()[1], V14.\size\()[0]
	MOV	V15.\size\()[1], V15.\size\()[0]
	
	MOV	V16.\size\()[1], V16.\size\()[0]
	MOV	V17.\size\()[1], V17.\size\()[0]
	MOV	V18.\size\()[1], V18.\size\()[0]
	MOV	V19.\size\()[1], V19.\size\()[0]
	
	MOV	V20.\size\()[1], V20.\size\()[0]
	MOV	V21.\size\()[1], V21.\size\()[0]
	MOV	V22.\size\()[1], V22.\size\()[0]
	MOV	V23.\size\()[1], V23.\size\()[0]
.endm 

.macro first_load4roll2 reg // to rethink??
	loadK	0, \reg
	SUB	\reg\(), \reg\(), #32
	//spreadK	S
	//spreadK	D
.endm

.macro first_roll_Xc_part2
	EOR	V0.16B,  V0.16B,  V12.16B
	EOR	V1.16B,  V1.16B,  V13.16B
	EOR	V2.16B,  V2.16B,  V14.16B
	EOR	V3.16B,  V3.16B,  V15.16B
	
	EOR	V4.16B,  V4.16B,  V16.16B
	EOR	V5.16B,  V5.16B,  V17.16B
	EOR	V6.16B,  V6.16B,  V18.16B
	EOR	V7.16B,  V7.16B,  V19.16B
	
	EOR	V8.16B,  V8.16B,  V20.16B
	EOR	V9.16B,  V9.16B,  V21.16B
	EOR	V10.16B, V10.16B, V22.16B
	EOR	V11.16B, V11.16B, V23.16B
.endm


.align 8
.global Xoodootimes4sha_no_interleaving_6rounds
.type Xoodootimes4sha_no_interleaving_6rounds, %function

Xoodootimes4sha_no_interleaving_6rounds:

	load0	x0

	Xoodoo

	store0 x1

	RET




.align 8
.global roll_Xc_sha_first
.type roll_Xc_sha_first, %function

roll_Xc_sha_first:

	first_load4roll x1

	first_roll_Xc_part1
	
	load0	x0 
	
	//first_storeK_full x2
	store12linear x2
	
	first_roll_Xc_part2
	
	Xoodoo
	
	RET
	

.align 8
.global roll_Xc_sha_first2
.type roll_Xc_sha_first2, %function

roll_Xc_sha_first2:

	first_load4roll2 x1

	first_roll_Xc_part1
	
	load0	x0 
	
	//first_storeK_full x2
	store12linear x2
	
	first_roll_Xc_part2
	
	Xoodoo
	
	RET
	

	
.align 8
.global roll_Xc_sha_first_sum
.type roll_Xc_sha_first2_sum, %function

roll_Xc_sha_first2_sum:

	first_load4roll2 x1

	first_roll_Xc_part1
	
	load0	x0 
	//ADD	x0, x0, #16
	
	
	//first_storeK_full x2
	store12linear x2
	
	first_roll_Xc_part2
	
	Xoodoo
	
	store0 x3
	
	RET //x0
	
	


.macro roll_Xc
	SRI	V25.4S, V20.4S, #29
	SRI	V27.4S, V13.4S, #29
	SRI	V29.4S, V16.4S, #29
	SRI	V31.4S, V17.4S, #29
	
	SHL	V24.4S, V16.4S, #13
	SHL	V26.4S, V20.4S, #13
	SHL	V28.4S, V12.4S, #13
	SHL	V30.4S, V13.4S, #13
	
	SLI	V25.4S, V20.4S, #3
	SLI	V27.4S, V13.4S, #3
	SLI	V29.4S, V16.4S, #3
	SLI	V31.4S, V17.4S, #3
	
	EOR3	V16.16B, V16.16B, V24.16B, V25.16B
	EOR3	V20.16B, V20.16B, V26.16B, V27.16B
	EOR3	V12.16B, V12.16B, V28.16B, V29.16B
	EOR3	V13.16B, V13.16B, V30.16B, V31.16B
	
	EOR	V0.16B,  V0.16B,  V17.16B
	EOR	V1.16B,  V1.16B,  V18.16B
	EOR	V2.16B,  V2.16B,  V19.16B
	EOR	V3.16B,  V3.16B,  V16.16B
	
	EOR	V4.16B,  V4.16B,  V21.16B
	EOR	V5.16B,  V5.16B,  V22.16B
	EOR	V6.16B,  V6.16B,  V23.16B
	EOR	V7.16B,  V7.16B,  V20.16B
	
	EOR	V8.16B,  V8.16B,  V14.16B
	EOR	V9.16B,  V9.16B,  V15.16B
	EOR	V10.16B, V10.16B, V12.16B
	EOR	V11.16B, V11.16B, V13.16B
.endm


.macro storeK place 
	ST3	{V17.S, V18.S, V19.S}[\place], [x1]
	ADD	x1, x1, #12
	ST1	{V16.S}[\place], [x1]
	ADD	x1, x1, #4
	ST3	{V21.S, V22.S, V23.S}[\place], [x1]
	ADD	x1, x1, #12
	ST1	{V20.S}[\place], [x1]
	ADD	x1, x1, #4
	ST2	{V14.S, V15.S}[\place], [x1]
	ADD	x1, x1, #8
	ST2	{V12.S, V13.S}[\place], [x1]
.endm

.macro storeKfull 
	storeK	0
	ADD	x1, x1, #8
	storeK	1
	ADD	x1, x1, #8
	storeK	2
	ADD	x1, x1, #8
	storeK	3
.endm

.macro storeKlinear
	ST1	{V17.4S, V18.4S, V19.4S}, [x1]
	ADD	x1, x1, #48
	ST1	{V16.4S}, [x1]
	ADD	x1, x1, #16
	ST1	{V21.4S, V22.4S, V23.4S}, [x1]
	ADD	x1, x1, #48
	ST1	{V20.4S}, [x1]
	ADD	x1, x1, #16
	ST1	{V14.4S, V15.4S}, [x1]
	ADD	x1, x1, #32
	ST1	{V12.4S, V13.4S}, [x1]
.endm

	
.align 8
.global roll_Xc_sha
.type roll_Xc_sha, %function

roll_Xc_sha:

	load0	x0
	//ADD	x0, x0, #16
	
	//load4roll	x1
	load12linear x1

	roll_Xc
	
	//storeKfull
	//store12linear x1
	storeKlinear
	
	
	Xoodoo


	RET //x0
	
	
	
.macro sum
	EOR	V0.16B, V0.16B, V12.16B
	EOR	V1.16B, V1.16B, V13.16B
	EOR	V2.16B, V2.16B, V14.16B
	EOR	V3.16B, V3.16B, V15.16B
	
	EOR	V4.16B, V4.16B, V16.16B
	EOR	V5.16B, V5.16B, V17.16B
	EOR	V6.16B, V6.16B, V18.16B
	EOR	V7.16B, V7.16B, V19.16B
	
	EOR	V8.16B, V8.16B, V20.16B
	EOR	V9.16B, V9.16B, V21.16B
	EOR	V10.16B, V10.16B, V22.16B
	EOR	V11.16B, V11.16B, V23.16B
.endm
	
.align 8
.global roll_Xc_sha_sum
.type roll_Xc_sha_sum, %function

roll_Xc_sha_sum:

	load0		x0
	
	//load4roll	x1
	load12linear x1

	roll_Xc
	
	//storeKfull
	//store12linear x1
	storeKlinear
	
	Xoodoo
	
	load12		x2
	
	sum

	store0		x2

	RET
	
	
	
	
.macro loadK0 place, reg
	LD4	{V0.S, V1.S, V2.S, V3.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[\place], [\reg]
.endm

.macro spreadK0 size
	MOV	V0.\size\()[1], V0.\size\()[0]
	MOV	V1.\size\()[1], V1.\size\()[0]
	MOV	V2.\size\()[1], V2.\size\()[0]
	MOV	V3.\size\()[1], V3.\size\()[0]
	
	MOV	V4.\size\()[1], V4.\size\()[0]
	MOV	V5.\size\()[1], V5.\size\()[0]
	MOV	V6.\size\()[1], V6.\size\()[0]
	MOV	V7.\size\()[1], V7.\size\()[0]
	
	MOV	V8.\size\()[1], V8.\size\()[0]
	MOV	V9.\size\()[1], V9.\size\()[0]
	MOV	V10.\size\()[1], V10.\size\()[0]
	MOV	V11.\size\()[1], V11.\size\()[0]
.endm 

.macro first_load4roll0 reg 
	loadK0	0, \reg
	SUB	\reg\(), \reg\(), #32
	spreadK0	S
	spreadK0	D
.endm


.macro first_roll_Xe
	MOVI	V31.4S, #0x7
	
	SRI	V15.4S, V0.4S, #27
	SRI	V16.4S, V4.4S, #19
	SRI	V17.4S, V4.4S, #27
	SRI	V18.4S, V8.4S, #19
	SRI	V19.4S, V8.4S, #27
	SRI	V20.4S, V1.4S, #19
	
	SLI	V15.4S, V0.4S, #5
	SLI	V16.4S, V4.4S, #13
	SLI	V17.4S, V4.4S, #5
	SLI	V18.4S, V8.4S, #13
	SLI	V19.4S, V8.4S, #5
	SLI	V20.4S, V1.4S, #13
	
	AND	V12.16B, V4.16B, V8.16B
	AND	V13.16B, V8.16B, V1.16B
	AND	V14.16B, V1.16B, V5.16B
	
	EOR3	V15.16B, V15.16B, V16.16B, V31.16B
	EOR3	V17.16B, V17.16B, V18.16B, V31.16B
	EOR3	V19.16B, V19.16B, V20.16B, V31.16B
	
	EOR	V21.16B, V12.16B, V15.16B
	EOR	V22.16B, V13.16B, V17.16B
	EOR	V23.16B, V14.16B, V19.16B
	
	MOV	V0.S[1], V4.S[0]
	MOV	V1.S[1], V5.S[0]
	MOV	V2.S[1], V6.S[0]
	MOV	V3.S[1], V7.S[0]
	
	MOV	V4.S[1], V8.S[0]
	MOV	V5.S[1], V9.S[0]
	MOV	V6.S[1], V10.S[0]
	MOV	V7.S[1], V11.S[0]
	
	MOV	V8.S[1], V1.S[0]
	MOV	V9.S[1], V2.S[0]
	MOV	V10.S[1], V3.S[0]
	MOV	V11.S[1], V21.S[0]
	
	MOV	V0.S[2], V8.S[0]
	MOV	V1.S[2], V9.S[0]
	MOV	V2.S[2], V10.S[0]
	MOV	V3.S[2], V11.S[0]
	
	MOV	V4.S[2], V1.S[0]
	MOV	V5.S[2], V2.S[0]
	MOV	V6.S[2], V3.S[0]
	MOV	V7.S[2], V21.S[0]
	
	MOV	V8.S[2], V5.S[0]
	MOV	V9.S[2], V6.S[0]
	MOV	V10.S[2], V7.S[0]
	MOV	V11.S[2], V22.S[0]
	
	MOV	V0.S[3], V1.S[0]
	MOV	V1.S[3], V2.S[0]
	MOV	V2.S[3], V3.S[0]
	MOV	V3.S[3], V21.S[0]
	
	MOV	V4.S[3], V5.S[0]
	MOV	V5.S[3], V6.S[0]
	MOV	V6.S[3], V7.S[0]
	MOV	V7.S[3], V22.S[0]
	
	MOV	V8.S[3], V9.S[0]
	MOV	V9.S[3], V10.S[0]
	MOV	V10.S[3], V11.S[0]
	MOV	V11.S[3], V23.S[0]
.endm

.macro first_storeRoll place, reg
	ST4	{V0.S, V1.S, V2.S, V3.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[\place], [\reg]
	ADD	\reg\(), \reg\(), #16
.endm

.macro first_storeRoll_full reg
	first_storeRoll	0, \reg
	first_storeRoll	1, \reg
	first_storeRoll	2, \reg
	first_storeRoll	3, \reg
.endm

.align 8
.global roll_Xe_sha_first
.type roll_Xe_sha_first, %function

roll_Xe_sha_first:

	first_load4roll0	x0

	first_roll_Xe
	
	//first_storeRoll_full	x2
	store0linear		x2
	
	Xoodoo
	
	first_load4roll		x1
	
	sum
	
	
	RET



.macro roll_Xe
	MOVI	V31.4S, #0x7
	
	SRI	V16.4S, V0.4S, #27
	SRI	V17.4S, V4.4S, #19
	SRI	V18.4S, V4.4S, #27
	SRI	V19.4S, V8.4S, #19
	SRI	V20.4S, V8.4S, #27
	SRI	V21.4S, V1.4S, #19
	SRI	V22.4S, V1.4S, #27
	SRI	V23.4S, V5.4S, #19
	
	SLI	V16.4S, V0.4S, #5
	SLI	V17.4S, V4.4S, #13
	SLI	V18.4S, V4.4S, #5
	SLI	V19.4S, V8.4S, #13
	SLI	V20.4S, V8.4S, #5
	SLI	V21.4S, V1.4S, #13
	SLI	V22.4S, V1.4S, #5
	SLI	V23.4S, V5.4S, #13
	
	AND	V12.16B, V4.16B, V8.16B
	AND	V13.16B, V8.16B, V1.16B
	AND	V14.16B, V1.16B, V5.16B
	AND	V15.16B, V5.16B, V9.16B
	
	EOR3	V16.16B, V16.16B, V17.16B, V31.16B
	EOR3	V18.16B, V18.16B, V19.16B, V31.16B
	EOR3	V20.16B, V20.16B, V21.16B, V31.16B
	EOR3	V22.16B, V22.16B, V23.16B, V31.16B
	
	EOR	V0.16B, V12.16B, V16.16B
	EOR	V4.16B, V13.16B, V18.16B
	EOR	V8.16B, V14.16B, V20.16B
	EOR	V1.16B, V15.16B, V22.16B
.endm

.macro storeK0 place 
	ST3	{V5.S, V6.S, V7.S}[\place], [x1]
	ADD	x1, x1, #12
	ST1	{V4.S}[\place], [x1]
	ADD	x1, x1, #4
	ST3	{V9.S, V10.S, V11.S}[\place], [x1]
	ADD	x1, x1, #12
	ST1	{V8.S}[\place], [x1]
	ADD	x1, x1, #4
	ST2	{V2.S, V3.S}[\place], [x1]
	ADD	x1, x1, #8
	ST2	{V0.S, V1.S}[\place], [x1]
.endm

.macro storeKfull0 
	storeK0	0
	ADD	x1, x1, #8
	storeK0	1
	ADD	x1, x1, #8
	storeK0	2
	ADD	x1, x1, #8
	storeK0	3
.endm

.macro storeK0linear 
	ST1	{V5.4S, V6.4S, V7.4S}, [x1]
	ADD	x1, x1, #48
	ST1	{V4.4S}, [x1]
	ADD	x1, x1, #16
	ST1	{V9.4S, V10.4S, V11.4S}, [x1]
	ADD	x1, x1, #48
	ST1	{V8.4S}, [x1]
	ADD	x1, x1, #16
	ST1	{V2.4S, V3.4S}, [x1]
	ADD	x1, x1, #32
	ST1	{V0.4S, V1.4S}, [x1]
.endm

.macro thetaPostRoll
	EOR3	V12.16B, V4.16B, V8.16B, V1.16B
	EOR3	V13.16B, V5.16B, V9.16B, V2.16B
	EOR3	V14.16B, V6.16B, V10.16B, V3.16B
	EOR3	V15.16B, V7.16B, V11.16B, V0.16B
	SRI	V16.4S, V12.4S, #27
	SRI	V17.4S, V13.4S, #27
	SRI	V18.4S, V14.4S, #27
	SRI	V19.4S, V15.4S, #27
	SRI	V20.4S, V12.4S, #18
	SRI	V21.4S, V13.4S, #18
	SRI	V22.4S, V14.4S, #18
	SRI	V23.4S, V15.4S, #18
	SLI	V16.4S, V12.4S, #5
	SLI	V17.4S, V13.4S, #5
	SLI	V18.4S, V14.4S, #5
	SLI	V19.4S, V15.4S, #5
	SLI	V20.4S, V12.4S, #14
	SLI	V21.4S, V13.4S, #14
	SLI	V22.4S, V14.4S, #14
	SLI	V23.4S, V15.4S, #14
	EOR3	V12.16B, V2.16B,  V20.16B, V16.16B
	EOR3	V13.16B, V3.16B,  V21.16B, V17.16B
	EOR3	V14.16B, V0.16B, V22.16B, V18.16B
	EOR3	V15.16B, V1.16B, V23.16B, V19.16B
	EOR3	V0.16B,  V5.16B, V20.16B, V16.16B
	EOR3	V1.16B,  V6.16B, V21.16B, V17.16B
	EOR3	V2.16B,  V7.16B, V22.16B, V18.16B
	EOR3	V3.16B,  V4.16B, V23.16B, V19.16B
	EOR3	V4.16B,  V9.16B, V20.16B, V16.16B
	EOR3	V5.16B,  V10.16B, V21.16B, V17.16B
	EOR3	V6.16B,  V11.16B, V22.16B, V18.16B
	EOR3	V7.16B,  V8.16B, V23.16B, V19.16B
.endm

.macro XoodooPostRoll
	thetaPostRoll
	MOVI	V25.4S, #0x60
	iota_1
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0x2C
	iota_1
	rho_w_chi
	rho_e

	theta
	MOV	x4, #0x0000038000000380
	iota_2
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0xF0
	iota_1
	rho_w_chi
	rho_e

	theta
	MOV	x4, #0x000001A0
	MOVK	x4, #0x000001A0, LSL #32
	iota_2
	rho_w_chi
	rho_e

	theta
	MOVI	V25.4S, #0x12
	iota_1
	rho_w_chi
	rho_e
.endm

.align 8
.global roll_Xe_sha
.type roll_Xe_sha, %function

roll_Xe_sha:

	//load0	x1
	//SUB	x1, x1, #176
	load0linear x1

	roll_Xe
	
	//storeKfull0
	//SUB	x1, x1, #184
	storeK0linear
	
	XoodooPostRoll
	
	first_load4roll x0

	sum

	RET //x0



	
	
.align 8
.global store_sha
.type store_sha, %function

store_sha:

	//store12 x0

	store0	x0
	
	RET
	
	
	



