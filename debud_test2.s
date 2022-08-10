
#include test2.h

.text                   

.align  16
.global Xoodootimes4_Initialize
.type Xoodootimes4_Initialize,%function

Xoodootimes4_Initialize:
	
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

    MOVI    V24.4S,  #0x00
    
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
    XAR     V0.2D,  V0.2D,  V24.2D, #32
    XAR     V1.2D,  V1.2D,  V24.2D, #32
    XAR     V2.2D,  V2.2D,  V24.2D, #32
    XAR     V3.2D,  V3.2D,  V24.2D, #32
    XAR     V4.2D,  V4.2D,  V24.2D, #32
    XAR     V5.2D,  V5.2D,  V24.2D, #32
    XAR     V6.2D,  V6.2D,  V24.2D, #32
    XAR     V7.2D,  V7.2D,  V24.2D, #32
    XAR     V8.2D,  V8.2D,  V24.2D, #32
    XAR     V9.2D,  V9.2D,  V24.2D, #32
    XAR     V10.2D, V10.2D, V24.2D, #32
    XAR     V11.2D, V11.2D, V24.2D, #32

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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B
        
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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B
    
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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B
    
	# TEMP: store Values
    ST1     {V0.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V1.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V2.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V3.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V4.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V5.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V6.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V7.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V8.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V9.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V10.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    
    RET
    




    
    
.global Xoodootimes4_Theta
.type Xoodootimes4_Theta,%function

Xoodootimes4_Theta:

	# Load data to regs
    LD4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[3], [x0]


	# Actual Theta
    MOVI    V24.4S,  #0x00
    EOR3    V12.16B, V3.16B, V7.16B, V11.16B   
    EOR3    V13.16B, V0.16B, V4.16B, V8.16B
    EOR3    V14.16B, V1.16B, V5.16B, V9.16B
    EOR3    V15.16B, V2.16B, V6.16B, V10.16B   
    XAR     V16.2D,  V12.2D, V24.2D, #54
    XAR     V17.2D,  V13.2D, V24.2D, #54
    XAR     V18.2D,  V14.2D, V24.2D, #54
    XAR     V19.2D,  V15.2D, V24.2D, #54  
    XAR     V20.2D,  V12.2D, V24.2D, #36  
    XAR     V21.2D,  V13.2D, V24.2D, #36  
    XAR     V22.2D,  V14.2D, V24.2D, #36  
    XAR     V23.2D,  V15.2D, V24.2D, #36
    EOR3    V0.16B,  V0.16B, V20.16B, V16.16B
    EOR3    V1.16B,  V1.16B, V21.16B, V17.16B
    EOR3    V2.16B,  V2.16B, V22.16B, V18.16B
    EOR3    V3.16B,  V3.16B, V23.16B, V19.16B
    EOR3    V4.16B,  V4.16B, V20.16B, V16.16B
    EOR3    V5.16B,  V5.16B, V21.16B, V17.16B
    EOR3    V6.16B,  V6.16B, V22.16B, V18.16B
    EOR3    V7.16B,  V7.16B, V23.16B, V19.16B
    EOR3    V8.16B,  V8.16B, V20.16B, V16.16B
    EOR3    V9.16B,  V9.16B, V21.16B, V17.16B
    EOR3    V10.16B, V10.16B, V22.16B, V18.16B
    EOR3    V11.16B, V11.16B, V23.16B, V19.16B

	# TEMP: store Values
    ST1     {V0.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V1.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V2.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V3.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V4.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V5.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V6.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V7.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V8.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V9.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V10.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    
    RET


    
    
    
    
    


    
.global Xoodootimes4_Rho_east_west_Iota_Khi
.type Xoodootimes4_Rho_east_west_Iota_Khi,%function

Xoodootimes4_Rho_east_west_Iota_Khi:

	# Load data to regs
    LD4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[3], [x0]

	# Iota load
    LD1R    {V25.8H}, [x2]
    MOVI    V24.4S,  #0x00
    
	# Rho_west (second part)
    XAR     V8.2D,  V8.2D, V13.2D, #42
    XAR     V9.2D,  V9.2D, V13.2D, #42
    XAR     V10.2D, V10.2D, V13.2D, #42
    XAR     V11.2D, V11.2D, V13.2D, #42
    
	# Iota
    EOR     V16.16B, V0.16B, V25.16B
    EOR     V17.16B, V1.16B, V25.16B
    EOR     V18.16B, V2.16B, V25.16B
    EOR     V19.16B, V3.16B, V25.16B
    
	# Khi + first part Rho west
    BCAX    V0.16B, V16.16B, V11.16B, V4.16B
    BCAX    V1.16B, V17.16B, V8.16B,  V5.16B
    BCAX    V2.16B, V18.16B, V9.16B,  V6.16B
    BCAX    V3.16B, V19.16B, V10.16B, V7.16B
    BCAX    V20.16B, V4.16B, V16.16B, V11.16B
    BCAX    V21.16B, V5.16B, V17.16B, V8.16B
    BCAX    V22.16B, V6.16B, V18.16B, V9.16B
    BCAX    V23.16B, V7.16B, V19.16B, V10.16B
    BCAX    V28.16B, V11.16B, V4.16B, V16.16B
    BCAX    V29.16B, V8.16B,  V5.16B, V17.16B
    BCAX    V30.16B, V9.16B,  V6.16B, V18.16B
    BCAX    V31.16B, V10.16B, V7.16B, V19.16B
    
	# Rho east
    XAR     V4.2D, V20.2D, V13.2D, #62
    XAR     V5.2D, V21.2D, V13.2D, #62
    XAR     V6.2D, V22.2D, V13.2D, #62
    XAR     V7.2D, V23.2D, V13.2D, #62
    XAR     V10.2D, V28.2D, V13.2D, #48
    XAR     V11.2D, V29.2D, V13.2D, #48
    XAR     V8.2D,  V30.2D, V13.2D, #48
    XAR     V9.2D,  V31.2D, V13.2D, #48
    
    
	# TEMP: store Values
    ST1     {V0.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V1.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V2.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V3.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V4.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V5.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V6.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V7.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V8.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V9.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V10.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V11.2D}, [x1]
    
    RET
    
    








    
.global Xoodootimes4_Finalize
.type Xoodootimes4_Finalize,%function

Xoodootimes4_Finalize:

	# Load data to regs
    LD4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V8.S, V9.S, V10.S, V11.S}[3], [x0]
    
    MOVI    V24.4S,  #0x00
    
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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B
    
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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B
    
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
    EOR3    V0.16B, V0.16B, V12.16B, V18.16B
    EOR3    V1.16B, V1.16B, V13.16B, V19.16B
    EOR3    V2.16B, V2.16B, V14.16B, V20.16B
    EOR3    V3.16B, V3.16B, V15.16B, V21.16B
    EOR3    V4.16B, V4.16B, V16.16B, V22.16B
    EOR3    V5.16B, V5.16B, V17.16B, V23.16B
    
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
    EOR3    V6.16B,  V6.16B,  V12.16B, V18.16B
    EOR3    V7.16B,  V7.16B,  V13.16B, V19.16B
    EOR3    V8.16B,  V8.16B,  V14.16B, V20.16B
    EOR3    V9.16B,  V9.16B,  V15.16B, V21.16B
    EOR3    V10.16B, V10.16B, V16.16B, V22.16B
    EOR3    V11.16B, V11.16B, V17.16B, V23.16B

	# De-interleave on a byte level
    XAR     V12.2D, V0.2D,  V24.2D, #32
    XAR     V13.2D, V1.2D,  V24.2D, #32
    XAR     V14.2D, V2.2D,  V24.2D, #32
    XAR     V15.2D, V3.2D,  V24.2D, #32
    XAR     V16.2D, V4.2D,  V24.2D, #32
    XAR     V17.2D, V5.2D,  V24.2D, #32
    XAR     V18.2D, V6.2D,  V24.2D, #32
    XAR     V19.2D, V7.2D,  V24.2D, #32
    XAR     V20.2D, V8.2D,  V24.2D, #32
    XAR     V21.2D, V9.2D,  V24.2D, #32
    XAR     V22.2D, V10.2D, V24.2D, #32
    XAR     V23.2D, V11.2D, V24.2D, #32
    UZP2    V0.16B, V12.16B, V16.16B
    UZP2    V1.16B, V13.16B, V17.16B
    UZP2    V2.16B, V14.16B, V18.16B
    UZP2    V3.16B, V15.16B, V19.16B
    UZP2    V4.16B, V20.16B, V12.16B
    UZP2    V5.16B, V21.16B, V12.16B
    UZP2    V6.16B, V22.16B, V12.16B
    UZP2    V7.16B, V23.16B, V12.16B
    UZP1    V8.16B,  V12.16B, V16.16B
    UZP1    V9.16B,  V13.16B, V17.16B
    UZP1    V10.16B, V14.16B, V18.16B
    UZP1    V11.16B, V15.16B, V19.16B
    UZP1    V28.16B, V20.16B, V12.16B
    UZP1    V29.16B, V21.16B, V12.16B
    UZP1    V30.16B, V22.16B, V12.16B
    UZP1    V31.16B, V23.16B, V12.16B
    
	# Final Store
    ST4     {V0.S, V1.S, V2.S, V3.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[2], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[2], [x1]
    ADD     x1, x1, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[3], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[3], [x1]
    ADD     x1, x1, #16
    ST4     {V28.S, V29.S, V30.S, V31.S}[1], [x1]
    ADD     x1, x1, #16
    
    RET
    


    
