.text				

.macro theta_rho_w_2
	EOR3	V12.16B, V3.16B, V7.16B, V11.16B
	EOR3	V13.16B, V0.16B, V4.16B, V8.16B
	EOR3	V14.16B, V1.16B, V5.16B, V9.16B
	EOR3	V15.16B, V2.16B, V6.16B, V10.16B
	XAR	V16.2D, V12.2D, V24.2D, #46
	XAR	V17.2D, V13.2D, V24.2D, #46
	XAR	V18.2D, V14.2D, V24.2D, #46
	XAR	V19.2D, V15.2D, V24.2D, #46
	XAR	V20.2D, V12.2D, V16.2D, #54
	XAR	V21.2D, V13.2D, V17.2D, #54
	XAR	V22.2D, V14.2D, V18.2D, #54
	XAR	V23.2D, V15.2D, V19.2D, #54
	EOR	V0.16B, V0.16B, V20.16B
	EOR	V1.16B, V1.16B, V21.16B
	EOR	V2.16B, V2.16B, V22.16B
	EOR	V3.16B, V3.16B, V23.16B
	EOR	V4.16B, V4.16B, V20.16B
	EOR	V5.16B, V5.16B, V21.16B
	EOR	V6.16B, V6.16B, V22.16B
	EOR	V7.16B, V7.16B, V23.16B
	XAR	V8.2D,  V8.2D,  V20.2D, #42
	XAR	V9.2D,  V9.2D,  V21.2D, #42
	XAR	V10.2D, V10.2D, V22.2D, #42
	XAR	V11.2D, V11.2D, V23.2D, #42
.endm

.macro iota
	MOV	V25.2D[0], X3
	MOV	V25.2D[1], X3
	EOR	V0.16B, V0.16B, V25.16B
.endm

.macro rho_w_1_chi
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
	
	/*MOV	V4.16B, V16.16B
	MOV	V5.16B, V17.16B
	MOV	V6.16B, V18.16B
	MOV	V7.16B, V19.16B
	MOV	V8.16B, V20.16B
	MOV	V9.16B, V21.16B
	MOV	V10.16B, V22.16B
	MOV	V11.16B, V23.16B*/
.endm

.macro rho_e
	XAR	V4.2D, V16.2D, V24.2D, #62
	XAR	V5.2D, V17.2D, V24.2D, #62
	XAR	V6.2D, V18.2D, V24.2D, #62
	XAR	V7.2D, V19.2D, V24.2D, #62
	XAR	V10.2D, V20.2D, V24.2D, #48
	XAR	V11.2D, V21.2D, V24.2D, #48
	XAR	V8.2D,  V22.2D, V24.2D, #48
	XAR	V9.2D,  V23.2D, V24.2D, #48
.endm


.macro theta_rho_w_2_after_roll
	EOR3	V12.16B, V0.16B, V7.16B, V11.16B
	EOR3	V13.16B, V1.16B, V4.16B, V8.16B
	EOR3	V14.16B, V2.16B, V5.16B, V9.16B
	EOR3	V15.16B, V3.16B, V6.16B, V10.16B
	XAR	V16.2D, V12.2D, V24.2D, #46
	XAR	V17.2D, V13.2D, V24.2D, #46
	XAR	V18.2D, V14.2D, V24.2D, #46
	XAR	V19.2D, V15.2D, V24.2D, #46
	XAR	V20.2D, V12.2D, V16.2D, #54
	XAR	V21.2D, V13.2D, V17.2D, #54
	XAR	V22.2D, V14.2D, V18.2D, #54
	XAR	V23.2D, V15.2D, V19.2D, #54
	EOR	V0.16B, V4.16B,  V20.16B
	EOR	V1.16B, V5.16B,  V21.16B
	EOR	V2.16B, V6.16B,  V22.16B
	EOR	V3.16B, V7.16B,  V23.16B
	EOR	V4.16B, V8.16B,  V20.16B
	EOR	V5.16B, V9.16B,  V21.16B
	EOR	V6.16B, V10.16B, V22.16B
	EOR	V7.16B, V11.16B, V23.16B
	XAR	V8.2D,  V1.2D,  V20.2D, #42
	XAR	V9.2D,  V2.2D,  V21.2D, #42
	XAR	V10.2D, V3.2D,  V22.2D, #42
	XAR	V11.2D, V0.2D,  V23.2D, #42
.endm




	
	
.macro Xoodoo
	
	theta_rho_w_2
	MOV	X3, #0x3C00
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0x0CF0
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0xFC000
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	//MOV	X3, #0xFF00
	//iota
	MOVI	V25.2D, #0xFF00
	EOR	V0.16B, V25.16B, V0.16B
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0xCC00
	MOVK	X3, #0x0003, LSL #16
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0x030C
	iota
	rho_w_1_chi
	rho_e
.endm





