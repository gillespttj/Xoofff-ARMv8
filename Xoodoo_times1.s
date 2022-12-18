.text

.macro theta
	EOR	W16, W4, W8
	EOR	W17, W5, W9
	EOR	W18, W6, W10
	EOR	W19, W7, W11

	EOR	W16, W16, W12
	EOR	W17, W17, W13
	EOR	W18, W18, W14
	EOR	W19, W19, W15

	EOR	W21, W16, W16, ROR #23
	EOR	W22, W17, W17, ROR #23
	EOR	W23, W18, W18, ROR #23
	EOR	W20, W19, W19, ROR #23

	EOR	W4,  W4,  W20, ROR #27
	EOR	W5,  W5,  W21, ROR #27
	EOR	W6,  W6,  W22, ROR #27
	EOR	W7,  W7,  W23, ROR #27

	EOR	W8,  W8,  W20, ROR #27
	EOR	W9,  W9,  W21, ROR #27
	EOR	W10, W10, W22, ROR #27
	EOR	W11, W11, W23, ROR #27

	EOR	W12, W12, W20, ROR #27
	EOR	W13, W13, W21, ROR #27
	EOR	W14, W14, W22, ROR #27
	EOR	W15, W15, W23, ROR #27
.endm

.macro rho_w_chi
	BICS	W16, W12, W11, ROR #11
	BICS	W17, W13, W8,  ROR #11
	BICS	W18, W14, W9,  ROR #11
	BICS	W19, W15, W10, ROR #11
	
	/*EOR	W4,  W4,  W16, ROR #21
	EOR	W5,  W5,  W17, ROR #21
	EOR	W6,  W6,  W18, ROR #21
	EOR	W7,  W7,  W19, ROR #21*/
	
	BICS	W24, W4,  W12, ROR #21
	BICS	W25, W5,  W13, ROR #21
	BICS	W26, W6,  W14, ROR #21
	BICS	W27, W7,  W15, ROR #21
	
	BICS	W20, W11, W4
	BICS	W21, W8,  W5
	BICS	W22, W9,  W6
	BICS	W23, W10, W7
	
	EOR	W4,  W4,  W16, ROR #21
	EOR	W5,  W5,  W17, ROR #21
	EOR	W6,  W6,  W18, ROR #21
	EOR	W7,  W7,  W19, ROR #21
	
	EOR	W29,  W10, W27
	EOR	W10,  W9,  W26
	EOR	W9,   W8,  W25
	EOR	W8,   W11, W24
	
	EOR	W24,  W20, W12, ROR #21 //A2:W8 will need -8
	EOR	W25,  W21, W13, ROR #21
	EOR	W26,  W22, W14, ROR #21
	EOR	W27,  W23, W15, ROR #21
.endm

.macro rho_e_theta //A1 needs <- 1
	ROR	W8,  W8,  #31
	ROR	W9,  W9,  #31
	ROR	W10, W10, #31
	ROR	W29, W29, #31
	
	EOR	W16, W4,  W8
	EOR	W17, W5,  W9
	EOR	W18, W6,  W10
	EOR	W19, W7,  W29

	EOR	W16, W16, W26, ROR #24 
	EOR	W17, W17, W27, ROR #24
	EOR	W18, W18, W24, ROR #24
	EOR	W19, W19, W25, ROR #24

	EOR	W21, W16, W16, ROR #23
	EOR	W22, W17, W17, ROR #23
	EOR	W23, W18, W18, ROR #23
	EOR	W20, W19, W19, ROR #23
	
	EOR	W4,  W4,  W20, ROR #27 
	EOR	W5,  W5,  W21, ROR #27 
	EOR	W6,  W6,  W22, ROR #27
	EOR	W7,  W7,  W23, ROR #27
	
	EOR	W8,  W8,  W20, ROR #27 
	EOR	W9,  W9,  W21, ROR #27 
	EOR	W10, W10, W22, ROR #27 
	EOR	W11, W29, W23, ROR #27 
	
	EOR	W12, W26, W20, ROR #3 
	EOR	W13, W27, W21, ROR #3 
	EOR	W14, W24, W22, ROR #3 
	EOR	W15, W25, W23, ROR #3 
.endm

.macro rho_w_chi_2 //W12 needs -8
	BIC	W16, W12, W11, ROR #19 //W16 will need -8
	BIC	W17, W13, W8,  ROR #19
	BIC	W18, W14, W9,  ROR #19
	BIC	W19, W15, W10, ROR #19
	
	BIC	W20, W4,  W12, ROR #13
	BIC	W21, W5,  W13, ROR #13
	BIC	W22, W6,  W14, ROR #13
	BIC	W23, W7,  W15, ROR #13
	
	BIC	W24, W11, W4
	BIC	W25, W8,  W5
	BIC	W26, W9,  W6
	BIC	W27, W10, W7
	
	EOR	W4,  W4,  W16, ROR #13
	EOR	W5,  W5,  W17, ROR #13
	EOR	W6,  W6,  W18, ROR #13
	EOR	W7,  W7,  W19, ROR #13
	
	EOR	W29, W10, W23
	EOR	W10, W9,  W22
	EOR	W9,  W8,  W21
	EOR	W8,  W11, W20 
	
	EOR	W24,  W24, W12, ROR #13 
	EOR	W25,  W25, W13, ROR #13
	EOR	W26,  W26, W14, ROR #13
	EOR	W27,  W27, W15, ROR #13
