;##############################################################################
;# File: main_assembler.s
;##############################################################################

;------------------------------------------------------------------------------
; Description
; This is a demonstration program to show basic code structures in assembly
// comment
; HELLO YOU
; Includes
#define  __ASSEMBLY__           1  ; Need this so the correct values in AT91SAM3U4.h are selected
#include "AT91SAM3U4.h"	           ; Include file for all special function registers
						                       ; and corresponding bit names
; A "MODULE" in an assembly file becomes and object file after it is assembled.
 		MODULE  main_assembler
    SECTION .text : CODE : NOROOT(2)
    THUMB

; "PUBLIC" declarations make labels from this file visible to others
		PUBLIC  main
    // Constantes
    #define PB_20_LED_RED               0x00100000
    #define PB_19_LED_GND               0x00080000
    #define PB_18_LED_BLU               0x00040000
    #define PB_17_LED_YLW               0x00020000
    #define PB_16_LED_CYN               0x00010000
    #define PB_15_LED_ORG               0x00008000
    #define PB_14_LED_PRP               0x00004000
    #define PB_13_LED_WHT               0x00002000
    
    #define PB_02_BUTTON3               0x00000004
    
    // Register address offsets
    #define PER_OER_OFFSET        (AT91C_PIOB_OER   -  AT91C_PIOB_PER)
    #define PER_OWER_OFFSET       (AT91C_PIOB_OWER  -  AT91C_PIOB_PER)
    #define PER_SODR_OFFSET       (AT91C_PIOB_SODR  -  AT91C_PIOB_PER)
    #define PER_CODR_OFFSET       (AT91C_PIOB_CODR  -  AT91C_PIOB_PER)
    #define PER_ODSR_OFFSET       (AT91C_PIOB_ODSR  -  AT91C_PIOB_PER)
    #define PER_PDSR_OFFSET       (AT91C_PIOB_PDSR  -  AT91C_PIOB_PER)
    
    #define PMC_PCER_INIT         (1 << AT91C_ID_PIOB)
    
    #define PIOB_PER_INIT         (PB_17_LED_YLW | PB_18_LED_BLU | PB_19_LED_GND \
                                   PB_20_LED_RED | PB_16_LED_CYN | PB_15_LED_ORG \
                                   PB_14_LED_PRP | PB_13_LED_WHT | PB_02_BUTTON3)
     
    #define PIOB_OER_INIT         (PB_17_LED_YLW | PB_18_LED_BLU | PB_19_LED_GND \
                                   PB_20_LED_RED | PB_16_LED_CYN | PB_15_LED_ORG \
                                   PB_14_LED_PRP | PB_13_LED_WHT)
                                   
    #define PIOB_OWER_INIT        (PB_17_LED_YLW | PB_18_LED_BLU | PB_19_LED_GND | PB_20_LED_RED)
    
    #define PIOB_CODR_INIT        0xFFFFFFFF
    
    #define WDTMR_INIT            0x00008000
    
    ; Hello world program
    init
      LDR r0, =WDTMR_INIT
      LDR r1, =AT91C_WTDC_WD

main
  MOV  r0, #10        ;r0 = 10
  MOV  r1, r0         ;r0 = r1
  MOV  r0, r1, LSL #4  ;r0 = 10
  MOV  r0, r1, ASR #1  ;r0 = 10

	END