.macro interleave
	
	# Interleave on a byte level
	ZIP1	V0.16B,  V12.16B, V0.16B
	ZIP1	V1.16B,  V13.16B, V1.16B
	ZIP1	V2.16B,  V14.16B, V2.16B
	ZIP1	V3.16B,  V15.16B, V3.16B
	ZIP1	V4.16B,  V16.16B, V4.16B
	ZIP1	V5.16B,  V17.16B, V5.16B
	ZIP1	V6.16B,  V18.16B, V6.16B
	ZIP1	V7.16B,  V19.16B, V7.16B
	ZIP1	V8.16B,  V20.16B, V8.16B
	ZIP1	V9.16B,  V21.16B, V9.16B
	ZIP1	V10.16B, V22.16B, V10.16B
	ZIP1	V11.16B, V23.16B, V11.16B

	# Swap 4 bits
	MOVI	V27.8H,  #0xF0,  LSL #8
	MOVI	V26.8H,  #0xF0
	MOVI	V28.8H,  #0x0F
	ORR	V27.16B, V27.16B, V28.16B
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #4
	SRI	V19.2D, V1.2D,  #4
	SRI	V20.2D, V2.2D,  #4
	SRI	V21.2D, V3.2D,  #4
	SRI	V22.2D, V4.2D,  #4
	SRI	V23.2D, V5.2D,  #4
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #4
	SLI	V13.2D, V13.2D, #4
	SLI	V14.2D, V14.2D, #4
	SLI	V15.2D, V15.2D, #4
	SLI	V16.2D, V16.2D, #4
	SLI	V17.2D, V17.2D, #4
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #4
	SRI	V19.2D, V7.2D,  #4
	SRI	V20.2D, V8.2D,  #4
	SRI	V21.2D, V9.2D,  #4
	SRI	V22.2D, V10.2D, #4
	SRI	V23.2D, V11.2D, #4
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #4
	SLI	V13.2D, V13.2D, #4
	SLI	V14.2D, V14.2D, #4
	SLI	V15.2D, V15.2D, #4
	SLI	V16.2D, V16.2D, #4
	SLI	V17.2D, V17.2D, #4
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B
		
	# Swap 2 bits
	MOVI	V26.16B, #0x0C
	MOVI	V27.16B, #0xC3
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #2
	SRI	V19.2D, V1.2D,  #2
	SRI	V20.2D, V2.2D,  #2
	SRI	V21.2D, V3.2D,  #2
	SRI	V22.2D, V4.2D,  #2
	SRI	V23.2D, V5.2D,  #2
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #2
	SLI	V13.2D, V13.2D, #2
	SLI	V14.2D, V14.2D, #2
	SLI	V15.2D, V15.2D, #2
	SLI	V16.2D, V16.2D, #2
	SLI	V17.2D, V17.2D, #2
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #2
	SRI	V19.2D, V7.2D,  #2
	SRI	V20.2D, V8.2D,  #2
	SRI	V21.2D, V9.2D,  #2
	SRI	V22.2D, V10.2D, #2
	SRI	V23.2D, V11.2D, #2
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #2
	SLI	V13.2D, V13.2D, #2
	SLI	V14.2D, V14.2D, #2
	SLI	V15.2D, V15.2D, #2
	SLI	V16.2D, V16.2D, #2
	SLI	V17.2D, V17.2D, #2
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B
	
	# Swap 1 bit
	MOVI	V26.16B, #0x22
	MOVI	V27.16B, #0x99
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #1
	SRI	V19.2D, V1.2D,  #1
	SRI	V20.2D, V2.2D,  #1
	SRI	V21.2D, V3.2D,  #1
	SRI	V22.2D, V4.2D,  #1
	SRI	V23.2D, V5.2D,  #1
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #1
	SLI	V13.2D, V13.2D, #1
	SLI	V14.2D, V14.2D, #1
	SLI	V15.2D, V15.2D, #1
	SLI	V16.2D, V16.2D, #1
	SLI	V17.2D, V17.2D, #1
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #1
	SRI	V19.2D, V7.2D,  #1
	SRI	V20.2D, V8.2D,  #1
	SRI	V21.2D, V9.2D,  #1
	SRI	V22.2D, V10.2D, #1
	SRI	V23.2D, V11.2D, #1
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #1
	SLI	V13.2D, V13.2D, #1
	SLI	V14.2D, V14.2D, #1
	SLI	V15.2D, V15.2D, #1
	SLI	V16.2D, V16.2D, #1
	SLI	V17.2D, V17.2D, #1
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B
	
.endm





.macro load4interleave reg

	# Load data to regs
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[1], [\reg]

.endm


.macro load1 reg
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
.endm

.macro load1copy4 reg

	load1 \reg
	
	MOV	V0.S[1], V0.S[0]
	MOV	V1.S[1], V1.S[0]
	MOV	V2.S[1], V2.S[0]
	MOV	V3.S[1], V3.S[0]
	
	MOV	V4.S[1], V4.S[0]
	MOV	V5.S[1], V5.S[0]
	MOV	V6.S[1], V6.S[0]
	MOV	V7.S[1], V7.S[0]
	
	MOV	V8.S[1], V8.S[0]
	MOV	V9.S[1], V9.S[0]
	MOV	V10.S[1], V10.S[0]
	MOV	V11.S[1], V11.S[0]
	
	MOV	V0.D[1], V0.D[0]
	MOV	V1.D[1], V1.D[0]
	MOV	V2.D[1], V2.D[0]
	MOV	V3.D[1], V3.D[0]
	
	MOV	V4.D[1], V4.D[0]
	MOV	V5.D[1], V5.D[0]
	MOV	V6.D[1], V6.D[0]
	MOV	V7.D[1], V7.D[0]
	
	MOV	V8.D[1], V8.D[0]
	MOV	V9.D[1], V9.D[0]
	MOV	V10.D[1], V10.D[0]
	MOV	V11.D[1], V11.D[0]
	
	/*
	MOV	V12.16B, V0.16B
	MOV	V13.16B, V1.16B
	MOV	V14.16B, V2.16B
	MOV	V15.16B, V3.16B
	
	MOV	V16.16B, V4.16B
	MOV	V17.16B, V5.16B
	MOV	V18.16B, V6.16B
	MOV	V19.16B, V7.16B
	
	MOV	V20.16B, V8.16B
	MOV	V21.16B, V9.16B
	MOV	V22.16B, V10.16B
	MOV	V23.16B, V11.16B*/
