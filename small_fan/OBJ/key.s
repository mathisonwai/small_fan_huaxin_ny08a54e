;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"key.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_multi_16b
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
	extern	_RFCbits
	extern	_INTE2bits
	extern	_KeyEnter
	extern	_KeyAdd
	extern	_KeyDec
	extern	_KeyType
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_KeyScanInit
	extern	_KeyLogicScan
	extern	_KeyPhysicScan
	extern	_KeyOldVal
	extern	_KeyNewVal
	extern	_KeyPreVal
	extern	_KeyDbnCnt
	extern	_KeyRegister
	extern	_KeyStab

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_KeyOldVal:
	.res	1
	.debuginfo gvariable name=_KeyOldVal,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_KeyNewVal:
	.res	1
	.debuginfo gvariable name=_KeyNewVal,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_KeyPreVal:
	.res	1
	.debuginfo gvariable name=_KeyPreVal,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_KeyDbnCnt:
	.res	1
	.debuginfo gvariable name=_KeyDbnCnt,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_KeyRegister:
	.res	1
	.debuginfo gvariable name=_KeyRegister,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_KeyStab:
	dw	0x00
	.debuginfo gvariable name=_KeyStab,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=key, function=_KeyScanInit
	.debuginfo subprogram _KeyScanInit
_KeyScanInit:
; 2 exit points
	.line	65, "key.c"; 	KeyOldVal=0;
	BANKSEL	_KeyOldVal
	CLRR	_KeyOldVal
	.line	66, "key.c"; 	KeyNewVal=0;
	BANKSEL	_KeyNewVal
	CLRR	_KeyNewVal
	.line	67, "key.c"; 	KeyStab=0;
	BANKSEL	_KeyStab
	CLRR	_KeyStab
	.line	68, "key.c"; 	KeyRegister=0;
	BANKSEL	_KeyRegister
	CLRR	_KeyRegister
	.line	69, "key.c"; 	KeyDbnCnt=0;
	BANKSEL	_KeyDbnCnt
	CLRR	_KeyDbnCnt
	.line	70, "key.c"; 	}
	RETURN	
; exit point of _KeyScanInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _KeyPhysicScan
;   _KeyPhysicScan
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=key, function=_KeyLogicScan
	.debuginfo subprogram _KeyLogicScan
;local variable name mapping:
	.debuginfo variable _KeyCurVal=r0x1008,enc=unsigned
_KeyLogicScan:
; 2 exit points
	.line	28, "key.c"; 	KeyCurVal	= KeyPhysicScan();
	MCALL	_KeyPhysicScan
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	29, "key.c"; 	if(KeyCurVal==KeyPreVal)	
	BANKSEL	_KeyPreVal
	XORAR	_KeyPreVal,W
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	31, "key.c"; 	if((++KeyDbnCnt)>=DBC_TIMES)
	BANKSEL	_KeyDbnCnt
	INCR	_KeyDbnCnt,F
;;unsigned compare: left < lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_KeyDbnCnt,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	34, "key.c"; 	KeyDbnCnt	= 0;
	CLRR	_KeyDbnCnt
	.line	35, "key.c"; 	KeyStab		= 1;
	MOVIA	0x01
	BANKSEL	_KeyStab
	MOVAR	_KeyStab
	.line	36, "key.c"; 	KeyNewVal	= KeyCurVal;
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BANKSEL	_KeyNewVal
	MOVAR	_KeyNewVal
	MGOTO	_00113_DS_
_00112_DS_:
	.line	41, "key.c"; 	KeyDbnCnt	= 0;
	BANKSEL	_KeyDbnCnt
	CLRR	_KeyDbnCnt
	.line	42, "key.c"; 	KeyPreVal	= KeyCurVal;
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BANKSEL	_KeyPreVal
	MOVAR	_KeyPreVal
_00113_DS_:
	.line	46, "key.c"; 	if((KeyStab==1)&&(KeyNewVal!=KeyOldVal))
	BANKSEL	_KeyStab
	MOVR	_KeyStab,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00117_DS_
	BANKSEL	_KeyOldVal
	MOVR	_KeyOldVal,W
	BANKSEL	_KeyNewVal
	XORAR	_KeyNewVal,W
	BTRSC	STATUS,2
	MGOTO	_00117_DS_
	.line	48, "key.c"; 	KeyRegister	= ((KeyNewVal^KeyOldVal) | KeyRegister)&KeyNewVal;//?????
	BANKSEL	_KeyOldVal
	MOVR	_KeyOldVal,W
	BANKSEL	_KeyNewVal
	XORAR	_KeyNewVal,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	_KeyRegister
	MOVR	_KeyRegister,W
	BANKSEL	r0x1008
	IORAR	r0x1008,F
	BANKSEL	_KeyNewVal
	MOVR	_KeyNewVal,W
	BANKSEL	r0x1008
	ANDAR	r0x1008,W
	BANKSEL	_KeyRegister
	MOVAR	_KeyRegister
	.line	50, "key.c"; 	KeyStab	= 0;
	BANKSEL	_KeyStab
	CLRR	_KeyStab
	.line	51, "key.c"; 	KeyOldVal	= KeyNewVal;
	BANKSEL	_KeyNewVal
	MOVR	_KeyNewVal,W
	BANKSEL	_KeyOldVal
	MOVAR	_KeyOldVal
	.line	52, "key.c"; 	KeyEnter  =	(unsigned char)(KeyRegister&(~KEYENTERBIT));
	MOVIA	0x10
	BANKSEL	_KeyRegister
	ANDAR	_KeyRegister,W
	BANKSEL	_KeyEnter
	MOVAR	_KeyEnter
_00117_DS_:
	.line	54, "key.c"; 	}
	RETURN	
; exit point of _KeyLogicScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1007
;; Starting pCode block
.segment "code"; module=key, function=_KeyPhysicScan
	.debuginfo subprogram _KeyPhysicScan
;local variable name mapping:
	.debuginfo variable _j=r0x1007,enc=unsigned
	.debuginfo variable _KeyVal=r0x1007,enc=unsigned
_KeyPhysicScan:
; 2 exit points
	.line	17, "key.c"; 	j=	~(KeyEnterPort|KEYENTERBIT);
	MOVIA	0xef
	IORAR	_PORTA,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	COMR	r0x1007,W
	MOVAR	r0x1007
	.line	19, "key.c"; 	KeyVal&=0x10;	
	MOVIA	0x10
	ANDAR	r0x1007,F
	.line	20, "key.c"; 	return	KeyVal;
	MOVR	r0x1007,W
	.line	22, "key.c"; 	}
	RETURN	
; exit point of _KeyPhysicScan


;	code size estimation:
;	   57+   31 =    88 instructions (  238 byte)

	end
