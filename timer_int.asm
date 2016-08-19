; PIC16F628A Configuration Bit Settings
; ASM source line config statements
#include "p16F628A.inc"

; CONFIG
; __config 0xFF19
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF


 
	ORG	0x0000

iCount	EQU	d'241'
	
	GOTO	setup
	
	ORG	0x0004
	INCF	PORTA	
	BCF	INTCON, T0IF
	MOVLW	iCount
	MOVWF	TMR0
	RETFIE
	
setup:
	BANKSEL	TRISA
	MOVLW	0x00
	MOVWF	TRISA	
	
	BANKSEL	OPTION_REG
	MOVLW	b'11010011'
	MOVWF	OPTION_REG
	BCF	PCON, OSCF
	
	MOVLW	b'10100000'
	MOVWF	INTCON
	BANKSEL	PORTA
	MOVLW	iCount
	MOVWF	TMR0	
	
loop:	NOP
	GOTO	loop
	
	END
	