.endm

.macro load1copy2interleave reg

	# Load data to regs
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	
	MOV	V12.S[0], V0.S[0]
	MOV	V13.S[0], V1.S[0]
	MOV	V14.S[0], V2.S[0]
	MOV	V15.S[0], V3.S[0]
	
	MOV	V16.S[0], V4.S[0]
	MOV	V17.S[0], V5.S[0]
	MOV	V18.S[0], V6.S[0]
	MOV	V19.S[0], V7.S[0]
	
	MOV	V20.S[0], V8.S[0]
	MOV	V21.S[0], V9.S[0]
	MOV	V22.S[0], V10.S[0]
	MOV	V23.S[0], V11.S[0]
.endm

.macro load1copy4interleave reg

	# Load data to regs
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	
	MOV	V0.S[1], V0.S[0]
	MOV	V1.S[1], V1.S[0]
	MOV	V2.S[1], V2.S[0]
	MOV	V3.S[1], V3.S[0]
	
	MOV	V4.S[1], V4.S[0]
	MOV	V5.S[1], V5.S[0]
	MOV	V6.S[1], V6.S[0]
	MOV	V7.S[1], V7.S[0]
	
	MOV	V8.S[1], V8.S[0]
	MOV	V9.S[1], V9.S[0]
	MOV	V10.S[1], V10.S[0]
	MOV	V11.S[1], V11.S[0]
	
	
	MOV	V12.D[0], V0.D[0]
	MOV	V13.D[0], V1.D[0]
	MOV	V14.D[0], V2.D[0]
	MOV	V15.D[0], V3.D[0]
	
	MOV	V16.D[0], V4.D[0]
	MOV	V17.D[0], V5.D[0]
	MOV	V18.D[0], V6.D[0]
	MOV	V19.D[0], V7.D[0]
	
	MOV	V20.D[0], V8.D[0]
	MOV	V21.D[0], V9.D[0]
	MOV	V22.D[0], V10.D[0]
	MOV	V23.D[0], V11.D[0]
