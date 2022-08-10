.text                   

.macro theta
    EOR     V12.16B, V3.16B, V7.16B  
    EOR     V13.16B, V0.16B, V4.16B
    EOR     V14.16B, V1.16B, V5.16B
    EOR     V15.16B, V2.16B, V6.16B  
      
    EOR     V12.16B, V12.16B, V11.16B   
    EOR     V13.16B, V13.16B, V8.16B
    EOR     V14.16B, V14.16B, V9.16B
    EOR     V15.16B, V15.16B, V10.16B 
    
    SRI     V16.2D, V12.2D, #54
    SRI     V17.2D, V13.2D, #54
    SRI     V18.2D, V14.2D, #54
    SRI     V19.2D, V15.2D, #54
    
    SRI     V20.2D, V12.2D, #36
    SRI     V21.2D, V13.2D, #36
    SRI     V22.2D, V14.2D, #36
    SRI     V23.2D, V15.2D, #36
    
    SLI     V16.2D, V12.2D, #10
    SLI     V17.2D, V13.2D, #10
    SLI     V18.2D, V14.2D, #10
    SLI     V19.2D, V15.2D, #10
    
    SLI     V20.2D, V12.2D, #28
    SLI     V21.2D, V13.2D, #28
    SLI     V22.2D, V14.2D, #28
    SLI     V23.2D, V15.2D, #28
    
    EOR     V20.16B, V20.16B, V16.16B
    EOR     V21.16B, V21.16B, V17.16B
    EOR     V22.16B, V22.16B, V18.16B
    EOR     V23.16B, V23.16B, V19.16B
    
    EOR     V0.16B,  V0.16B, V20.16B
    EOR     V1.16B,  V1.16B, V21.16B
    EOR     V2.16B,  V2.16B, V22.16B
    EOR     V3.16B,  V3.16B, V23.16B
    
    EOR     V4.16B,  V4.16B, V20.16B
    EOR     V5.16B,  V5.16B, V21.16B
    EOR     V6.16B,  V6.16B, V22.16B
    EOR     V7.16B,  V7.16B, V23.16B
    
    EOR     V12.16B, V8.16B,  V20.16B
    EOR     V13.16B, V9.16B,  V21.16B
    EOR     V14.16B, V10.16B, V22.16B
    EOR     V15.16B, V11.16B, V23.16B
.endm

.macro iota
    MOV     V25.2D[0], X3
    MOV     V25.2D[1], X3
    EOR     V0.16B, V0.16B, V25.16B
.endm

.macro rho_w_chi
    SRI     V8.2D,  V12.2D, #42
    SRI     V9.2D,  V13.2D, #42
    SRI     V10.2D, V14.2D, #42
    SRI     V11.2D, V15.2D, #42
    
    SLI     V8.2D,  V12.2D, #22
    SLI     V9.2D,  V13.2D, #22
    SLI     V10.2D, V14.2D, #22
    SLI     V11.2D, V15.2D, #22
    
    BIC     V24.16B, V7.16B, V0.16B
    BIC     V25.16B, V4.16B, V1.16B
    BIC     V26.16B, V5.16B, V2.16B
    BIC     V27.16B, V6.16B, V3.16B
    
    BIC     V16.16B, V8.16B,  V7.16B
    BIC     V17.16B, V9.16B,  V4.16B
    BIC     V18.16B, V10.16B, V5.16B
    BIC     V19.16B, V11.16B, V6.16B
    
    BIC     V20.16B, V0.16B, V8.16B
    BIC     V21.16B, V1.16B, V9.16B
    BIC     V22.16B, V2.16B, V10.16B
    BIC     V23.16B, V3.16B, V11.16B
    
    EOR     V0.16B, V16.16B, V0.16B
    EOR     V1.16B, V17.16B, V1.16B
    EOR     V2.16B, V18.16B, V2.16B
    EOR     V3.16B, V19.16B, V3.16B
    
    EOR     V20.16B, V20.16B, V7.16B
    EOR     V21.16B, V21.16B, V4.16B
    EOR     V22.16B, V22.16B, V5.16B
    EOR     V23.16B, V23.16B, V6.16B
    
    EOR     V24.16B, V24.16B, V8.16B
    EOR     V25.16B, V25.16B, V9.16B
    EOR     V26.16B, V26.16B, V10.16B
    EOR     V27.16B, V27.16B, V11.16B
    
    
