.text

.macro theta
	EOR	W14, W2, W6
	EOR	W15, W3, W7
	EOR	W16, W4, W8
	EOR	W17, W5, W9

	EOR	W14, W14, W10
	EOR	W15, W15, W11
	EOR	W16, W16, W12
	EOR	W17, W17, W13

	EOR	W19, W14, W14, ROR #23
	EOR	W20, W15, W15, ROR #23
	EOR	W21, W16, W16, ROR #23
	EOR	W18, W17, W17, ROR #23

	EOR	W2,  W2,  W18, ROR #27
	EOR	W3,  W3,  W19, ROR #27
	EOR	W4,  W4,  W20, ROR #27
	EOR	W5,  W5,  W21, ROR #27

	EOR	W6,  W6,  W18, ROR #27
	EOR	W7,  W7,  W19, ROR #27
	EOR	W8,  W8,  W20, ROR #27
	EOR	W9,  W9,  W21, ROR #27

	EOR	W10, W10, W18, ROR #27
	EOR	W11, W11, W19, ROR #27
	EOR	W12, W12, W20, ROR #27
	EOR	W13, W13, W21, ROR #27
.endm

.macro rho_w_chi
	BICS	W14, W10, W9,  ROR #11
	BICS	W15, W11, W6,  ROR #11
	BICS	W16, W12, W7,  ROR #11
	BICS	W17, W13, W8,  ROR #11
	
	BICS	W18, W2,  W10, ROR #21
	BICS	W19, W3,  W11, ROR #21
	BICS	W20, W4,  W12, ROR #21
	BICS	W21, W5,  W13, ROR #21
	
	BICS	W22, W9,  W2
	BICS	W23, W6,  W3
	BICS	W24, W7,  W4
	BICS	W25, W8,  W5
	
	EOR	W2,  W2,  W14, ROR #21
	EOR	W3,  W3,  W15, ROR #21
	EOR	W4,  W4,  W16, ROR #21
	EOR	W5,  W5,  W17, ROR #21
	
	EOR	W26,  W9,  W18 
	EOR	W27,  W6,  W19
	EOR	W28,  W7,  W20
	EOR	W29,  W8,  W21
	
	EOR	W6,  W22, W10, ROR #21 //A2:W6 will need -8
	EOR	W7,  W23, W11, ROR #21
	EOR	W8,  W24, W12, ROR #21
	EOR	W9,  W25, W13, ROR #21
.endm

.macro rho_e_theta //A1 needs <- 1
	ROR	W26, W26, #31
	ROR	W27, W27, #31
	ROR	W28, W28, #31
	ROR	W29, W29, #31
	
	EOR	W14, W2,  W26
	EOR	W15, W3,  W27
	EOR	W16, W4,  W28
	EOR	W17, W5,  W29

	EOR	W14, W14, W8, ROR #24 
	EOR	W15, W15, W9, ROR #24
	EOR	W16, W16, W6, ROR #24
	EOR	W17, W17, W7, ROR #24

	EOR	W19, W14, W14, ROR #23
	EOR	W20, W15, W15, ROR #23
	EOR	W21, W16, W16, ROR #23
	EOR	W18, W17, W17, ROR #23

	EOR	W10, W8, W18, ROR #3 
	EOR	W11, W9, W19, ROR #3 
	EOR	W12, W6, W20, ROR #3 
	EOR	W13, W7, W21, ROR #3 
	
	EOR	W2,  W2,  W18, ROR #27 
	EOR	W3,  W3,  W19, ROR #27 
	EOR	W4,  W4,  W20, ROR #27
	EOR	W5,  W5,  W21, ROR #27
	
	EOR	W6,  W26, W18, ROR #27 
	EOR	W7,  W27, W19, ROR #27 
	EOR	W8,  W28, W20, ROR #27 
	EOR	W9,  W29, W21, ROR #27 
.endm

.macro rho_w_chi_2 //W10 needs -8
	BIC	W14, W10, W9,  ROR #19 //W14 will need -8
	BIC	W15, W11, W6,  ROR #19
	BIC	W16, W12, W7,  ROR #19
	BIC	W17, W13, W8,  ROR #19
	
	BIC	W18, W2,  W10, ROR #13
	BIC	W19, W3,  W11, ROR #13
	BIC	W20, W4,  W12, ROR #13
	BIC	W21, W5,  W13, ROR #13
	
	BIC	W22, W9,  W2
	BIC	W23, W6,  W3
	BIC	W24, W7,  W4
	BIC	W25, W8,  W5
	
	EOR	W2,  W2,  W14, ROR #13
	EOR	W3,  W3,  W15, ROR #13
	EOR	W4,  W4,  W16, ROR #13
	EOR	W5,  W5,  W17, ROR #13
	
	EOR	W26,  W9,  W18 
	EOR	W27,  W6,  W19
	EOR	W28,  W7,  W20
	EOR	W29,  W8,  W21
	
	EOR	W6,  W22, W10, ROR #13 
	EOR	W7,  W23, W11, ROR #13
	EOR	W8,  W24, W12, ROR #13
	EOR	W9,  W25, W13, ROR #13
.endm

.macro rho_e
	ROR	W12, W6, #24
	ROR	W13, W7, #24
	ROR	W10, W8, #24
	ROR	W11, W9, #24
	
	ROR	W6, W26, #31
	ROR	W7, W27, #31
	ROR	W8, W28, #31
	ROR	W9, W29, #31
.endm



.align 16
.global Xoodootimes1_PermuteAll_6rounds
.type Xoodootimes1_PermuteAll_6rounds, %function
Xoodootimes1_PermuteAll_6rounds:

	LDP	W2,  W3,  [x0]
	LDP	W4,  W5,  [x0, #8]
	LDP	W6,  W7,  [x0, #16]
	LDP	W8,  W9,  [x0, #24]
	LDP	W10, W11, [x0, #32]
	LDP	W12, W13, [x0, #40]


	theta
	EOR	W2,  W2,  #0x60
	rho_w_chi
	rho_e_theta
	MOV	W0,  #0x2C
	EOR	W2,  W2,  W0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x380
	EOR	W2,  W2,  W0
	rho_w_chi_2
	rho_e_theta
	EOR	W2,  W2,  #0xF0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x1A0
	EOR	W2,  W2,  W0
	rho_w_chi_2
	rho_e_theta
	MOV	W0,  #0x12
	EOR	W2,  W2,  W0
	rho_w_chi_2
	rho_e


	STP	W2,  W3,  [x1]
	STP	W4,  W5,  [x1, #8]
	STP	W6,  W7,  [x1, #16]
	STP	W8,  W9,  [x1, #24]
	STP	W10, W11, [x1, #32]
	STP	W12, W13, [x1, #40]



	RET