.endm


	
.macro deinterleave_store reg
	
	# Swap 1 bit
	MOVI	V26.16B, #0x22
	MOVI	V27.16B, #0x99
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #1
	SRI	V19.2D, V1.2D,  #1
	SRI	V20.2D, V2.2D,  #1
	SRI	V21.2D, V3.2D,  #1
	SRI	V22.2D, V4.2D,  #1
	SRI	V23.2D, V5.2D,  #1
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #1
	SLI	V13.2D, V13.2D, #1
	SLI	V14.2D, V14.2D, #1
	SLI	V15.2D, V15.2D, #1
	SLI	V16.2D, V16.2D, #1
	SLI	V17.2D, V17.2D, #1
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #1
	SRI	V19.2D, V7.2D,  #1
	SRI	V20.2D, V8.2D,  #1
	SRI	V21.2D, V9.2D,  #1
	SRI	V22.2D, V10.2D, #1
	SRI	V23.2D, V11.2D, #1
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #1
	SLI	V13.2D, V13.2D, #1
	SLI	V14.2D, V14.2D, #1
	SLI	V15.2D, V15.2D, #1
	SLI	V16.2D, V16.2D, #1
	SLI	V17.2D, V17.2D, #1
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B
	
	# Swap 2 bits
	MOVI	V26.16B, #0x0C
	MOVI	V27.16B, #0xC3
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #2
	SRI	V19.2D, V1.2D,  #2
	SRI	V20.2D, V2.2D,  #2
	SRI	V21.2D, V3.2D,  #2
	SRI	V22.2D, V4.2D,  #2
	SRI	V23.2D, V5.2D,  #2
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #2
	SLI	V13.2D, V13.2D, #2
	SLI	V14.2D, V14.2D, #2
	SLI	V15.2D, V15.2D, #2
	SLI	V16.2D, V16.2D, #2
	SLI	V17.2D, V17.2D, #2
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #2
	SRI	V19.2D, V7.2D,  #2
	SRI	V20.2D, V8.2D,  #2
	SRI	V21.2D, V9.2D,  #2
	SRI	V22.2D, V10.2D, #2
	SRI	V23.2D, V11.2D, #2
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #2
	SLI	V13.2D, V13.2D, #2
	SLI	V14.2D, V14.2D, #2
	SLI	V15.2D, V15.2D, #2
	SLI	V16.2D, V16.2D, #2
	SLI	V17.2D, V17.2D, #2
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B
	
	# Swap 4 bits
	MOVI	V27.8H,  #0xF0,  LSL #8
	MOVI	V26.8H,  #0xF0
	MOVI	V28.8H,  #0x0F
	ORR	V27.16B, V27.16B, V28.16B
	
	AND	V12.16B, V0.16B, V26.16B
	AND	V13.16B, V1.16B, V26.16B
	AND	V14.16B, V2.16B, V26.16B
	AND	V15.16B, V3.16B, V26.16B
	AND	V16.16B, V4.16B, V26.16B
	AND	V17.16B, V5.16B, V26.16B
	SRI	V18.2D, V0.2D,  #4
	SRI	V19.2D, V1.2D,  #4
	SRI	V20.2D, V2.2D,  #4
	SRI	V21.2D, V3.2D,  #4
	SRI	V22.2D, V4.2D,  #4
	SRI	V23.2D, V5.2D,  #4
	AND	V0.16B, V0.16B, V27.16B
	AND	V1.16B, V1.16B, V27.16B
	AND	V2.16B, V2.16B, V27.16B
	AND	V3.16B, V3.16B, V27.16B
	AND	V4.16B, V4.16B, V27.16B
	AND	V5.16B, V5.16B, V27.16B
	SLI	V12.2D, V12.2D, #4
	SLI	V13.2D, V13.2D, #4
	SLI	V14.2D, V14.2D, #4
	SLI	V15.2D, V15.2D, #4
	SLI	V16.2D, V16.2D, #4
	SLI	V17.2D, V17.2D, #4
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V0.16B, V0.16B, V12.16B, V18.16B
	EOR3	V1.16B, V1.16B, V13.16B, V19.16B
	EOR3	V2.16B, V2.16B, V14.16B, V20.16B
	EOR3	V3.16B, V3.16B, V15.16B, V21.16B
	EOR3	V4.16B, V4.16B, V16.16B, V22.16B
	EOR3	V5.16B, V5.16B, V17.16B, V23.16B
	
	AND	V12.16B, V6.16B,  V26.16B
	AND	V13.16B, V7.16B,  V26.16B
	AND	V14.16B, V8.16B,  V26.16B
	AND	V15.16B, V9.16B,  V26.16B
	AND	V16.16B, V10.16B, V26.16B
	AND	V17.16B, V11.16B, V26.16B
	SRI	V18.2D, V6.2D,  #4
	SRI	V19.2D, V7.2D,  #4
	SRI	V20.2D, V8.2D,  #4
	SRI	V21.2D, V9.2D,  #4
	SRI	V22.2D, V10.2D, #4
	SRI	V23.2D, V11.2D, #4
	AND	V6.16B,  V6.16B,  V27.16B
	AND	V7.16B,  V7.16B,  V27.16B
	AND	V8.16B,  V8.16B,  V27.16B
	AND	V9.16B,  V9.16B,  V27.16B
	AND	V10.16B, V10.16B, V27.16B
	AND	V11.16B, V11.16B, V27.16B
	SLI	V12.2D, V12.2D, #4
	SLI	V13.2D, V13.2D, #4
	SLI	V14.2D, V14.2D, #4
	SLI	V15.2D, V15.2D, #4
	SLI	V16.2D, V16.2D, #4
	SLI	V17.2D, V17.2D, #4
	AND	V18.16B, V18.16B, V26.16B
	AND	V19.16B, V19.16B, V26.16B
	AND	V20.16B, V20.16B, V26.16B
	AND	V21.16B, V21.16B, V26.16B
	AND	V22.16B, V22.16B, V26.16B
	AND	V23.16B, V23.16B, V26.16B
	EOR3	V6.16B,  V6.16B,  V12.16B, V18.16B
	EOR3	V7.16B,  V7.16B,  V13.16B, V19.16B
	EOR3	V8.16B,  V8.16B,  V14.16B, V20.16B
	EOR3	V9.16B,  V9.16B,  V15.16B, V21.16B
	EOR3	V10.16B, V10.16B, V16.16B, V22.16B
	EOR3	V11.16B, V11.16B, V17.16B, V23.16B

	# De-interleave on a byte level
	UZP2	V12.16B, V0.16B, V4.16B
	UZP2	V13.16B, V1.16B, V5.16B
	UZP2	V14.16B, V2.16B, V6.16B
	UZP2	V15.16B, V3.16B, V7.16B
	UZP2	V16.16B, V8.16B, V0.16B
	UZP2	V17.16B, V9.16B, V0.16B
	UZP2	V18.16B, V10.16B, V0.16B
	UZP2	V19.16B, V11.16B, V0.16B
	UZP1	V20.16B,  V0.16B, V4.16B
	UZP1	V21.16B,  V1.16B, V5.16B
	UZP1	V22.16B, V2.16B, V6.16B
	UZP1	V23.16B, V3.16B, V7.16B
	UZP1	V28.16B, V8.16B, V0.16B
	UZP1	V29.16B, V9.16B, V0.16B
	UZP1	V30.16B, V10.16B, V0.16B
	UZP1	V31.16B, V11.16B, V0.16B
	
	# Final Store
	ST4	{V12.S, V13.S, V14.S, V15.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[2], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[2], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V28.S, V29.S, V30.S, V31.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V12.S, V13.S, V14.S, V15.S}[3], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V16.S, V17.S, V18.S, V19.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V20.S, V21.S, V22.S, V23.S}[3], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V28.S, V29.S, V30.S, V31.S}[1], [\reg]
	//ADD	\reg, \reg, #16
	
.endm


	
	
	
	
	
	
	
	
.macro load4 reg
	LD4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V0.S, V1.S, V2.S, V3.S}[3], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V4.S, V5.S, V6.S, V7.S}[3], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[3], [\reg]
	SUB	\reg, \reg, #176
.endm


.macro load4toV12 reg
	LD4	{V12.S, V13.S, V14.S, V15.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[0], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[1], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[2], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V12.S, V13.S, V14.S, V15.S}[3], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V16.S, V17.S, V18.S, V19.S}[3], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V20.S, V21.S, V22.S, V23.S}[3], [\reg]
	SUB	\reg, \reg, #176
.endm

.macro load4linear reg
	LD1	{V0.2D, V1.2D, V2.2D, V3.2D}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V4.2D, V5.2D, V6.2D, V7.2D}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V8.2D, V9.2D, V10.2D, V11.2D}, [\reg]
	//SUB	\reg\(), \reg\(), #128
.endm

.macro load4linear_toV12 reg
	/*LD1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V13.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V14.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V15.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V16.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V17.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V18.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V19.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V20.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V21.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V22.2D}, [\reg]
	ADD	\reg, \reg, #16
	LD1	{V23.2D}, [\reg]
	SUB	\reg, \reg, #176*/
	
	LD1	{V12.4S, V13.4S, V14.4S, V15.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V16.4S, V17.4S, V18.4S, V19.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V20.4S, V21.4S, V22.4S, V23.4S}, [\reg]
	//SUB	\reg\(), \reg\(), #128
