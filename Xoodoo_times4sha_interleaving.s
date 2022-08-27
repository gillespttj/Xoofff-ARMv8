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
	EOR	V26.16B, V0.16B, V25.16B
.endm

.macro rho_w_1_chi
	BCAX	V16.16B, V7.16B, V26.16B, V8.16B
	BCAX	V17.16B, V4.16B, V1.16B, V9.16B
	BCAX	V18.16B, V5.16B, V2.16B, V10.16B
	BCAX	V19.16B, V6.16B, V3.16B, V11.16B
	BCAX	V20.16B, V8.16B,  V7.16B, V26.16B
	BCAX	V21.16B, V9.16B,  V4.16B, V1.16B
	BCAX	V22.16B, V10.16B, V5.16B, V2.16B
	BCAX	V23.16B, V11.16B, V6.16B, V3.16B
	BCAX	V0.16B, V26.16B, V8.16B,  V7.16B
	BCAX	V1.16B, V1.16B, V9.16B,  V4.16B
	BCAX	V2.16B, V2.16B, V10.16B, V5.16B
	BCAX	V3.16B, V3.16B, V11.16B, V6.16B
	
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
	MOV	X3, #0xFF00
	iota
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

.macro load1copy4 reg

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
	MOV	V23.16B, V11.16B
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
	MOVI	V26.8H,  #0x0C
	MOVI	V27.8H,  #0xC3
	MOVI	V28.8H,  #0x0C, LSL #8
	MOVI	V29.8H,  #0xC3, LSL #8
	ORR	V26.16B, V26.16B, V28.16B
	ORR	V27.16B, V27.16B, V29.16B
	
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
	MOVI	V26.8H,  #0x22
	MOVI	V27.8H,  #0x99
	MOVI	V28.8H,  #0x22, LSL #8
	MOVI	V29.8H,  #0x99, LSL #8
	ORR	V26.16B, V26.16B, V28.16B
	ORR	V27.16B, V27.16B, V29.16B
	
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
	



	
.macro deinterleave_store reg
	
	# Swap 1 bit
	MOVI	V26.8H,  #0x22
	MOVI	V27.8H,  #0x99
	MOVI	V28.8H,  #0x22, LSL #8
	MOVI	V29.8H,  #0x99, LSL #8
	ORR	V26.16B, V26.16B, V28.16B
	ORR	V27.16B, V27.16B, V29.16B
	
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
	MOVI	V26.8H,  #0x0C
	MOVI	V27.8H,  #0xC3
	MOVI	V28.8H,  #0x0C, LSL #8
	MOVI	V29.8H,  #0xC3, LSL #8
	ORR	V26.16B, V26.16B, V28.16B
	ORR	V27.16B, V27.16B, V29.16B
	
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
	ADD	\reg, \reg, #16
	
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
	LD4	{V4.S, V5.S, V6.S, V7.S}[4], [\reg]
	ADD	\reg, \reg, #16
	LD4	{V8.S, V9.S, V10.S, V11.S}[5], [\reg]
	SUB	\reg, \reg, #176
.endm


.macro load4_12 reg
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



.macro roll_mix A, B, C, D, dest, work1, work2
	AND	\work1\().16B,	\A\().16B, V25.16B
	AND	\work2\().16B,	\B\().16B, V26.16B
	AND	V30.16B,	\C\().16B, V25.16B
	AND	V31.16B,	\D\().16B, V26.16B
	EOR	\work1\().16B,	\work1\().16B, \work2\().16B
	EOR	V30.16B,	V30.16B, V31.16B
	MOV	\work1\().D[1],	V30.D[0]
	
	EOR	\dest\().16B, \dest\().16B, \work1\().16B
.endm

.macro first_roll_Xc reg
	MOVI	V25.16B, #0xAA //maybe swap?
	MOVI	V26.16B, #0x55
	
	XAR	V30.2D, V12.2D, V24.2D, #38 //for rollXe, this can be done with only one reg instead of 2, and use XOR in XAR
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
	
	
	XAR	V30.2D, V16.2D, V24.2D, #38 
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
	
	
	XAR	V30.2D, V20.2D, V24.2D, #38 
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
	SUB	\reg, \reg, #176 //remove?
.endm

.macro load1by1 reg
	LD1	{V12.2D}, [\reg]
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
	SUB	\reg, \reg, #176
	
	/*LD1	{V12.4S, V13.4S, V14.4S, V15.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V16.4S, V17.4S, V18.4S, V19.4S}, [\reg]
	ADD	\reg\(), \reg\(), #64
	LD1	{V20.4S, V21.4S, V22.4S, V23.4S}, [\reg]
	SUB	\reg\(), \reg\(), #128*/
	
.endm

.macro roll_Xc_second
	XAR	V25.2D, V16.2D, V24.2D, #38 
	XAR	V26.2D, V20.2D, V24.2D, #58
	
	XAR	V27.2D, V20.2D, V24.2D, #38 
	XAR	V28.2D, V13.2D, V24.2D, #58
	
	XAR	V29.2D, V12.2D, V24.2D, #38 
	XAR	V30.2D, V16.2D, V24.2D, #58
	
	EOR3	V16.16B, V16.16B, V25.16B, V26.16B
	
	XAR	V25.2D, V13.2D, V24.2D, #38 
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

.macro store1by1
	/*ST1	{V17.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V18.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V19.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V16.2D}, [x1]
	ADD	x1, x1, #16
	
	ST1	{V21.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V22.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V23.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V20.2D}, [x1]
	ADD	x1, x1, #16
	
	ST1	{V14.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V15.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V12.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V13.2D}, [x1]*/
	
	ST1	{V17.2D, V18.2D, V19.2D}, [x1]
	ADD	x1, x1, #48
	ST1	{V16.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V21.2D, V22.2D, V23.2D}, [x1]
	ADD	x1, x1, #48
	ST1	{V20.2D}, [x1]
	ADD	x1, x1, #16
	ST1	{V14.2D, V15.2D}, [x1]
	ADD	x1, x1, #32
	ST1	{V12.2D, V13.2D}, [x1]
.endm


.global roll_Xc_first
.type roll_Xc_first,%function

roll_Xc_first:
	MOVI	V24.4S,  #0x00
	
	load1copy4 x1
	interleave
	store4 x2
	
	load4interleave x0
	interleave
	
	load4_12 x2
	first_roll_Xc x2
	
	Xoodoo
	
	RET

.global roll_Xc
.type roll_Xc,%function

roll_Xc:
	
	load4interleave x0
	interleave
	
	load1by1 x1
	roll_Xc_second
	store1by1 
	
	Xoodoo
	
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

.global store
.type store,%function

store:
	//move12to0

	deinterleave_store x0
	
	RET


.global roll_Xe
.type roll_Xe,%function

roll_Xe:
	MOV	X3, #0x3F
	MOV	V28.2D[0], X3
	MOV	V28.2D[1], X3
	XAR	V25.2D, V0.2D,  V24.2D, #54
	XAR	V26.2D, V4.2D,  V24.2D, #38
	AND	V27.16B, V4.16B, V8.16B
	EOR3	V25.16B, V25.16B, V26.16B, V27.16B
	EOR	V0.16B,  V25.16B, V28.16B
	
	RET




	