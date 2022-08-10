.text

.macro theta
    EOR3    V12.16B, V3.16B, V7.16B, V11.16B   
    EOR3    V13.16B, V0.16B, V4.16B, V8.16B
    EOR3    V14.16B, V1.16B, V5.16B, V9.16B
    EOR3    V15.16B, V2.16B, V6.16B, V10.16B  
    SRI     V16.4S, V12.4S, #27
    SRI     V17.4S, V13.4S, #27
    SRI     V18.4S, V14.4S, #27
    SRI     V19.4S, V15.4S, #27
    SRI     V20.4S, V12.4S, #18
    SRI     V21.4S, V13.4S, #18
    SRI     V22.4S, V14.4S, #18
    SRI     V23.4S, V15.4S, #18
    SLI     V16.4S, V12.4S, #5
    SLI     V17.4S, V13.4S, #5
    SLI     V18.4S, V14.4S, #5
    SLI     V19.4S, V15.4S, #5
    SLI     V20.4S, V12.4S, #14
    SLI     V21.4S, V13.4S, #14
    SLI     V22.4S, V14.4S, #14
    SLI     V23.4S, V15.4S, #14
    EOR3    V12.16B, V8.16B,  V20.16B, V16.16B
    EOR3    V13.16B, V9.16B,  V21.16B, V17.16B
    EOR3    V14.16B, V10.16B, V22.16B, V18.16B
    EOR3    V15.16B, V11.16B, V23.16B, V19.16B
    EOR3    V0.16B,  V0.16B, V20.16B, V16.16B
    EOR3    V1.16B,  V1.16B, V21.16B, V17.16B
    EOR3    V2.16B,  V2.16B, V22.16B, V18.16B
    EOR3    V3.16B,  V3.16B, V23.16B, V19.16B
    EOR3    V4.16B,  V4.16B, V20.16B, V16.16B
    EOR3    V5.16B,  V5.16B, V21.16B, V17.16B
    EOR3    V6.16B,  V6.16B, V22.16B, V18.16B
    EOR3    V7.16B,  V7.16B, V23.16B, V19.16B
.endm

.macro iota_1
    EOR     V0.16B, V0.16B, V25.16B
.endm

.macro iota_2
    MOV     V25.2D[0], X3
    MOV     V25.2D[1], X3
    EOR     V0.16B, V0.16B, V25.16B
.endm

.macro rho_w_chi
    SRI     V8.4S,  V12.4S, #21
    SRI     V9.4S,  V13.4S, #21
    SRI     V10.4S, V14.4S, #21
    SRI     V11.4S, V15.4S, #21
    SLI     V8.4S,  V12.4S, #11
    SLI     V9.4S,  V13.4S, #11
    SLI     V10.4S, V14.4S, #11
    SLI     V11.4S, V15.4S, #11
    BCAX    V16.16B, V7.16B, V0.16B, V8.16B
    BCAX    V17.16B, V4.16B, V1.16B, V9.16B
    BCAX    V18.16B, V5.16B, V2.16B, V10.16B
    BCAX    V19.16B, V6.16B, V3.16B, V11.16B
    BCAX    V20.16B, V8.16B,  V7.16B, V0.16B
    BCAX    V21.16B, V9.16B,  V4.16B, V1.16B
    BCAX    V22.16B, V10.16B, V5.16B, V2.16B
    BCAX    V23.16B, V11.16B, V6.16B, V3.16B
    BCAX    V0.16B, V0.16B, V8.16B,  V7.16B
    BCAX    V1.16B, V1.16B, V9.16B,  V4.16B
    BCAX    V2.16B, V2.16B, V10.16B, V5.16B
    BCAX    V3.16B, V3.16B, V11.16B, V6.16B
    
    MOV     V4.16B, V16.16B
    MOV     V5.16B, V17.16B
    MOV     V6.16B, V18.16B
    MOV     V7.16B, V19.16B
    MOV     V8.16B, V20.16B
    MOV     V9.16B, V21.16B
    MOV     V10.16B, V22.16B
    MOV     V11.16B, V23.16B
.endm

.macro rho_e
    SRI     V4.4S, V16.4S, #31
    SRI     V5.4S, V17.4S, #31
    SRI     V6.4S, V18.4S, #31
    SRI     V7.4S, V19.4S, #31
    SRI     V10.4S, V20.4S, #24
    SRI     V11.4S, V21.4S, #24
    SRI     V8.4S,  V22.4S, #24
    SRI     V9.4S,  V23.4S, #24
    SLI     V4.4S, V16.4S, #1
    SLI     V5.4S, V17.4S, #1
    SLI     V6.4S, V18.4S, #1
    SLI     V7.4S, V19.4S, #1
    SLI     V10.4S, V20.4S, #8
    SLI     V11.4S, V21.4S, #8
    SLI     V8.4S,  V22.4S, #8
    SLI     V9.4S,  V23.4S, #8
.endm

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


    theta 
    MOVI     V25.4S, #0x60
    iota_1
    rho_w_chi 
    rho_e
    
    theta
    MOVI     V25.4S, #0x2C
    iota_1
    rho_w_chi
    rho_e
    
    theta
    MOV      X3, #0x0000038000000380
    iota_2
    rho_w_chi
    rho_e
    
    theta
    MOVI     V25.4S, #0xF0
    iota_1
    rho_w_chi
    rho_e
    
    theta
    MOV      X3, #0x000001A0
    MOVK     X3, #0x000001A0, LSL #32
    iota_2
    rho_w_chi
    rho_e
    
    theta
    MOVI     V25.4S, #0x12
    iota_1
    rho_w_chi
    rho_e
    
    
    ST4     {V0.S, V1.S, V2.S, V3.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[0], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[1], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[2], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[2], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[2], [x1]
    ADD     x1, x1, #16
    ST4     {V0.S, V1.S, V2.S, V3.S}[3], [x1]
    ADD     x1, x1, #16
    ST4     {V4.S, V5.S, V6.S, V7.S}[3], [x1]
    ADD     x1, x1, #16
    ST4     {V8.S, V9.S, V10.S, V11.S}[3], [x1]
    
    RET