.endm

.macro load4linear_pre_roll reg
	LD1	{V10.4S, V11.4S}, [\reg]
	ADD	\reg\(), \reg\(), #32
	LD1	{V8.4S, V9.4S}, [\reg]
	ADD	\reg\(), \reg\(), #32
	LD1	{V3.4S}, [\reg]
	ADD	\reg\(), \reg\(), #16
	LD1	{V0.4S, V1.4S, V2.4S}, [\reg]
	ADD	\reg\(), \reg\(), #48
	LD1	{V7.4S}, [\reg]
	ADD	\reg\(), \reg\(), #16
	LD1	{V4.4S, V5.4S, V6.4S}, [\reg]
	SUB	\reg\(), \reg\(), #144
.endm

.macro load2linear_toV12 reg
	LD4	{V12.D, V13.D, V14.D, V15.D}[0], [\reg]
	ADD	\reg\(), \reg\(), #32
	LD4	{V16.D, V17.D, V18.D, V19.D}[0], [\reg]
	ADD	\reg\(), \reg\(), #32
	LD4	{V20.D, V21.D, V22.D, V23.D}[0], [\reg]
.endm

.macro load2linear_and_copy_toV12 reg
	load2linear_toV12 \reg
	
	MOV	V12.D[1], V12.D[0]
	MOV	V13.D[1], V13.D[0]
	MOV	V14.D[1], V14.D[0]
	MOV	V15.D[1], V15.D[0]
	MOV	V16.D[1], V16.D[0]
	MOV	V17.D[1], V17.D[0]
	MOV	V18.D[1], V18.D[0]
	MOV	V19.D[1], V19.D[0]
	MOV	V20.D[1], V20.D[0]
	MOV	V21.D[1], V21.D[0]
	MOV	V22.D[1], V22.D[0]
	MOV	V23.D[1], V23.D[0]
.endm








	
.macro store4 reg
	ST4	{V0.S, V1.S, V2.S, V3.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[0], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[1], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[2], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[2], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[2], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V0.S, V1.S, V2.S, V3.S}[3], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V4.S, V5.S, V6.S, V7.S}[3], [\reg]
	ADD	\reg, \reg, #16
	ST4	{V8.S, V9.S, V10.S, V11.S}[3], [\reg]
	SUB	\reg, \reg, #176
.endm


.macro store4linear reg
	ST1	{V0.2D, V1.2D, V2.2D, V3.2D}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V4.2D, V5.2D, V6.2D, V7.2D}, [\reg]
	ADD	\reg\(), \reg\(), #64
	ST1	{V8.2D, V9.2D, V10.2D, V11.2D}, [\reg]
	//SUB	\reg\(), \reg\(), #128
.endm

.macro store2linear reg
	ST4	{V0.D, V1.D, V2.D, V3.D}[0], [\reg]
	ADD	\reg\(), \reg\(), #32
	ST4	{V4.D, V5.D, V6.D, V7.D}[0], [\reg]
	ADD	\reg\(), \reg\(), #32
	ST4	{V8.D, V9.D, V10.D, V11.D}[0], [\reg]
	//SUB	\reg\(), \reg\(), #64
.endm

.macro store4linear_post_roll_toV12 reg
	/*ST1	{V17.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V18.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V19.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V16.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	
	ST1	{V21.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V22.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V23.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V20.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	
	ST1	{V14.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V15.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V12.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V13.2D}, [\reg]*/
	
	ST1	{V17.2D, V18.2D, V19.2D}, [\reg]
	ADD	\reg\(), \reg\(), #48
	ST1	{V16.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V21.2D, V22.2D, V23.2D}, [\reg]
	ADD	\reg\(), \reg\(), #48
	ST1	{V20.2D}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V14.2D, V15.2D}, [\reg]
	ADD	\reg\(), \reg\(), #32
	ST1	{V12.2D, V13.2D}, [\reg]
.endm

.macro store4linear_post_roll reg
	ST1	{V5.4S, V6.4S, V7.4S}, [\reg]
	ADD	\reg\(), \reg\(), #48
	ST1	{V4.4S}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V9.4S, V10.4S, V11.4S}, [\reg]
	ADD	\reg\(), \reg\(), #48
	ST1	{V8.4S}, [\reg]
	ADD	\reg\(), \reg\(), #16
	ST1	{V2.4S, V3.4S}, [\reg]
	ADD	\reg\(), \reg\(), #32
	ST1	{V0.4S, V1.4S}, [\reg]
.endm









.global Xoodootimes4sha_interleaving_6rounds
.type Xoodootimes4sha_interleaving_6rounds,%function

Xoodootimes4sha_interleaving_6rounds:
	
	load4interleave x0
	interleave
	
	MOVI	V24.4S,  #0x00
	Xoodoo

	deinterleave_store x1

	RET
	
.global Xoodootimes4sha_interleaving_6rounds_no_interleave
.type Xoodootimes4sha_interleaving_6rounds_no_interleave,%function

Xoodootimes4sha_interleaving_6rounds_no_interleave:
	
	load4			x0 //used for comparison with other Xoodoo4 implementations
	//load4linear		x0 //best case scenario if data is already interleaved
	
	MOVI	V24.4S,  #0x00
	Xoodoo

	store4			 x1 
	//store4linear		 x1

	RET
	
	
	
	
	
	

