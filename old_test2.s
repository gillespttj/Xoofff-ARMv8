
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
    ZIP1    V10.16B,  V22.16B, V10.16B
    ZIP1    V11.16B,  V23.16B, V11.16B
    SRI     V12.2D, V0.2D, #32
    SRI     V13.2D, V1.2D, #32
    SRI     V14.2D, V2.2D, #32
    SRI     V15.2D, V3.2D, #32
    SRI     V16.2D, V4.2D, #32
    SRI     V17.2D, V5.2D, #32
    SRI     V18.2D, V6.2D, #32
    SRI     V19.2D, V7.2D, #32
    SRI     V20.2D, V8.2D, #32
    SRI     V21.2D, V9.2D, #32
    SRI     V22.2D, V10.2D, #32
    SRI     V23.2D, V11.2D, #32
    SLI     V12.2D, V0.2D, #32
    SLI     V13.2D, V1.2D, #32
    SLI     V14.2D, V2.2D, #32
    SLI     V15.2D, V3.2D, #32
    SLI     V16.2D, V4.2D, #32
    SLI     V17.2D, V5.2D, #32
    SLI     V18.2D, V6.2D, #32
    SLI     V19.2D, V7.2D, #32
    SLI     V20.2D, V8.2D, #32
    SLI     V21.2D, V9.2D, #32
    SLI     V22.2D, V10.2D, #32
    SLI     V23.2D, V11.2D, #32
    
    	# Swap 4 bits
    MOVI    V25.8H,  #0xF0,  LSL #8
    MOVI    V24.8H,  #0xF0
    MOVI    V26.8H,  #0x0F
    ORR     V25.16B, V25.16B, V26.16B
    
    AND     V0.16B, V12.16B, V24.16B
    AND     V1.16B, V13.16B, V24.16B
    AND     V2.16B, V14.16B, V24.16B
    AND     V3.16B, V15.16B, V24.16B
    SRI     V8.2D,   V12.2D,  #4
    SRI     V9.2D,   V13.2D,  #4
    SRI     V10.2D,  V14.2D,  #4
    SRI     V11.2D,  V15.2D,  #4
    AND     V28.16B, V12.16B, V25.16B
    AND     V29.16B, V13.16B, V25.16B
    AND     V30.16B, V14.16B, V25.16B
    AND     V31.16B, V15.16B, V25.16B
    SLI     V0.2D,  V0.2D, #4
    SLI     V1.2D,  V1.2D, #4
    SLI     V2.2D,  V2.2D, #4
    SLI     V3.2D,  V3.2D, #4
    AND     V8.16B,  V8.16B,  V24.16B
    AND     V9.16B,  V9.16B,  V24.16B
    AND     V10.16B, V10.16B, V24.16B
    AND     V11.16B, V11.16B, V24.16B
    EOR3    V0.16B, V0.16B, V8.16B,  V28.16B
    EOR3    V1.16B, V1.16B, V9.16B,  V29.16B
    EOR3    V2.16B, V2.16B, V10.16B, V30.16B
    EOR3    V3.16B, V3.16B, V11.16B, V31.16B
    
    AND     V4.16B, V16.16B, V24.16B
    AND     V5.16B, V17.16B, V24.16B
    AND     V6.16B, V18.16B, V24.16B
    AND     V7.16B, V19.16B, V24.16B
    SRI     V8.2D,   V16.2D,  #4
    SRI     V9.2D,   V17.2D,  #4
    SRI     V10.2D,  V18.2D,  #4
    SRI     V11.2D,  V19.2D,  #4
    AND     V28.16B, V16.16B, V25.16B
    AND     V29.16B, V17.16B, V25.16B
    AND     V30.16B, V18.16B, V25.16B
    AND     V31.16B, V19.16B, V25.16B
    SLI     V4.2D,  V4.2D, #4
    SLI     V5.2D,  V5.2D, #4
    SLI     V6.2D,  V6.2D, #4
    SLI     V7.2D,  V7.2D, #4
    AND     V8.16B,  V8.16B,  V24.16B
    AND     V9.16B,  V9.16B,  V24.16B
    AND     V10.16B, V10.16B, V24.16B
    AND     V11.16B, V11.16B, V24.16B
    EOR3    V4.16B, V4.16B, V8.16B,  V28.16B
    EOR3    V5.16B, V5.16B, V9.16B,  V29.16B
    EOR3    V6.16B, V6.16B, V10.16B, V30.16B
    EOR3    V7.16B, V7.16B, V11.16B, V31.16B
    
    SRI     V28.2D,  V20.2D,  #4
    SRI     V29.2D,  V21.2D,  #4
    SRI     V30.2D,  V22.2D,  #4
    SRI     V31.2D,  V23.2D,  #4
    AND     V8.16B,  V20.16B, V24.16B
    AND     V9.16B,  V21.16B, V24.16B
    AND     V10.16B, V22.16B, V24.16B
    AND     V11.16B, V23.16B, V24.16B
    AND     V28.16B, V28.16B, V24.16B
    AND     V29.16B, V29.16B, V24.16B
    AND     V30.16B, V30.16B, V24.16B
    AND     V31.16B, V31.16B, V24.16B
    AND     V24.16B, V20.16B, V25.16B
    AND     V26.16B, V22.16B, V25.16B
    AND     V27.16B, V23.16B, V25.16B
    AND     V25.16B, V21.16B, V25.16B
    SLI     V8.2D,  V8.2D, #4
    SLI     V9.2D,  V9.2D, #4
    SLI     V10.2D, V10.2D, #4
    SLI     V11.2D, V11.2D, #4
    EOR3    V8.16B,  V8.16B,  V24.16B, V28.16B
    EOR3    V10.16B, V10.16B, V26.16B, V30.16B
    EOR3    V11.16B, V11.16B, V27.16B, V31.16B
    EOR3    V9.16B,  V9.16B,  V25.16B, V29.16B
    
	# Swap 2 bits
    MOVI    V24.8H,  #0x0C
    MOVI    V25.8H,  #0xC3
    MOVI    V26.8H,  #0x0C, LSL #8
    MOVI    V27.8H,  #0xC3, LSL #8
    ORR     V24.16B, V24.16B, V26.16B
    ORR     V25.16B, V25.16B, V27.16B
    
    AND     V12.16B, V0.16B, V24.16B
    AND     V13.16B, V1.16B, V24.16B
    AND     V14.16B, V2.16B, V24.16B
    AND     V15.16B, V3.16B, V24.16B
    SRI     V20.2D,   V0.2D,  #2
    SRI     V21.2D,   V1.2D,  #2
    SRI     V22.2D,  V2.2D,  #2
    SRI     V23.2D,  V3.2D,  #2
    AND     V28.16B, V0.16B, V25.16B
    AND     V29.16B, V1.16B, V25.16B
    AND     V30.16B, V2.16B, V25.16B
    AND     V31.16B, V3.16B, V25.16B
    SLI     V12.2D,  V12.2D, #2
    SLI     V13.2D,  V13.2D, #2
    SLI     V14.2D,  V14.2D, #2
    SLI     V15.2D,  V15.2D, #2
    AND     V20.16B,  V20.16B,  V24.16B
    AND     V21.16B,  V21.16B,  V24.16B
    AND     V22.16B, V22.16B, V24.16B
    AND     V23.16B, V23.16B, V24.16B
    EOR3    V12.16B, V12.16B, V20.16B,  V28.16B
    EOR3    V13.16B, V13.16B, V21.16B,  V29.16B
    EOR3    V14.16B, V14.16B, V22.16B, V30.16B
    EOR3    V15.16B, V15.16B, V23.16B, V31.16B
    
    AND     V16.16B, V4.16B, V24.16B
    AND     V17.16B, V5.16B, V24.16B
    AND     V18.16B, V6.16B, V24.16B
    AND     V19.16B, V7.16B, V24.16B
    SRI     V20.2D, V4.2D,  #2
    SRI     V21.2D, V5.2D,  #2
    SRI     V22.2D, V6.2D,  #2
    SRI     V23.2D, V7.2D,  #2
    AND     V28.16B, V4.16B, V25.16B
    AND     V29.16B, V5.16B, V25.16B
    AND     V30.16B, V6.16B, V25.16B
    AND     V31.16B, V7.16B, V25.16B
    SLI     V16.2D,  V16.2D, #2
    SLI     V17.2D,  V17.2D, #2
    SLI     V18.2D,  V18.2D, #2
    SLI     V19.2D,  V19.2D, #2
    AND     V20.16B, V20.16B,  V24.16B
    AND     V21.16B, V21.16B,  V24.16B
    AND     V22.16B, V22.16B, V24.16B
    AND     V23.16B, V23.16B, V24.16B
    EOR3    V16.16B, V16.16B, V20.16B,  V28.16B
    EOR3    V17.16B, V17.16B, V21.16B,  V29.16B
    EOR3    V18.16B, V18.16B, V22.16B, V30.16B
    EOR3    V19.16B, V19.16B, V23.16B, V31.16B
    
    SRI     V28.2D, V8.2D,  #2
    SRI     V29.2D, V9.2D,  #2
    SRI     V30.2D, V10.2D,  #2
    SRI     V31.2D, V11.2D,  #2
    AND     V20.16B, V8.16B, V24.16B
    AND     V21.16B, V9.16B, V24.16B
    AND     V22.16B, V10.16B, V24.16B
    AND     V23.16B, V11.16B, V24.16B
    AND     V28.16B, V28.16B, V24.16B
    AND     V29.16B, V29.16B, V24.16B
    AND     V30.16B, V30.16B, V24.16B
    AND     V31.16B, V31.16B, V24.16B
    AND     V24.16B, V8.16B,  V25.16B
    AND     V26.16B, V10.16B, V25.16B
    AND     V27.16B, V11.16B, V25.16B
    AND     V25.16B, V9.16B,  V25.16B
    SLI     V20.2D, V20.2D, #2
    SLI     V21.2D, V21.2D, #2
    SLI     V22.2D, V22.2D, #2
    SLI     V23.2D, V23.2D, #2
    EOR3    V20.16B, V20.16B, V24.16B, V28.16B
    EOR3    V22.16B, V22.16B, V26.16B, V30.16B
    EOR3    V23.16B, V23.16B, V27.16B, V31.16B
    EOR3    V21.16B, V21.16B, V25.16B, V29.16B
    
	# Swap 1 bit
    MOVI    V24.8H,  #0x22
    MOVI    V25.8H,  #0x99
    MOVI    V26.8H,  #0x22, LSL #8
    MOVI    V27.8H,  #0x99, LSL #8
    ORR     V24.16B, V24.16B, V26.16B
    ORR     V25.16B, V25.16B, V27.16B
    
    AND     V0.16B, V12.16B, V24.16B
    AND     V1.16B, V13.16B, V24.16B
    AND     V2.16B, V14.16B, V24.16B
    AND     V3.16B, V15.16B, V24.16B
    SRI     V8.2D,   V12.2D,  #1
    SRI     V9.2D,   V13.2D,  #1
    SRI     V10.2D,  V14.2D,  #1
    SRI     V11.2D,  V15.2D,  #1
    AND     V28.16B, V12.16B, V25.16B
    AND     V29.16B, V13.16B, V25.16B
    AND     V30.16B, V14.16B, V25.16B
    AND     V31.16B, V15.16B, V25.16B
    SLI     V0.2D,  V0.2D, #1
    SLI     V1.2D,  V1.2D, #1
    SLI     V2.2D,  V2.2D, #1
    SLI     V3.2D,  V3.2D, #1
    AND     V8.16B,  V8.16B,  V24.16B
    AND     V9.16B,  V9.16B,  V24.16B
    AND     V10.16B, V10.16B, V24.16B
    AND     V11.16B, V11.16B, V24.16B
    EOR3    V0.16B, V0.16B, V8.16B,  V28.16B
    EOR3    V1.16B, V1.16B, V9.16B,  V29.16B
    EOR3    V2.16B, V2.16B, V10.16B, V30.16B
    EOR3    V3.16B, V3.16B, V11.16B, V31.16B
    
    AND     V4.16B, V16.16B, V24.16B
    AND     V5.16B, V17.16B, V24.16B
    AND     V6.16B, V18.16B, V24.16B
    AND     V7.16B, V19.16B, V24.16B
    SRI     V8.2D,   V16.2D,  #1
    SRI     V9.2D,   V17.2D,  #1
    SRI     V10.2D,  V18.2D,  #1
    SRI     V11.2D,  V19.2D,  #1
    AND     V28.16B, V16.16B, V25.16B
    AND     V29.16B, V17.16B, V25.16B
    AND     V30.16B, V18.16B, V25.16B
    AND     V31.16B, V19.16B, V25.16B
    SLI     V4.2D,  V4.2D, #1
    SLI     V5.2D,  V5.2D, #1
    SLI     V6.2D,  V6.2D, #1
    SLI     V7.2D,  V7.2D, #1
    AND     V8.16B,  V8.16B,  V24.16B
    AND     V9.16B,  V9.16B,  V24.16B
    AND     V10.16B, V10.16B, V24.16B
    AND     V11.16B, V11.16B, V24.16B
    EOR3    V4.16B, V4.16B, V8.16B,  V28.16B
    EOR3    V5.16B, V5.16B, V9.16B,  V29.16B
    EOR3    V6.16B, V6.16B, V10.16B, V30.16B
    EOR3    V7.16B, V7.16B, V11.16B, V31.16B
    
    SRI     V28.2D,  V20.2D,  #1
    SRI     V29.2D,  V21.2D,  #1
    SRI     V30.2D,  V22.2D,  #1
    SRI     V31.2D,  V23.2D,  #1
    AND     V8.16B,  V20.16B, V24.16B
    AND     V9.16B,  V21.16B, V24.16B
    AND     V10.16B, V22.16B, V24.16B
    AND     V11.16B, V23.16B, V24.16B
    AND     V28.16B, V28.16B, V24.16B
    AND     V29.16B, V29.16B, V24.16B
    AND     V30.16B, V30.16B, V24.16B
    AND     V31.16B, V31.16B, V24.16B
    AND     V24.16B, V20.16B, V25.16B
    AND     V26.16B, V22.16B, V25.16B
    AND     V27.16B, V23.16B, V25.16B
    AND     V25.16B, V21.16B, V25.16B
    SLI     V8.2D,  V8.2D, #1
    SLI     V9.2D,  V9.2D, #1
    SLI     V10.2D, V10.2D, #1
    SLI     V11.2D, V11.2D, #1
    EOR3    V8.16B,  V8.16B, V24.16B,  V28.16B
    EOR3    V10.16B, V10.16B, V26.16B, V30.16B
    EOR3    V11.16B, V11.16B, V27.16B, V31.16B
    EOR3    V9.16B,  V9.16B, V25.16B,  V29.16B
    
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
    
    