.endm

.macro rho_e
    SRI     V4.2D, V20.2D, #62
    SRI     V5.2D, V21.2D, #62
    SRI     V6.2D, V22.2D, #62
    SRI     V7.2D, V23.2D, #62
    
    SRI     V10.2D, V24.2D, #48
    SRI     V11.2D, V25.2D, #48
    SRI     V8.2D,  V26.2D, #48
    SRI     V9.2D,  V27.2D, #48
    
    SLI     V4.2D, V20.2D, #2
    SLI     V5.2D, V21.2D, #2
    SLI     V6.2D, V22.2D, #2
    SLI     V7.2D, V23.2D, #2
    
    SLI     V10.2D, V24.2D, #16
    SLI     V11.2D, V25.2D, #16
    SLI     V8.2D,  V26.2D, #16
    SLI     V9.2D,  V27.2D, #16
.endm






.align  16
.global Xoodootimes4_Load4InterlaceNoSha
.type Xoodootimes4_Load4InterlaceNoSha,%function

Xoodootimes4_Load4InterlaceNoSha:
	
	# Load data to regs
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
    
	# Interleave on a byte level
    ZIP1    V0.16B,  V12.16B, V0.16B
    ZIP1    V1.16B,  V13.16B, V1.16B
    ZIP1    V2.16B,  V14.16B, V2.16B
    ZIP1    V3.16B,  V15.16B, V3.16B
    ZIP1    V4.16B,  V16.16B, V4.16B
    ZIP1    V5.16B,  V17.16B, V5.16B
    ZIP1    V6.16B,  V18.16B, V6.16B
    ZIP1    V7.16B,  V19.16B, V7.16B
    ZIP1    V8.16B,  V20.16B, V8.16B
    ZIP1    V9.16B,  V21.16B, V9.16B
    ZIP1    V10.16B, V22.16B, V10.16B
    ZIP1    V11.16B, V23.16B, V11.16B

  	# Swap 4 bits
    MOVI    V27.8H,  #0xF0,  LSL #8
    MOVI    V26.8H,  #0xF0
    MOVI    V28.8H,  #0x0F
    ORR     V27.16B, V27.16B, V28.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #4
    SRI     V19.2D, V1.2D,  #4
    SRI     V20.2D, V2.2D,  #4
    SRI     V21.2D, V3.2D,  #4
    SRI     V22.2D, V4.2D,  #4
    SRI     V23.2D, V5.2D,  #4
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #4
    SLI     V13.2D, V13.2D, #4
    SLI     V14.2D, V14.2D, #4
    SLI     V15.2D, V15.2D, #4
    SLI     V16.2D, V16.2D, #4
    SLI     V17.2D, V17.2D, #4
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #4
    SRI     V19.2D, V7.2D,  #4
    SRI     V20.2D, V8.2D,  #4
    SRI     V21.2D, V9.2D,  #4
    SRI     V22.2D, V10.2D, #4
    SRI     V23.2D, V11.2D, #4
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #4
    SLI     V13.2D, V13.2D, #4
    SLI     V14.2D, V14.2D, #4
    SLI     V15.2D, V15.2D, #4
    SLI     V16.2D, V16.2D, #4
    SLI     V17.2D, V17.2D, #4
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B
        
  	# Swap 2 bits
    MOVI    V26.8H,  #0x0C
    MOVI    V27.8H,  #0xC3
    MOVI    V28.8H,  #0x0C, LSL #8
    MOVI    V29.8H,  #0xC3, LSL #8
    ORR     V26.16B, V26.16B, V28.16B
    ORR     V27.16B, V27.16B, V29.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #2
    SRI     V19.2D, V1.2D,  #2
    SRI     V20.2D, V2.2D,  #2
    SRI     V21.2D, V3.2D,  #2
    SRI     V22.2D, V4.2D,  #2
    SRI     V23.2D, V5.2D,  #2
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #2
    SLI     V13.2D, V13.2D, #2
    SLI     V14.2D, V14.2D, #2
    SLI     V15.2D, V15.2D, #2
    SLI     V16.2D, V16.2D, #2
    SLI     V17.2D, V17.2D, #2
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #2
    SRI     V19.2D, V7.2D,  #2
    SRI     V20.2D, V8.2D,  #2
    SRI     V21.2D, V9.2D,  #2
    SRI     V22.2D, V10.2D, #2
    SRI     V23.2D, V11.2D, #2
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #2
    SLI     V13.2D, V13.2D, #2
    SLI     V14.2D, V14.2D, #2
    SLI     V15.2D, V15.2D, #2
    SLI     V16.2D, V16.2D, #2
    SLI     V17.2D, V17.2D, #2
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B
    
  	# Swap 1 bit
    MOVI    V26.8H,  #0x22
    MOVI    V27.8H,  #0x99
    MOVI    V28.8H,  #0x22, LSL #8
    MOVI    V29.8H,  #0x99, LSL #8
    ORR     V26.16B, V26.16B, V28.16B
    ORR     V27.16B, V27.16B, V29.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #1
    SRI     V19.2D, V1.2D,  #1
    SRI     V20.2D, V2.2D,  #1
    SRI     V21.2D, V3.2D,  #1
    SRI     V22.2D, V4.2D,  #1
    SRI     V23.2D, V5.2D,  #1
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #1
    SLI     V13.2D, V13.2D, #1
    SLI     V14.2D, V14.2D, #1
    SLI     V15.2D, V15.2D, #1
    SLI     V16.2D, V16.2D, #1
    SLI     V17.2D, V17.2D, #1
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #1
    SRI     V19.2D, V7.2D,  #1
    SRI     V20.2D, V8.2D,  #1
    SRI     V21.2D, V9.2D,  #1
    SRI     V22.2D, V10.2D, #1
    SRI     V23.2D, V11.2D, #1
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #1
    SLI     V13.2D, V13.2D, #1
    SLI     V14.2D, V14.2D, #1
    SLI     V15.2D, V15.2D, #1
    SLI     V16.2D, V16.2D, #1
    SLI     V17.2D, V17.2D, #1
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B
    
    RET
    




    
    