.macro roll_mix A, B, C, D, dest, work1, work2
	AND	\work1\().8B,	\A\().8B, V25.8B
	AND	\work2\().8B,	\B\().8B, V26.8B
	AND	V30.8B,		\C\().8B, V25.8B
	AND	V31.8B,		\D\().8B, V26.8B
	EOR	\work1\().8B,	\work1\().8B, \work2\().8B
	EOR	V30.8B	,	V30.8B, V31.8B
	MOV	\work1\().D[1],	V30.D[0]
	
	EOR	\dest\().16B,	\dest\().16B, \work1\().16B
.endm

.macro first_roll_Xc reg 
	MOVI	V25.16B, #0xAA 
	MOVI	V26.16B, #0x55
	
	SHL	V30.2D, V12.2D, #26
	XAR	V31.2D, V16.2D, V24.2D, #58
	EOR3	V27.16B, V12.16B, V30.16B, V31.16B
	
	roll_mix V12, V16, V20, V13, V0, V28, V29
	ST1	{V28.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V13, V17, V21, V14, V1, V28, V29
	ST1	{V28.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V14, V18, V22, V15, V2, V28, V29
	ST1	{V28.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V15, V19, V23, V27, V3, V28, V29
	ST1	{V28.2D}, [\reg]
	ADD	\reg, \reg, #16
	
	
	SHL	V30.2D, V16.2D, #26 
	XAR	V31.2D, V20.2D, V24.2D, #58
	EOR3	V28.16B, V16.16B, V30.16B, V31.16B
	
	roll_mix V16, V20, V13, V17, V4, V12, V29
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V17, V21, V14, V18, V5, V12, V29
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V18, V22, V15, V19, V6, V12, V29
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V19, V23, V27, V28, V7, V12, V29
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	
	
	SHL	V30.2D, V20.2D, #26 
	XAR	V31.2D, V13.2D, V24.2D, #58 //check 13?
	EOR3	V29.16B, V20.16B, V30.16B, V31.16B
	
	roll_mix V20, V13, V17, V21, V8,  V12, V16
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V21, V14, V18, V22, V9,  V12, V16
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V22, V15, V19, V23, V10, V12, V16
	ST1	{V12.2D}, [\reg]
	ADD	\reg, \reg, #16
	roll_mix V23, V27, V28, V29, V11, V12, V16
	ST1	{V12.2D}, [\reg]
	//SUB	\reg, \reg, #176 
.endm

.macro copy_plane_to_V0 A0, A1, A2, A3, B0, B1, B2, B3, C0, C1, C2, C3, plane
	MOV	V0.4S[\plane], \A0\().4S[0]
	MOV	V1.4S[\plane], \A1\().4S[0]
	MOV	V2.4S[\plane], \A2\().4S[0]
	MOV	V3.4S[\plane], \A3\().4S[0]
	
	MOV	V4.4S[\plane], \B0\().4S[0]
	MOV	V5.4S[\plane], \B1\().4S[0]
	MOV	V6.4S[\plane], \B2\().4S[0]
	MOV	V7.4S[\plane], \B3\().4S[0]
	
	MOV	V8.4S[\plane],  \C0\().4S[0]
	MOV	V9.4S[\plane],  \C1\().4S[0]
	MOV	V10.4S[\plane], \C2\().4S[0]
	MOV	V11.4S[\plane], \C3\().4S[0]
.endm

.macro copy_plane_toV12 A0, A1, A2, A3, B0, B1, B2, B3, C0, C1, C2, C3, plane
	MOV	V12.4S[\plane], \A0\().4S[0]
	MOV	V13.4S[\plane], \A1\().4S[0]
	MOV	V14.4S[\plane], \A2\().4S[0]
	MOV	V15.4S[\plane], \A3\().4S[0]
	
	MOV	V16.4S[\plane], \B0\().4S[0]
	MOV	V17.4S[\plane], \B1\().4S[0]
	MOV	V18.4S[\plane], \B2\().4S[0]
	MOV	V19.4S[\plane], \B3\().4S[0]
	
	MOV	V20.4S[\plane],  \C0\().4S[0]
	MOV	V21.4S[\plane],  \C1\().4S[0]
	MOV	V22.4S[\plane], \C2\().4S[0]
	MOV	V23.4S[\plane], \C3\().4S[0]
.endm

.macro first_roll_Xc_v2 reg
	SRI	V16.4S, V4.4S, #29
	SRI	V18.4S, V8.4S, #29
	SRI	V20.4S, V1.4S, #29
	
	SHL	V15.4S, V0.4S, #13
	SHL	V17.4S, V4.4S, #13 
	SHL	V19.4S, V8.4S, #13
	
	SLI	V16.4S, V4.4S, #3
	SLI	V18.4S, V8.4S, #3
	SLI	V20.4S, V1.4S, #3
	
	EOR3	V26.16B, V0.16B, V15.16B, V16.16B
	EOR3	V27.16B, V4.16B, V17.16B, V18.16B
	EOR3	V28.16B, V8.16B, V19.16B, V20.16B
	
	copy_plane_toV12 V4, V5, V6,  V7,  V8, V9, V10, V11, V1, V2,  V3,  V26, 0
	copy_plane_to_V0  V8, V9, V10, V11, V1, V2, V3,  V26, V5, V6,  V7,  V27, 1
	copy_plane_toV12 V1, V2, V3,  V26, V5, V6, V7,  V27, V9, V10, V11, V28, 1
.endm




.macro roll_Xc_second
	SHL	V25.2D, V16.2D, #26 
	XAR	V26.2D, V20.2D, V24.2D, #58
	
	SHL	V27.2D, V20.2D, #26 
	XAR	V28.2D, V13.2D, V24.2D, #58
	
	SHL	V29.2D, V12.2D, #26 
	XAR	V30.2D, V16.2D, V24.2D, #58
	
	EOR3	V16.16B, V16.16B, V25.16B, V26.16B
	
	SHL	V25.2D, V13.2D, #26 
	XAR	V26.2D, V17.2D, V24.2D, #58
	
	EOR3	V20.16B, V20.16B, V27.16B, V28.16B
	EOR3	V12.16B, V12.16B, V29.16B, V30.16B
	EOR3	V13.16B, V13.16B, V25.16B, V26.16B
	
	
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



.macro sum
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


.global Compressiontimes4i_first
.type Compressiontimes4i_first,%function

Compressiontimes4i_first:
	MOVI	V24.4S,  #0x00
	
	//load1copy4 x1 // interleave version?
	load1copy2interleave x1
	interleave
	
	//store4linear x2
	//SUB	X2, X2, #128
	store2linear x2
	SUB X2, X2, #64
	
	
	load4interleave x0
	interleave
	
	//load4linear_toV12 x2
	//SUB	x2, x2, #128
	load2linear_toV12 x2
	SUB	x2, x2, #64
	
	first_roll_Xc x2
	
	Xoodoo
	
	RET
	
.global Compressiontimes4i_first2
.type Compressiontimes4i_first2,%function

Compressiontimes4i_first2:
	MOVI	V24.4S,  #0x00
	
	load1 x1
	first_roll_Xc_v2 x2
	interleave
	store4linear x2
	SUB	x2, x2, #128
	
	load4interleave x0
	interleave
	
	load4linear_toV12 x2
	
	sum
	
	Xoodoo
	
	RET

.global Compressiontimes4i
.type Compressiontimes4i,%function

Compressiontimes4i:
	
	load4interleave x0
	interleave
	
	load4linear_toV12 x1
	SUB	x1, x1, #128
	roll_Xc_second
	store4linear_post_roll_toV12 x1
	
	Xoodoo
	
	RET





.macro roll_Xe_first 
	MOVI	V25.2S, #0x7

	AND	V12.8B, V4.8B,  V8.8B 
	AND	V13.8B, V8.8B,  V1.8B
	AND	V14.8B, V1.8B,  V5.8B
	
	SRI	V15.4S, V0.4S, #27
	SRI	V16.4S, V4.4S, #19
	SRI	V17.4S, V4.4S, #27 
	SRI	V18.4S, V8.4S, #19
	SRI	V19.4S, V8.4S, #27 
	SRI	V20.4S, V1.4S, #19
	
	EOR	V12.8B, V12.8B, V25.8B
	EOR	V13.8B, V13.8B, V25.8B
	EOR	V14.8B, V14.8B, V25.8B
	
	SLI	V15.4S, V0.4S, #5
	SLI	V16.4S, V4.4S, #13
	SLI	V17.4S, V4.4S, #5 
	SLI	V18.4S, V8.4S, #13
	SLI	V19.4S, V8.4S, #5 
	SLI	V20.4S, V1.4S, #13
	
	EOR3	V26.16B, V12.16B, V15.16B, V16.16B
	EOR3	V27.16B, V13.16B, V17.16B, V18.16B
	EOR3	V28.16B, V14.16B, V19.16B, V20.16B
	
	copy_plane_toV12 V4, V5, V6,  V7,  V8, V9, V10, V11, V1, V2,  V3,  V26, 0
	copy_plane_to_V0  V8, V9, V10, V11, V1, V2, V3,  V26, V5, V6,  V7,  V27, 1
	copy_plane_toV12 V1, V2, V3,  V26, V5, V6, V7,  V27, V9, V10, V11, V28, 1
.endm
	

.macro roll_Xe_second
	MOV	V25.D[0], X3
	MOV	V25.D[1], V25.D[0]
	
	AND	V12.16B, V7.16B, V11.16B 
	AND	V13.16B, V11.16B, V0.16B
	AND	V14.16B, V3.16B, V7.16B
	AND	V15.16B, V0.16B, V4.16B
	

	XAR	V16.2D, V3.2D, V24.2D, #54 
	XAR	V17.2D, V7.2D, V25.2D, #38
	
	XAR	V18.2D, V7.2D, V24.2D, #54 
	XAR	V19.2D, V11.2D, V25.2D, #38
	
	XAR	V20.2D, V10.2D, V24.2D, #54 
	XAR	V21.2D, V3.2D, V25.2D, #38
	
	XAR	V22.2D, V11.2D, V24.2D, #54 
	XAR	V23.2D, V0.2D, V25.2D, #38
	
	EOR3	V3.16B, V12.16B, V16.16B, V17.16B
	EOR3	V7.16B, V13.16B, V18.16B, V19.16B
	EOR3	V10.16B, V14.16B, V20.16B, V21.16B
	EOR3	V11.16B, V15.16B, V22.16B, V23.16B
.endm



.global Expansiontimes4i_first
.type Expansiontimes4i_first,%function

Expansiontimes4i_first:
	MOVI	V24.4S,  #0x00
	
	load1		x1
	roll_Xe_first
	interleave
	store4linear	x3
	
	Xoodoo
	store4linear	x0
	SUB	x0, x0, #128
	
	load1copy4interleave x2
	SUB	x2, x2, #32
	interleave
	store4linear	x2
	//store2linear	x2
	
	load4linear_toV12 x0
	
	sum
	
	
	RET





.macro roll_Xe_second2
	MOV	V25.D[0], X3
	MOV	V25.D[1], V25.D[0]
	
	AND	V12.16B, V4.16B, V8.16B 
	AND	V13.16B, V5.16B, V9.16B
	AND	V14.16B, V8.16B, V1.16B
	AND	V15.16B, V1.16B, V5.16B
	

	XAR	V16.2D, V0.2D, V24.2D, #54 
	XAR	V17.2D, V4.2D, V25.2D, #38
	
	XAR	V18.2D, V1.2D, V24.2D, #54 
	XAR	V19.2D, V5.2D, V25.2D, #38
	
	XAR	V20.2D, V4.2D, V24.2D, #54 
	XAR	V21.2D, V8.2D, V25.2D, #38
	
	XAR	V22.2D, V8.2D, V24.2D, #54 
	XAR	V23.2D, V1.2D, V25.2D, #38
	
	EOR3	V0.16B, V12.16B, V16.16B, V17.16B
	EOR3	V1.16B, V13.16B, V18.16B, V19.16B
	EOR3	V4.16B, V14.16B, V20.16B, V21.16B
	EOR3	V8.16B, V15.16B, V22.16B, V23.16B
.endm

.macro theta_rho_w_2_post_roll
	EOR3	V12.16B, V4.16B, V8.16B,  V1.16B
	EOR3	V13.16B, V5.16B, V9.16B,  V2.16B
	EOR3	V14.16B, V6.16B, V10.16B, V3.16B
	EOR3	V15.16B, V7.16B, V11.16B, V0.16B
	XAR	V16.2D, V12.2D, V24.2D, #46
	XAR	V17.2D, V13.2D, V24.2D, #46
	XAR	V18.2D, V14.2D, V24.2D, #46
	XAR	V19.2D, V15.2D, V24.2D, #46
	XAR	V20.2D, V12.2D, V16.2D, #54
	XAR	V21.2D, V13.2D, V17.2D, #54
	XAR	V22.2D, V14.2D, V18.2D, #54
	XAR	V23.2D, V15.2D, V19.2D, #54
	EOR	V12.16B, V9.16B,  V20.16B 
	EOR	V13.16B, V10.16B, V21.16B
	EOR	V14.16B, V11.16B, V22.16B
	EOR	V15.16B, V8.16B,  V23.16B
	XAR	V8.2D,  V2.2D, V20.2D, #42
	XAR	V9.2D,  V3.2D, V21.2D, #42
	XAR	V10.2D, V0.2D, V22.2D, #42
	XAR	V11.2D, V1.2D, V23.2D, #42
	EOR	V0.16B, V5.16B, V20.16B
	EOR	V1.16B, V6.16B, V21.16B
	EOR	V2.16B, V7.16B, V22.16B
	EOR	V3.16B, V4.16B, V23.16B
.endm

.macro rho_w_1_chi_post_roll
	BCAX	V16.16B, V15.16B, V0.16B, V8.16B
	BCAX	V17.16B, V12.16B, V1.16B, V9.16B
	BCAX	V18.16B, V13.16B, V2.16B, V10.16B
	BCAX	V19.16B, V14.16B, V3.16B, V11.16B
	BCAX	V20.16B, V8.16B,  V15.16B, V0.16B
	BCAX	V21.16B, V9.16B,  V12.16B, V1.16B
	BCAX	V22.16B, V10.16B, V13.16B, V2.16B
	BCAX	V23.16B, V11.16B, V14.16B, V3.16B
	BCAX	V0.16B, V0.16B, V8.16B,  V15.16B
	BCAX	V1.16B, V1.16B, V9.16B,  V12.16B
	BCAX	V2.16B, V2.16B, V10.16B, V13.16B
	BCAX	V3.16B, V3.16B, V11.16B, V14.16B
.endm

.macro XoodooPostRoll
	theta_rho_w_2_post_roll
	MOV	X3, #0x3C00
	iota
	rho_w_1_chi_post_roll
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0x0CF0
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0xFC000
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	//MOV	X3, #0xFF00
	//iota
	MOVI	V25.2D, #0xFF00
	EOR	V0.16B, V25.16B, V0.16B
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0xCC00
	MOVK	X3, #0x0003, LSL #16
	iota
	rho_w_1_chi
	rho_e
	
	theta_rho_w_2
	MOV	X3, #0x030C
	iota
	rho_w_1_chi
	rho_e
.endm



.global Expansiontimes4i
.type Expansiontimes4i,%function

Expansiontimes4i:	
	MOV	X3, 0xFC000000000
	MOVI	V24.4S,  #0x00
	
	
	////	old implementation
	load4linear_pre_roll	X2
	roll_Xe_second
	store4linear	X2
	
	Xoodoo
	// */
	
	
	/*///	new implementation
	load4linear		x2
	SUB	x2, x2, #128
	roll_Xe_second2 
	store4linear_post_roll	X2
	
	XoodooPostRoll 
	// */
	
	
	////	last part of both implementations
	load4linear_toV12 X1
	//load2linear_and_copy_toV12 X1
	
	
	sum
	
	//deinterleave_store x0
	
	RET











.macro move12to0
	MOV	V0.16B, V12.16B
	MOV	V1.16B, V13.16B
	MOV	V2.16B, V14.16B
	MOV	V3.16B, V15.16B

	MOV	V4.16B, V16.16B
	MOV	V5.16B, V17.16B
	MOV	V6.16B, V18.16B
	MOV	V7.16B, V19.16B
	
	MOV	V8.16B, V20.16B
	MOV	V9.16B, V21.16B
	MOV	V10.16B, V22.16B
	MOV	V11.16B, V23.16B
.endm


.global store_i
.type store_i,%function

store_i:
	//move12to0

	deinterleave_store x0
	
	RET




	
