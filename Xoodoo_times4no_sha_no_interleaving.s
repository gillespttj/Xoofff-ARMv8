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
    
    EOR     V20.16B, V20.16B, V16.16B
    EOR     V21.16B, V21.16B, V17.16B
    EOR     V22.16B, V22.16B, V18.16B
    EOR     V23.16B, V23.16B, V19.16B
    
    EOR     V12.16B, V8.16B,  V20.16B
    EOR     V13.16B, V9.16B,  V21.16B
    EOR     V14.16B, V10.16B, V22.16B
    EOR     V15.16B, V11.16B, V23.16B
    
    EOR     V0.16B,  V0.16B, V20.16B
    EOR     V1.16B,  V1.16B, V21.16B
    EOR     V2.16B,  V2.16B, V22.16B
    EOR     V3.16B,  V3.16B, V23.16B
    
    EOR     V4.16B,  V4.16B, V20.16B
    EOR     V5.16B,  V5.16B, V21.16B
    EOR     V6.16B,  V6.16B, V22.16B
    EOR     V7.16B,  V7.16B, V23.16B
.endm

.macro iota_1 val
    MOVI	V25.4S, #\val
    EOR		V0.16B, V0.16B, V25.16B
.endm

.macro iota_2 val, shift
    MOVI	V25.4S, #\val
    SHL		V25.4S, V25.4S, #\shift
    EOR		V0.16B, V0.16B, V25.16B
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
    SRI     V4.4S, V20.4S, #31
    SRI     V5.4S, V21.4S, #31
    SRI     V6.4S, V22.4S, #31
    SRI     V7.4S, V23.4S, #31
    
    SRI     V10.4S, V24.4S, #24
    SRI     V11.4S, V25.4S, #24
    SRI     V8.4S,  V26.4S, #24
    SRI     V9.4S,  V27.4S, #24
    
    SLI     V4.4S, V20.4S, #1
    SLI     V5.4S, V21.4S, #1
    SLI     V6.4S, V22.4S, #1
    SLI     V7.4S, V23.4S, #1
    
    SLI     V10.4S, V24.4S, #8
    SLI     V11.4S, V25.4S, #8
    SLI     V8.4S,  V26.4S, #8
    SLI     V9.4S,  V27.4S, #8
.endm



.align  16
    
.global Xoodootimes4no_sha_no_interleaving_6rounds
.type Xoodootimes4no_sha_no_interleaving_6rounds,%function

Xoodootimes4no_sha_no_interleaving_6rounds:

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
    iota_1	0x60
    rho_w_chi
    rho_e

    theta
    iota_1	0x2C
    rho_w_chi
    rho_e

    theta
    iota_2	0x7, 7
    rho_w_chi
    rho_e

    theta
    iota_1	0xF0
    rho_w_chi
    rho_e

    theta
    iota_2	0xD, 5
    rho_w_chi
    rho_e

    theta
    iota_1	0x12
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