.endm

.macro rho_e
	ROR	W14, W24, #24
	ROR	W15, W25, #24
	ROR	W12, W26, #24
	ROR	W13, W27, #24
	
	ROR	W8,  W8,  #31
	ROR	W9,  W9,  #31
	ROR	W10, W10, #31
	ROR	W11, W29, #31
.endm




.macro Xoodoo
	theta
	EOR	W4,  W4,  #0x60
	rho_w_chi
	rho_e_theta
	MOV	W0,  #0x2C
	EOR	W4,  W4,  W0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x380
	EOR	W4,  W4,  W0
	rho_w_chi_2
	rho_e_theta
	EOR	W4,  W4,  #0xF0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x1A0
	EOR	W4,  W4,  W0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x12
	EOR	W4,  W4,  W0
	rho_w_chi_2
	rho_e
.endm






.macro load_toV4 reg
	LDP	W4,  W5,  [\reg]
	LDP	W6,  W7,  [\reg\(), #8]
	LDP	W8,  W9,  [\reg\(), #16]
	LDP	W10, W11, [\reg\(), #24]
	LDP	W12, W13, [\reg\(), #32]
	LDP	W14, W15, [\reg\(), #40]
.endm

.macro load_toV16 reg
	LDP	W16, W17, [\reg]
	LDP	W18, W19, [\reg\(), #8]
	LDP	W20, W21, [\reg\(), #16]
	LDP	W22, W23, [\reg\(), #24]
	LDP	W24, W25, [\reg\(), #32]
	LDP	W26, W27, [\reg\(), #40]
.endm

.macro load_toV4_pre_roll reg
	LDP	W15, W12, [\reg]
	LDP	W13, W14, [\reg\(), #8]
	LDP	W4,  W5,  [\reg\(), #16]
	LDP	W6,  W7,  [\reg\(), #24]
	LDP	W8,  W9,  [\reg\(), #32]
	LDP	W10, W11, [\reg\(), #40]
.endm

.macro store_toV4 reg
	STP	W4,  W5,  [\reg]
	STP	W6,  W7,  [\reg\(), #8]
	STP	W8,  W9,  [\reg\(), #16]
	STP	W10, W11, [\reg\(), #24]
	STP	W12, W13, [\reg\(), #32]
	STP	W14, W15, [\reg\(), #40]
.endm








.align 16
.global Xoodootimes1_PermuteAll_6rounds
.type Xoodootimes1_PermuteAll_6rounds, %function
Xoodootimes1_PermuteAll_6rounds:

	load_toV4	x0
	
	Xoodoo
	
	store_toV4	x1

	RET










.macro sum
	EOR	W4,  W4,  W16
	EOR	W5,  W5,  W17
	EOR	W6,  W6,  W18
	EOR	W7,  W7,  W19
	
	EOR	W8,  W8,  W20
	EOR	W9,  W9,  W21
	EOR	W10, W10, W22
	EOR	W11, W11, W23
	
	EOR	W12, W12, W24
	EOR	W13, W13, W25
	EOR	W14, W14, W26
	EOR	W15, W15, W27
.endm


.macro roll_Xc
	EOR	W15, W15, W15, LSL #13
	EOR	W15, W15,  W4, ROR #29
.endm







.align 16
.global Compressiontimes1first
.type Compressiontimes1first, %function
Compressiontimes1first:

	load_toV4	x1	
	load_toV16	x0
	
	//store_toV4	x1
	
	sum
	
	Xoodoo
	
	store_toV4	x2


	RET


.align 16
.global Compressiontimes1
.type Compressiontimes1, %function
Compressiontimes1:

	load_toV4_pre_roll	x1
	roll_Xc
	
	load_toV16	x0
	store_toV4	x1
	
	sum
	
	Xoodoo
	
	//load_toV16	x0
	//sum
	
	store_toV4	x2


	RET







.macro roll_Xe
	AND	W28, W4,  W8
	EOR	W28, W28, #0x7
	EOR	W15, W28, W15, ROR #27
	EOR	W15, W15, W4,  ROR #19
.endm




.align 16
.global Expansiontimes1first
.type Expansiontimes1first, %function
Expansiontimes1first:

	load_toV4	x0
	//store_toV4	x0
	
	Xoodoo	
	
	load_toV16	x1
	
	
	sum
	
	
	store_toV4	x2


	RET


.align 16
.global Expansiontimes1
.type Expansiontimes1, %function
Expansiontimes1:

	load_toV4_pre_roll	x0
	roll_Xe
	
	store_toV4	x0
	
	Xoodoo	
	
	load_toV16	x1
	
	
	sum
	
	
	store_toV4	x2


	RET