.global Xoodootimes4_SixRoundsNoSha
.type Xoodootimes4_SixRoundsNoSha,%function

Xoodootimes4_SixRoundsNoSha:
    
    theta 
    MOV     X3, #0x3C00
    iota
    rho_w_chi
    rho_e
    
    theta
    MOV     X3, #0x0CF0
    iota
    rho_w_chi
    rho_e
    
    theta
    MOV     X3, #0xFC000
    iota
    rho_w_chi
    rho_e
    
    theta
    MOV     X3, #0xFF00
    iota
    rho_w_chi
    rho_e
    
    theta
    MOV     X3, #0xCC00
    MOVK    X3, #0x0003, LSL #16
    iota
    rho_w_chi
    rho_e
    
    theta
    MOV     X3, #0x030C
    iota
    rho_w_chi
    rho_e
    
    RET








    
.global Xoodootimes4_Store4DeinterlaceNoSha
.type Xoodootimes4_Store4DeinterlaceNoSha,%function

Xoodootimes4_Store4DeinterlaceNoSha:
    
    
    
    # Swap 1 bit
    MOVI    V26.8H,  #0x22
    MOVI    V27.8H,  #0x99
    MOVI    V28.8H,  #0x22, LSL #8
    MOVI    V29.8H,  #0x99, LSL #8
    ORR     V26.16B, V26.16B, V28.16B
    ORR     V27.16B, V27.16B, V29.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #1
    SRI     V19.2D, V1.2D,  #1
    SRI     V20.2D, V2.2D,  #1
    SRI     V21.2D, V3.2D,  #1
    SRI     V22.2D, V4.2D,  #1
    SRI     V23.2D, V5.2D,  #1
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #1
    SLI     V13.2D, V13.2D, #1
    SLI     V14.2D, V14.2D, #1
    SLI     V15.2D, V15.2D, #1
    SLI     V16.2D, V16.2D, #1
    SLI     V17.2D, V17.2D, #1
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #1
    SRI     V19.2D, V7.2D,  #1
    SRI     V20.2D, V8.2D,  #1
    SRI     V21.2D, V9.2D,  #1
    SRI     V22.2D, V10.2D, #1
    SRI     V23.2D, V11.2D, #1
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #1
    SLI     V13.2D, V13.2D, #1
    SLI     V14.2D, V14.2D, #1
    SLI     V15.2D, V15.2D, #1
    SLI     V16.2D, V16.2D, #1
    SLI     V17.2D, V17.2D, #1
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B
    
  	# Swap 2 bits
    MOVI    V26.8H,  #0x0C
    MOVI    V27.8H,  #0xC3
    MOVI    V28.8H,  #0x0C, LSL #8
    MOVI    V29.8H,  #0xC3, LSL #8
    ORR     V26.16B, V26.16B, V28.16B
    ORR     V27.16B, V27.16B, V29.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #2
    SRI     V19.2D, V1.2D,  #2
    SRI     V20.2D, V2.2D,  #2
    SRI     V21.2D, V3.2D,  #2
    SRI     V22.2D, V4.2D,  #2
    SRI     V23.2D, V5.2D,  #2
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #2
    SLI     V13.2D, V13.2D, #2
    SLI     V14.2D, V14.2D, #2
    SLI     V15.2D, V15.2D, #2
    SLI     V16.2D, V16.2D, #2
    SLI     V17.2D, V17.2D, #2
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #2
    SRI     V19.2D, V7.2D,  #2
    SRI     V20.2D, V8.2D,  #2
    SRI     V21.2D, V9.2D,  #2
    SRI     V22.2D, V10.2D, #2
    SRI     V23.2D, V11.2D, #2
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #2
    SLI     V13.2D, V13.2D, #2
    SLI     V14.2D, V14.2D, #2
    SLI     V15.2D, V15.2D, #2
    SLI     V16.2D, V16.2D, #2
    SLI     V17.2D, V17.2D, #2
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B
    
  	# Swap 4 bits
    MOVI    V27.8H,  #0xF0,  LSL #8
    MOVI    V26.8H,  #0xF0
    MOVI    V28.8H,  #0x0F
    ORR     V27.16B, V27.16B, V28.16B
    
    AND     V12.16B, V0.16B, V26.16B
    AND     V13.16B, V1.16B, V26.16B
    AND     V14.16B, V2.16B, V26.16B
    AND     V15.16B, V3.16B, V26.16B
    AND     V16.16B, V4.16B, V26.16B
    AND     V17.16B, V5.16B, V26.16B
    SRI     V18.2D, V0.2D,  #4
    SRI     V19.2D, V1.2D,  #4
    SRI     V20.2D, V2.2D,  #4
    SRI     V21.2D, V3.2D,  #4
    SRI     V22.2D, V4.2D,  #4
    SRI     V23.2D, V5.2D,  #4
    AND     V0.16B, V0.16B, V27.16B
    AND     V1.16B, V1.16B, V27.16B
    AND     V2.16B, V2.16B, V27.16B
    AND     V3.16B, V3.16B, V27.16B
    AND     V4.16B, V4.16B, V27.16B
    AND     V5.16B, V5.16B, V27.16B
    SLI     V12.2D, V12.2D, #4
    SLI     V13.2D, V13.2D, #4
    SLI     V14.2D, V14.2D, #4
    SLI     V15.2D, V15.2D, #4
    SLI     V16.2D, V16.2D, #4
    SLI     V17.2D, V17.2D, #4
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V0.16B, V0.16B, V12.16B
    EOR     V1.16B, V1.16B, V13.16B
    EOR     V2.16B, V2.16B, V14.16B
    EOR     V3.16B, V3.16B, V15.16B
    EOR     V4.16B, V4.16B, V16.16B
    EOR     V5.16B, V5.16B, V17.16B    
    EOR     V0.16B, V0.16B, V18.16B
    EOR     V1.16B, V1.16B, V19.16B
    EOR     V2.16B, V2.16B, V20.16B
    EOR     V3.16B, V3.16B, V21.16B
    EOR     V4.16B, V4.16B, V22.16B
    EOR     V5.16B, V5.16B, V23.16B
    
    AND     V12.16B, V6.16B,  V26.16B
    AND     V13.16B, V7.16B,  V26.16B
    AND     V14.16B, V8.16B,  V26.16B
    AND     V15.16B, V9.16B,  V26.16B
    AND     V16.16B, V10.16B, V26.16B
    AND     V17.16B, V11.16B, V26.16B
    SRI     V18.2D, V6.2D,  #4
    SRI     V19.2D, V7.2D,  #4
    SRI     V20.2D, V8.2D,  #4
    SRI     V21.2D, V9.2D,  #4
    SRI     V22.2D, V10.2D, #4
    SRI     V23.2D, V11.2D, #4
    AND     V6.16B,  V6.16B,  V27.16B
    AND     V7.16B,  V7.16B,  V27.16B
    AND     V8.16B,  V8.16B,  V27.16B
    AND     V9.16B,  V9.16B,  V27.16B
    AND     V10.16B, V10.16B, V27.16B
    AND     V11.16B, V11.16B, V27.16B
    SLI     V12.2D, V12.2D, #4
    SLI     V13.2D, V13.2D, #4
    SLI     V14.2D, V14.2D, #4
    SLI     V15.2D, V15.2D, #4
    SLI     V16.2D, V16.2D, #4
    SLI     V17.2D, V17.2D, #4
    AND     V18.16B, V18.16B, V26.16B
    AND     V19.16B, V19.16B, V26.16B
    AND     V20.16B, V20.16B, V26.16B
    AND     V21.16B, V21.16B, V26.16B
    AND     V22.16B, V22.16B, V26.16B
    AND     V23.16B, V23.16B, V26.16B
    EOR     V6.16B,  V6.16B,  V12.16B
    EOR     V7.16B,  V7.16B,  V13.16B
    EOR     V8.16B,  V8.16B,  V14.16B
    EOR     V9.16B,  V9.16B,  V15.16B
    EOR     V10.16B, V10.16B, V16.16B
    EOR     V11.16B, V11.16B, V17.16B
    EOR     V6.16B,  V6.16B,  V18.16B
    EOR     V7.16B,  V7.16B,  V19.16B
    EOR     V8.16B,  V8.16B,  V20.16B
    EOR     V9.16B,  V9.16B,  V21.16B
    EOR     V10.16B, V10.16B, V22.16B
    EOR     V11.16B, V11.16B, V23.16B

	# De-interleave on a byte level
    UZP2    V12.16B, V0.16B, V4.16B
    UZP2    V13.16B, V1.16B, V5.16B
    UZP2    V14.16B, V2.16B, V6.16B
    UZP2    V15.16B, V3.16B, V7.16B
    UZP2    V16.16B, V8.16B, V0.16B
    UZP2    V17.16B, V9.16B, V0.16B
    UZP2    V18.16B, V10.16B, V0.16B
    UZP2    V19.16B, V11.16B, V0.16B
    UZP1    V20.16B,  V0.16B, V4.16B
    UZP1    V21.16B,  V1.16B, V5.16B
    UZP1    V22.16B, V2.16B, V6.16B
    UZP1    V23.16B, V3.16B, V7.16B
    UZP1    V28.16B, V8.16B, V0.16B
    UZP1    V29.16B, V9.16B, V0.16B
    UZP1    V30.16B, V10.16B, V0.16B
    UZP1    V31.16B, V11.16B, V0.16B
    
	# Final Store
    ST4     {V12.S, V13.S, V14.S, V15.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V12.S, V13.S, V14.S, V15.S}[2], [x0]
    ADD     x0, x0, #16
    ST4     {V16.S, V17.S, V18.S, V19.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V20.S, V21.S, V22.S, V23.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V20.S, V21.S, V22.S, V23.S}[2], [x0]
    ADD     x0, x0, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[0], [x0]
    ADD     x0, x0, #16
    ST4     {V12.S, V13.S, V14.S, V15.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V12.S, V13.S, V14.S, V15.S}[3], [x0]
    ADD     x0, x0, #16
    ST4     {V16.S, V17.S, V18.S, V19.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V20.S, V21.S, V22.S, V23.S}[1], [x0]
    ADD     x0, x0, #16
    ST4     {V20.S, V21.S, V22.S, V23.S}[3], [x0]
    ADD     x0, x0, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[1], [x0]
    ADD     x0, x0, #16
    
    RET
    


    


    