.global Xoodootimes4_Initialize_old
.type Xoodootimes4_Initialize_old,%function

Xoodootimes4_Initialize_old:
	# Load data to regs
    LD4     {V1.S, V2.S, V3.S, V4.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V1.S, V2.S, V3.S, V4.S}[1], [x0]

	# Interleave on a byte level
    ZIP1    V11.16B,  V2.16B, V1.16B
    ZIP1    V12.16B,  V4.16B, V3.16B
    SRI     V5.2D, V11.2D, #32
    SRI     V6.2D, V12.2D, #32
    SLI     V5.2D, V11.2D, #32
    SLI     V6.2D, V12.2D, #32
    
    	# Swap 4 bits
    MOVI    V8.8H,  #0xF0,  LSL #8
    MOVI    V7.8H,  #0xF0
    MOVI    V9.8H,  #0x0F
    ORR     V8.16B, V8.16B, V9.16B
    
    AND     V11.16B, V5.16B, V7.16B             
    AND     V12.16B, V6.16B, V7.16B 
    SRI     V13.2D,  V5.2D,  #4
    SRI     V14.2D,  V6.2D,  #4
    AND     V15.16B, V5.16B, V8.16B
    AND     V16.16B, V6.16B, V8.16B              
    SLI     V11.2D,  V11.2D, #4
    SLI     V12.2D,  V12.2D, #4
    AND     V13.16B, V13.16B, V7.16B
    AND     V14.16B, V14.16B, V7.16B              
    EOR3    V17.16B, V11.16B, V13.16B, V15.16B
    EOR3    V18.16B, V12.16B, V14.16B, V16.16B
    
	# Swap 2 bits
    MOVI    V7.8H,  #0x0C
    MOVI    V8.8H,  #0xC3
    MOVI    V9.8H,  #0x0C, LSL #8
    MOVI    V10.8H, #0xC3, LSL #8
    ORR     V7.16B, V7.16B, V9.16B
    ORR     V8.16B, V8.16B, V10.16B
    
    AND     V11.16B, V17.16B, V7.16B             
    AND     V12.16B, V18.16B, V7.16B 
    SRI     V13.2D,  V17.2D,  #2
    SRI     V14.2D,  V18.2D,  #2
    AND     V15.16B, V17.16B, V8.16B
    AND     V16.16B, V18.16B, V8.16B              
    SLI     V11.2D,  V11.2D, #2
    SLI     V12.2D,  V12.2D, #2
    AND     V13.16B, V13.16B, V7.16B
    AND     V14.16B, V14.16B, V7.16B              
    EOR3    V17.16B, V11.16B, V13.16B, V15.16B
    EOR3    V18.16B, V12.16B, V14.16B, V16.16B
    
	# Swap 1 bit
    MOVI    V7.8H,  #0x22
    MOVI    V8.8H,  #0x99
    MOVI    V9.8H,  #0x22, LSL #8
    MOVI    V10.8H, #0x99, LSL #8
    ORR     V7.16B, V7.16B, V9.16B
    ORR     V8.16B, V8.16B, V10.16B
    
    AND     V11.16B, V17.16B, V7.16B             
    AND     V12.16B, V18.16B, V7.16B 
    SRI     V13.2D,  V17.2D,  #1
    SRI     V14.2D,  V18.2D,  #1
    AND     V15.16B, V17.16B, V8.16B
    AND     V16.16B, V18.16B, V8.16B              
    SLI     V11.2D,  V11.2D, #1
    SLI     V12.2D,  V12.2D, #1
    AND     V13.16B, V13.16B, V7.16B
    AND     V14.16B, V14.16B, V7.16B              
    EOR3    V11.16B, V11.16B, V13.16B, V15.16B
    EOR3    V12.16B, V12.16B, V14.16B, V16.16B
	
    
	# TEMP: store values
    ST1     {V11.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V12.2D}, [x1]
    
    
    
    
    
    
    
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
    EOR3    V12.16B, V3.16B, V7.16B, V11.16B   
    EOR3    V13.16B, V0.16B, V4.16B, V8.16B
    EOR3    V14.16B, V1.16B, V5.16B, V9.16B
    EOR3    V15.16B, V2.16B, V6.16B, V10.16B           
    SRI     V16.2D,  V12.2D, #54              
    SRI     V17.2D,  V13.2D, #54              
    SRI     V18.2D,  V14.2D, #54              
    SRI     V19.2D,  V15.2D, #54              
    SRI     V20.2D,  V12.2D, #36              
    SRI     V21.2D,  V13.2D, #36              
    SRI     V22.2D,  V14.2D, #36              
    SRI     V23.2D,  V15.2D, #36
    SLI     V16.2D,  V12.2D, #10
    SLI     V17.2D,  V13.2D, #10
    SLI     V18.2D,  V14.2D, #10
    SLI     V19.2D,  V15.2D, #10
    SLI     V20.2D,  V12.2D, #28
    SLI     V21.2D,  V13.2D, #28
    SLI     V22.2D,  V14.2D, #28
    SLI     V23.2D,  V15.2D, #28
    EOR3    V0.16B,  V0.16B, V20.16B, V16.16B
    EOR3    V1.16B,  V1.16B, V21.16B, V17.16B
    EOR3    V2.16B,  V2.16B, V22.16B, V18.16B
    EOR3    V3.16B,  V3.16B, V23.16B, V19.16B
    EOR3    V4.16B,  V4.16B, V20.16B, V16.16B
    EOR3    V5.16B,  V5.16B, V21.16B, V17.16B
    EOR3    V6.16B,  V6.16B, V22.16B, V18.16B
    EOR3    V7.16B,  V7.16B, V23.16B, V19.16B
    EOR3    V28.16B,  V8.16B, V20.16B, V16.16B
    EOR3    V29.16B,  V9.16B, V21.16B, V17.16B
    EOR3    V30.16B, V10.16B, V22.16B, V18.16B
    EOR3    V31.16B, V11.16B, V23.16B, V19.16B

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
    ST1     {V28.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V29.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V30.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V31.2D}, [x1]
    ADD     x1, x1, #16
    ST1     {V31.2D}, [x1]


    
    
    
    
    


    
.global Xoodootimes4_Rho_east_west_Iota_Khi
.type Xoodootimes4_Rho_east_west_Iota_Khi,%function

Xoodootimes4_Rho_east_west_Iota_Khi:

	# Load data to regs
    LD4     {V0.S, V1.S, V2.S, V3.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V28.S, V29.S, V30.S, V31.S}[0], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V28.S, V29.S, V30.S, V31.S}[1], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V28.S, V29.S, V30.S, V31.S}[2], [x0]
    ADD     x0, x0, #16
    LD4     {V0.S, V1.S, V2.S, V3.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V4.S, V5.S, V6.S, V7.S}[3], [x0]
    ADD     x0, x0, #16
    LD4     {V28.S, V29.S, V30.S, V31.S}[3], [x0]

	# Iota load
    LD1R    {V12.2D}, [X2]
    MOVI    V13.4S,  #0x00
    
	# Rho_west (second part)
    ;SRI     V8.2D,  V28.2D, #42
    ;SRI     V9.2D,  V29.2D, #42
    ;SRI     V10.2D, V30.2D, #42
    ;SRI     V11.2D, V31.2D, #42
    ;SLI     V8.2D,  V28.2D, #22
    ;SLI     V9.2D,  V29.2D, #22
    ;SLI     V10.2D, V30.2D, #22
    ;SLI     V11.2D, V31.2D, #22
    XAR     V8.2D,  V28.2D, V13.2D, #42
    XAR     V9.2D,  V29.2D, V13.2D, #42
    XAR     V10.2D, V30.2D, V13.2D, #42
    XAR     V11.2D, V31.2D, V13.2D, #42
    
	# Iota
    EOR     V20.16B, V0.16B, V12.16B
    EOR     V21.16B, V1.16B, V12.16B
    EOR     V22.16B, V2.16B, V12.16B
    EOR     V23.16B, V3.16B, V12.16B
    
	# Khi + first part Rho west
    BCAX    V0.16B, V20.16B, V11.16B, V4.16B
    BCAX    V1.16B, V21.16B, V8.16B,  V5.16B
    BCAX    V2.16B, V22.16B, V9.16B,  V6.16B
    BCAX    V3.16B, V23.16B, V10.16B, V7.16B
    BCAX    V24.16B, V4.16B, V20.16B, V11.16B
    BCAX    V25.16B, V5.16B, V21.16B, V8.16B
    BCAX    V26.16B, V6.16B, V22.16B, V9.16B
    BCAX    V27.16B, V7.16B, V23.16B, V10.16B
    BCAX    V28.16B, V11.16B, V4.16B, V20.16B
    BCAX    V29.16B, V8.16B,  V5.16B, V21.16B
    BCAX    V30.16B, V9.16B,  V6.16B, V22.16B
    BCAX    V31.16B, V10.16B, V7.16B, V23.16B
    
	# Rho east
    ;SRI     V4.2D, V24.2D, #62
    ;SRI     V5.2D, V25.2D, #62
    ;SRI     V6.2D, V26.2D, #62
    ;SRI     V7.2D, V27.2D, #62
    ;SRI     V10.2D, V28.2D, #48
    ;SRI     V11.2D, V29.2D, #48
    ;SRI     V8.2D,  V30.2D, #48
    ;SRI     V9.2D,  V31.2D, #48
    ;SLI     V4.2D, V24.2D, #2
    ;SLI     V5.2D, V25.2D, #2
    ;SLI     V6.2D, V26.2D, #2
    ;SLI     V7.2D, V27.2D, #2
    ;SLI     V10.2D, V28.2D, #16
    ;SLI     V11.2D, V29.2D, #16
    ;SLI     V8.2D,  V30.2D, #16
    ;SLI     V9.2D,  V31.2D, #16
    XAR     V4.2D, V24.2D, V13.2D, #62
    XAR     V5.2D, V25.2D, V13.2D, #62
    XAR     V6.2D, V26.2D, V13.2D, #62
    XAR     V7.2D, V27.2D, V13.2D, #62
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


    
    
    
    
    


    
