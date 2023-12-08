;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_INTFbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_get_lvd_voltage
	extern	_get_chrg_status
	extern	_get_vin_status
	extern	_get_motor_in_status
	extern	_gpioKeyScan
	extern	_motor_close
	extern	_motor_open
	extern	_disable_breathing_mode
	extern	_enable_breathing_mode
	extern	_isr
	extern	_RESPIRATION_LAMP_TABLE
	extern	_INTE2
	extern	_RFC
	extern	_INTEDG
	extern	_AWUCON
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA
	extern	_gSysTick
	extern	_respiration_lamp_timer
	extern	_GpioKeyState
	extern	_gpioKeyWaitTimer
	extern	_delaySleepTime
	extern	_timer_slice_16ms
	extern	_dispTimerBatLow
	extern	_dispTimerForce
	extern	_displayData
	extern	_moto_work_mode
	extern	_vFlag_1
	extern	_vFlag_0

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

.segment "uninit", 0x20000040
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
	.res 1
STK04:
	.res 1
STK03:
	.res 1
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_vFlag_0:
	.res 1
	.debuginfo gvariable name=_vFlag_0,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_vFlag_1:
	.res 1
	.debuginfo gvariable name=_vFlag_1,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_moto_work_mode:
	.res 1
	.debuginfo gvariable name=_moto_work_mode,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_displayData:
	.res 1
	.debuginfo gvariable name=_displayData,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_dispTimerForce:
	.res 1
	.debuginfo gvariable name=_dispTimerForce,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_dispTimerBatLow:
	.res 1
	.debuginfo gvariable name=_dispTimerBatLow,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_timer_slice_16ms:
	.res 1
	.debuginfo gvariable name=_timer_slice_16ms,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_delaySleepTime:
	.res 1
	.debuginfo gvariable name=_delaySleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_gpioKeyWaitTimer:
	.res 1
	.debuginfo gvariable name=_gpioKeyWaitTimer,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_GpioKeyState:
	.res 1
	.debuginfo gvariable name=_GpioKeyState,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_respiration_lamp_timer:
	.res 1
	.debuginfo gvariable name=_respiration_lamp_timer,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_gSysTick:
	.res 1
	.debuginfo gvariable name=_gSysTick,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
_isr_timerCnt_65536_3:
	.res	1
	.debuginfo gvariable name=_isr_timerCnt_65536_3,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_isr_respiration_lamp_series_65536_3:
	.res	1
	.debuginfo gvariable name=_isr_respiration_lamp_series_65536_3,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_isr_led_lamp_65536_3:
	.res	1
	.debuginfo gvariable name=_isr_led_lamp_65536_3,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo gvariable name=___sdcc_saved_fsr,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo gvariable name=___sdcc_saved_stk00,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo gvariable name=___sdcc_saved_stk01,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_get_motor_in_status_counter_65536_43:
	.res	1
	.debuginfo gvariable name=_get_motor_in_status_counter_65536_43,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_get_vin_status_counter_65536_53:
	.res	1
	.debuginfo gvariable name=_get_vin_status_counter_65536_53,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_get_chrg_status_counter_65536_63:
	.res	1
	.debuginfo gvariable name=_get_chrg_status_counter_65536_63,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_get_lvd_voltage_counter_65536_73:
	.res	1
	.debuginfo gvariable name=_get_lvd_voltage_counter_65536_73,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_get_lvd_voltage_counter2_65536_73:
	.res	1
	.debuginfo gvariable name=_get_lvd_voltage_counter2_65536_73,1byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "code"
_RESPIRATION_LAMP_TABLE:
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x04	; 4
	retia 0x04	; 4
	retia 0x04	; 4
	retia 0x05	; 5
	retia 0x05	; 5
	retia 0x05	; 5
	retia 0x06	; 6
	retia 0x06	; 6
	retia 0x06	; 6
	retia 0x07	; 7
	retia 0x07	; 7
	retia 0x08	; 8
	retia 0x09	; 9
	retia 0x09	; 9
	retia 0x0a	; 10
	retia 0x0b	; 11
	retia 0x0b	; 11
	retia 0x0c	; 12
	retia 0x0d	; 13
	retia 0x0e	; 14
	retia 0x0f	; 15
	retia 0x10	; 16
	retia 0x11	; 17
	retia 0x12	; 18
	retia 0x14	; 20
	retia 0x15	; 21
	retia 0x17	; 23
	retia 0x18	; 24
	retia 0x1a	; 26
	retia 0x1c	; 28
	retia 0x1e	; 30
	retia 0x20	; 32
	retia 0x22	; 34
	retia 0x25	; 37
	retia 0x27	; 39
	retia 0x2a	; 42
	retia 0x2d	; 45
	retia 0x30	; 48	'0'
	retia 0x34	; 52	'4'
	retia 0x38	; 56	'8'
	retia 0x3c	; 60
	retia 0x40	; 64
	retia 0x44	; 68	'D'
	retia 0x49	; 73	'I'
	retia 0x4f	; 79	'O'
	retia 0x54	; 84	'T'
	retia 0x5a	; 90	'Z'
	retia 0x61	; 97	'a'
	retia 0x68	; 104	'h'
	retia 0x6f	; 111	'o'
	retia 0x77	; 119	'w'
	retia 0x80	; 128
	retia 0x89	; 137
	retia 0x93	; 147
	retia 0x9d	; 157
	retia 0xa8	; 168
	retia 0xb4	; 180
	retia 0xc1	; 193
	retia 0xcf	; 207
	retia 0xde	; 222
	retia 0xee	; 238
	retia 0xff	; 255
	retia 0xff	; 255
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   __gptrget1
;   __gptrget1
;4 compiler assigned registers:
;   STK00
;   STK01
;   r0x1018
;   r0x1019
;; Starting pCode block
_isr:
; 0 exit points
	.line	132, "main.c"; 	void isr(void) __interrupt(0) // 64us
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	138, "main.c"; 	if (TM0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00122_DS_
	.line	140, "main.c"; 	TM0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	146, "main.c"; 	timerCnt++;
	BANKSEL	_isr_timerCnt_65536_3
	INCR	_isr_timerCnt_65536_3,F
	.line	148, "main.c"; 	if (!(timerCnt & 0x01))
	BTRSC	_isr_timerCnt_65536_3,0
	MGOTO	_00002_DS_
	.line	150, "main.c"; 	bFlag_gSysTick_Change = 1; // 128us
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,5
_00002_DS_:
	.line	155, "main.c"; 	if (bFlag_is_breathing_mode) // 100us
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,0
	MGOTO	_00122_DS_
	.line	157, "main.c"; 	respiration_lamp_timer++;
	BANKSEL	_respiration_lamp_timer
	MOVR	_respiration_lamp_timer,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	INCR	r0x1018,W
	BANKSEL	_respiration_lamp_timer
	MOVAR	_respiration_lamp_timer
	.line	159, "main.c"; 	if (!(respiration_lamp_timer))
	MOVR	_respiration_lamp_timer,W
	BTRSS	STATUS,2
	MGOTO	_00115_DS_
	.line	161, "main.c"; 	if (bFlag_inc_or_dec)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,1
	MGOTO	_00112_DS_
	.line	163, "main.c"; 	if (!(--respiration_lamp_series))
	BANKSEL	_isr_respiration_lamp_series_65536_3
	DECRSZ	_isr_respiration_lamp_series_65536_3,F
	MGOTO	_00113_DS_
	.line	165, "main.c"; 	bFlag_inc_or_dec = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,1
	.line	165, "main.c"; 	// bFlag_disable_key = 0;
	MGOTO	_00113_DS_
_00112_DS_:
	.line	182, "main.c"; 	if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
	BANKSEL	_isr_respiration_lamp_series_65536_3
	INCR	_isr_respiration_lamp_series_65536_3,F
;;unsigned compare: left < lit(0x50=80), size=1
	MOVIA	0x50
	SUBAR	_isr_respiration_lamp_series_65536_3,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	184, "main.c"; 	respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;
	MOVIA	0x50
	MOVAR	_isr_respiration_lamp_series_65536_3
	.line	188, "main.c"; 	bFlag_inc_or_dec = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,1
_00113_DS_:
	.line	193, "main.c"; 	led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
	BANKSEL	_isr_respiration_lamp_series_65536_3
	MOVR	_isr_respiration_lamp_series_65536_3,W
	ADDIA	(_RESPIRATION_LAMP_TABLE + 0)
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	((_RESPIRATION_LAMP_TABLE + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MOVAR	STK01
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_isr_led_lamp_65536_3
	MOVAR	_isr_led_lamp_65536_3
_00115_DS_:
	.line	196, "main.c"; 	if (respiration_lamp_timer >= led_lamp)
	BANKSEL	_isr_led_lamp_65536_3
	MOVR	_isr_led_lamp_65536_3,W
	BANKSEL	_respiration_lamp_timer
	SUBAR	_respiration_lamp_timer,W
	BTRSS	STATUS,0
	MGOTO	_00117_DS_
	.line	198, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	198, "main.c"; 	// P_LED_G_OFF;
	MGOTO	_00122_DS_
_00117_DS_:
	.line	204, "main.c"; 	P_LED_B_ON;
	BSR	_PORTBbits,2
_00122_DS_:
	.line	230, "main.c"; 	if (INTFbits.LVDIF)
	BTRSS	_INTFbits,4
	MGOTO	_00125_DS_
	.line	232, "main.c"; 	INTFbits.LVDIF = 0;
	MOVIA	0xef
	MOVAR	(_INTFbits + 0)
_00125_DS_:
	.line	234, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _get_vin_status
;   _get_chrg_status
;   _gpioKeyScan
;   _get_lvd_voltage
;   _get_vin_status
;   _get_chrg_status
;   _gpioKeyScan
;   _get_lvd_voltage
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	760, "main.c"; 	DISI();
	DISI
	.line	762, "main.c"; 	APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
	MOVIA	0xbf
	IOST	_APHCON
	.line	763, "main.c"; 	BPHCON = 0xEF; //! PB5--PB0 ,only pb4 have pullhigh
	MOVIA	0xef
	MOVAR	_BPHCON
	.line	765, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	766, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	770, "main.c"; 	IOSTA = 0x73; // PA5 Input <-- Set PA5 to open drain output
	MOVIA	0x73
	IOST	_IOSTA
	.line	771, "main.c"; 	IOSTB = 0xF0; // PB5 output PB4 Input
	MOVIA	0xf0
	IOST	_IOSTB
	.line	777, "main.c"; 	CMPCR = C_RBias_High_Dis | C_RBias_Low_Dis | C_CMPFINV_Dis | 0x0A; // initial SFR CMPCR (CMPF_INV=0) measure LVD_L
	MOVIA	0x0a
	IOST	_CMPCR
	.line	778, "main.c"; 	PCON1 &= 0xC3;
	IOSTR	_PCON1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVIA	0xc3
	ANDAR	r0x1016,F
	MOVR	r0x1016,W
	IOST	_PCON1
	.line	779, "main.c"; 	PCON1 |= C_LVD_3P45V; // Set LVDS[3:0]=0101b (2.8V) , Timer0 disable
	IOSTR	_PCON1
	MOVAR	r0x1016
	MOVIA	0x28
	IORAR	r0x1016,F
	MOVR	r0x1016,W
	IOST	_PCON1
	.line	780, "main.c"; 	PCONbits.LVDEN = 1;   // Enable low-voltage detector
	BSR	_PCONbits,5
	.line	783, "main.c"; 	T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
	MOVIA	0x0f
	T0MD	
	.line	792, "main.c"; 	INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	793, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	795, "main.c"; 	PCON = 0xFC; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
	MOVIA	0xfc
	MOVAR	_PCON
	.line	798, "main.c"; 	PCON1 |= C_TMR0_En; // Enable Timer0
	IOSTR	_PCON1
	MOVAR	r0x1016
	BSR	r0x1016,0
	MOVR	r0x1016,W
	IOST	_PCON1
	.line	800, "main.c"; 	ENI();
	ENI
	.line	802, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x0a
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	803, "main.c"; 	bFlag_Power_On = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,7
	.line	805, "main.c"; 	moto_work_mode = 1;
	MOVIA	0x01
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
_00404_DS_:
	.line	809, "main.c"; 	CLRWDT(); // Clear WatchDog
	clrwdt
	.line	813, "main.c"; 	if (bFlag_gSysTick_Change) // 128us
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,5
	MGOTO	_00404_DS_
	.line	815, "main.c"; 	bFlag_gSysTick_Change = 0;
	BCR	_vFlag_0,5
	.line	817, "main.c"; 	gSysTick++;
	BANKSEL	_gSysTick
	MOVR	_gSysTick,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	INCR	r0x1016,W
	BANKSEL	_gSysTick
	MOVAR	_gSysTick
	.line	819, "main.c"; 	if (!(gSysTick & 0x7F)) // 16ms
	ANDIA	0x7f
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	834, "main.c"; 	if (0 == dispTimerForce)
	BANKSEL	_dispTimerForce
	MOVR	_dispTimerForce,W
	BTRSS	STATUS,2
	MGOTO	_00365_DS_
	.line	836, "main.c"; 	get_vin_status();
	MCALL	_get_vin_status
	.line	837, "main.c"; 	if (bFlag_Vin_Plug_In)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,4
	.line	839, "main.c"; 	get_chrg_status();
	MCALL	_get_chrg_status
_00365_DS_:
	.line	843, "main.c"; 	gpioKeyScan();
	MCALL	_gpioKeyScan
	.line	845, "main.c"; 	timer_slice_16ms++;
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	INCR	r0x1016,W
	BANKSEL	_timer_slice_16ms
	MOVAR	_timer_slice_16ms
	.line	856, "main.c"; 	if (!(timer_slice_16ms & 0x0F))
	ANDIA	0x0f
	BTRSC	STATUS,2
	.line	859, "main.c"; 	get_lvd_voltage();
	MCALL	_get_lvd_voltage
	.line	862, "main.c"; 	if (!(timer_slice_16ms & 0x1F))
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	ANDIA	0x1f
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	864, "main.c"; 	bFlag_Timeslice_500ms = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,2
_00001_DS_:
	.line	868, "main.c"; 	if (bFlag_Timeslice_500ms)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,2
	MGOTO	_00404_DS_
	.line	870, "main.c"; 	bFlag_Timeslice_500ms = 0;
	BCR	_vFlag_0,2
	.line	883, "main.c"; 	if (dispTimerForce)
	BANKSEL	_dispTimerForce
	MOVR	_dispTimerForce,W
	BTRSC	STATUS,2
	MGOTO	_00376_DS_
	.line	885, "main.c"; 	dispTimerForce--;
	MOVR	_dispTimerForce,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	DECR	r0x1016,W
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	886, "main.c"; 	if (dispTimerForce & BIT0)
	BTRSS	_dispTimerForce,0
	MGOTO	_00373_DS_
	.line	888, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,3
	.line	889, "main.c"; 	P_LED_B_ON;
	BSR	_PORTBbits,2
	MGOTO	_00377_DS_
_00373_DS_:
	.line	893, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	MGOTO	_00377_DS_
_00376_DS_:
	.line	898, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,3
_00377_DS_:
	.line	901, "main.c"; 	if (dispTimerBatLow)
	BANKSEL	_dispTimerBatLow
	MOVR	_dispTimerBatLow,W
	BTRSC	STATUS,2
	MGOTO	_00386_DS_
	.line	903, "main.c"; 	dispTimerBatLow--;
	MOVR	_dispTimerBatLow,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	DECR	r0x1016,W
	BANKSEL	_dispTimerBatLow
	MOVAR	_dispTimerBatLow
	.line	904, "main.c"; 	if (dispTimerBatLow & BIT0)
	BTRSS	_dispTimerBatLow,0
	MGOTO	_00379_DS_
	.line	906, "main.c"; 	P_LED_R_ON;
	BSR	_PORTBbits,3
	.line	907, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BCR	r0x1016,3
	MOVR	r0x1016,W
	IOST	_IOSTB
	MGOTO	_00380_DS_
_00379_DS_:
	.line	911, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,3
	.line	912, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BCR	r0x1016,3
	MOVR	r0x1016,W
	IOST	_IOSTB
_00380_DS_:
	.line	914, "main.c"; 	if (0 == dispTimerBatLow)
	BANKSEL	_dispTimerBatLow
	MOVR	_dispTimerBatLow,W
	BTRSS	STATUS,2
	MGOTO	_00386_DS_
	.line	916, "main.c"; 	if (bFlag_bat_low)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_00386_DS_
	.line	918, "main.c"; 	dispTimerBatLow = (CONST_dispTimerBatLow - 1);
	MOVIA	0x0a
	BANKSEL	_dispTimerBatLow
	MOVAR	_dispTimerBatLow
_00386_DS_:
	.line	925, "main.c"; 	if ((0 == bFlag_Vin_Plug_In) && (0 == bFlag_motor_open) /*&& (bFlag_OCP2_CC)*/)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,4
	MGOTO	_00404_DS_
	BTRSC	_vFlag_0,0
	MGOTO	_00404_DS_
	.line	927, "main.c"; 	if (!delaySleepTime)
	BANKSEL	_delaySleepTime
	MOVR	_delaySleepTime,W
	BTRSS	STATUS,2
	MGOTO	_00394_DS_
	.line	930, "main.c"; 	DISI();
	DISI
	.line	931, "main.c"; 	INTE = 0x00; // Timer0 overflow interrupt enable bit
	CLRR	_INTE
	.line	932, "main.c"; 	PCON = 0x78; //! PA4 PA5 上拉disable
	MOVIA	0x78
	MOVAR	_PCON
	.line	940, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	941, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	943, "main.c"; 	IOSTA = 0x73; // PA5 Input <-- Set PA5 to open drain output
	MOVIA	0x73
	IOST	_IOSTA
	.line	944, "main.c"; 	IOSTB = 0xF0; // PB5 output PB4 Input
	MOVIA	0xf0
	IOST	_IOSTB
	.line	947, "main.c"; 	BODCON = 0x00; // PB4 open-drain
	CLRA	
	IOST	_BODCON
	.line	948, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,3
	.line	950, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	951, "main.c"; 	AWUCON = (C_PA6_Wakeup | C_PA5_Wakeup); // | C_PA0_Wakeup
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	952, "main.c"; 	BWUCON = C_PB4_Wakeup;
	MOVIA	0x10
	MOVAR	_BWUCON
	.line	954, "main.c"; 	INTE = C_INT_PABKey; // Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	955, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	961, "main.c"; 	if (!P_KEY_POWER)
	BTRSS	_PORTBbits,4
	MGOTO	_00389_DS_
	.line	965, "main.c"; 	UPDATE_REG(PORTB);
	MOVR	_PORTB,F
	.line	966, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	967, "main.c"; 	NOP();
	nop
	.line	968, "main.c"; 	SLEEP();
	sleep
	.line	969, "main.c"; 	NOP();
	nop
_00389_DS_:
	.line	971, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	975, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x0a
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	981, "main.c"; 	CMPCR = C_RBias_High_Dis | C_RBias_Low_Dis | C_CMPFINV_Dis | 0x0A; // initial SFR CMPCR (CMPF_INV=0) measure LVD_L
	IOST	_CMPCR
	.line	982, "main.c"; 	PCON = 0xFC;
	MOVIA	0xfc
	MOVAR	_PCON
	.line	984, "main.c"; 	PCON1 &= 0xC3;
	IOSTR	_PCON1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVIA	0xc3
	ANDAR	r0x1016,F
	MOVR	r0x1016,W
	IOST	_PCON1
	.line	985, "main.c"; 	if (bFlag_bat_low)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_00391_DS_
	.line	987, "main.c"; 	PCON1 |= C_LVD_3P15V;
	IOSTR	_PCON1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BSR	r0x1016,5
	MOVR	r0x1016,W
	IOST	_PCON1
	MGOTO	_00392_DS_
_00391_DS_:
	.line	991, "main.c"; 	PCON1 |= C_LVD_3P45V; // Set LVDS[3:0]=0101b (2.8V) , Timer0 disable
	IOSTR	_PCON1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVIA	0x28
	IORAR	r0x1016,F
	MOVR	r0x1016,W
	IOST	_PCON1
_00392_DS_:
	.line	993, "main.c"; 	PCON1 |= C_TMR0_En;            // Enable Timer0
	IOSTR	_PCON1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BSR	r0x1016,0
	MOVR	r0x1016,W
	IOST	_PCON1
	.line	994, "main.c"; 	INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	995, "main.c"; 	ENI();
	ENI
	MGOTO	_00404_DS_
_00394_DS_:
	.line	999, "main.c"; 	delaySleepTime--;
	BANKSEL	_delaySleepTime
	MOVR	_delaySleepTime,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	DECR	r0x1016,W
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	MGOTO	_00404_DS_
	.line	1007, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _motor_close
;   _motor_close
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_get_lvd_voltage
	.debuginfo subprogram _get_lvd_voltage
;local variable name mapping:
	.debuginfo variable _counter=_get_lvd_voltage_counter_65536_73,enc=unsigned
	.debuginfo variable _counter2=_get_lvd_voltage_counter2_65536_73,enc=unsigned
_get_lvd_voltage:
; 2 exit points
	.line	691, "main.c"; 	if (bFlag_Vin_Plug_In)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00338_DS_
	.line	693, "main.c"; 	counter = 0;
	BANKSEL	_get_lvd_voltage_counter_65536_73
	CLRR	_get_lvd_voltage_counter_65536_73
	.line	694, "main.c"; 	counter2 = 0;
	BANKSEL	_get_lvd_voltage_counter2_65536_73
	CLRR	_get_lvd_voltage_counter2_65536_73
	.line	695, "main.c"; 	bFlag_bat_low = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,2
	.line	696, "main.c"; 	bFlag_bat_shut_down = 0;
	BCR	_vFlag_1,3
	.line	697, "main.c"; 	dispTimerBatLow = 0;
	BANKSEL	_dispTimerBatLow
	CLRR	_dispTimerBatLow
	.line	698, "main.c"; 	PCON1 &= 0xC3;
	IOSTR	_PCON1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0xc3
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	IOST	_PCON1
	.line	699, "main.c"; 	PCON1 |= C_LVD_3P45V;
	IOSTR	_PCON1
	MOVAR	r0x1015
	MOVIA	0x28
	IORAR	r0x1015,F
	MOVR	r0x1015,W
	IOST	_PCON1
	.line	700, "main.c"; 	return;
	MGOTO	_00357_DS_
_00338_DS_:
	.line	703, "main.c"; 	if (0 == bFlag_bat_low)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,2
	MGOTO	_00355_DS_
	.line	707, "main.c"; 	if (!(PCON1 & C_LVDOUT))
	IOSTR	_PCON1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BTRSC	r0x1015,6
	MGOTO	_00345_DS_
	.line	709, "main.c"; 	RA2 = 0;
	BCR	_PORTAbits,2
	.line	710, "main.c"; 	counter++;
	BANKSEL	_get_lvd_voltage_counter_65536_73
	INCR	_get_lvd_voltage_counter_65536_73,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	.line	711, "main.c"; 	if (counter > 31)
	MOVIA	0x20
	SUBAR	_get_lvd_voltage_counter_65536_73,W
	BTRSS	STATUS,0
	MGOTO	_00357_DS_
	.line	713, "main.c"; 	bFlag_bat_low = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,2
	.line	715, "main.c"; 	PCON1 &= 0xC3;
	IOSTR	_PCON1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0xc3
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	IOST	_PCON1
	.line	716, "main.c"; 	PCON1 |= C_LVD_3P15V;
	IOSTR	_PCON1
	MOVAR	r0x1015
	BSR	r0x1015,5
	MOVR	r0x1015,W
	IOST	_PCON1
	.line	717, "main.c"; 	if (dispTimerForce)
	BANKSEL	_dispTimerForce
	MOVR	_dispTimerForce,W
	BTRSC	STATUS,2
	MGOTO	_00340_DS_
	.line	719, "main.c"; 	dispTimerBatLow = dispTimerForce; //和挡位同步闪烁
	MOVR	_dispTimerForce,W
	BANKSEL	_dispTimerBatLow
	MOVAR	_dispTimerBatLow
	MGOTO	_00357_DS_
_00340_DS_:
	.line	723, "main.c"; 	dispTimerBatLow = CONST_dispTimerBatLow;
	MOVIA	0x0b
	BANKSEL	_dispTimerBatLow
	MOVAR	_dispTimerBatLow
	MGOTO	_00357_DS_
_00345_DS_:
	.line	729, "main.c"; 	counter = 0;
	BANKSEL	_get_lvd_voltage_counter_65536_73
	CLRR	_get_lvd_voltage_counter_65536_73
	.line	730, "main.c"; 	RA2 = 1;
	BSR	_PORTAbits,2
	MGOTO	_00357_DS_
_00355_DS_:
	.line	735, "main.c"; 	if (0 == bFlag_bat_shut_down)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	MGOTO	_00357_DS_
	.line	738, "main.c"; 	if (!(PCON1 & C_LVDOUT))
	IOSTR	_PCON1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BTRSC	r0x1015,6
	MGOTO	_00350_DS_
	.line	740, "main.c"; 	RA2 = 0;
	BCR	_PORTAbits,2
	.line	741, "main.c"; 	counter2++;
	BANKSEL	_get_lvd_voltage_counter2_65536_73
	INCR	_get_lvd_voltage_counter2_65536_73,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	.line	742, "main.c"; 	if (counter2 > 31)
	MOVIA	0x20
	SUBAR	_get_lvd_voltage_counter2_65536_73,W
	BTRSS	STATUS,0
	MGOTO	_00357_DS_
	.line	744, "main.c"; 	bFlag_bat_shut_down = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,3
	.line	746, "main.c"; 	motor_close();
	MCALL	_motor_close
	MGOTO	_00357_DS_
_00350_DS_:
	.line	751, "main.c"; 	counter2 = 0;
	BANKSEL	_get_lvd_voltage_counter2_65536_73
	CLRR	_get_lvd_voltage_counter2_65536_73
	.line	752, "main.c"; 	RA2 = 1;
	BSR	_PORTAbits,2
_00357_DS_:
	.line	756, "main.c"; 	}
	RETURN	
; exit point of _get_lvd_voltage

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _disable_breathing_mode
;   _enable_breathing_mode
;   _disable_breathing_mode
;   _enable_breathing_mode
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_get_chrg_status
	.debuginfo subprogram _get_chrg_status
;local variable name mapping:
	.debuginfo variable _counter=_get_chrg_status_counter_65536_63,enc=unsigned
_get_chrg_status:
; 2 exit points
	.line	648, "main.c"; 	P_CHRG_FULL_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,6
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	650, "main.c"; 	if (0 == bFlag_charge_complete)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,6
	MGOTO	_00330_DS_
	.line	652, "main.c"; 	if (P_CHRG_FULL)
	BTRSS	_PORTAbits,6
	MGOTO	_00322_DS_
	.line	654, "main.c"; 	if (++counter > 128)
	BANKSEL	_get_chrg_status_counter_65536_63
	INCR	_get_chrg_status_counter_65536_63,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x81=129), size=1
	MOVIA	0x81
	SUBAR	_get_chrg_status_counter_65536_63,W
	BTRSS	STATUS,0
	MGOTO	_00332_DS_
	.line	656, "main.c"; 	bFlag_charge_complete = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,6
	.line	658, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	659, "main.c"; 	P_LED_B_ON;
	BSR	_PORTBbits,2
	MGOTO	_00332_DS_
_00322_DS_:
	.line	664, "main.c"; 	counter = 0;
	BANKSEL	_get_chrg_status_counter_65536_63
	CLRR	_get_chrg_status_counter_65536_63
	MGOTO	_00332_DS_
_00330_DS_:
	.line	669, "main.c"; 	if (!(P_CHRG_FULL))
	BTRSC	_PORTAbits,6
	MGOTO	_00327_DS_
	.line	671, "main.c"; 	if (++counter > 63)
	BANKSEL	_get_chrg_status_counter_65536_63
	INCR	_get_chrg_status_counter_65536_63,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x40=64), size=1
	MOVIA	0x40
	SUBAR	_get_chrg_status_counter_65536_63,W
	BTRSS	STATUS,0
	MGOTO	_00332_DS_
	.line	673, "main.c"; 	bFlag_charge_complete = 0; //
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,6
	.line	674, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x0a
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	675, "main.c"; 	enable_breathing_mode();
	MCALL	_enable_breathing_mode
	MGOTO	_00332_DS_
_00327_DS_:
	.line	680, "main.c"; 	counter = 0;
	BANKSEL	_get_chrg_status_counter_65536_63
	CLRR	_get_chrg_status_counter_65536_63
_00332_DS_:
	.line	683, "main.c"; 	}
	RETURN	
; exit point of _get_chrg_status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _disable_breathing_mode
;   _disable_breathing_mode
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_get_vin_status
	.debuginfo subprogram _get_vin_status
;local variable name mapping:
	.debuginfo variable _counter=_get_vin_status_counter_65536_53,enc=unsigned
_get_vin_status:
; 2 exit points
	.line	608, "main.c"; 	P_VIN_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	610, "main.c"; 	if (bFlag_Vin_Plug_In)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00312_DS_
	.line	612, "main.c"; 	if (!(P_VIN))
	BTRSC	_PORTAbits,5
	MGOTO	_00304_DS_
	.line	614, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_vin_status_counter_65536_53
	INCR	_get_vin_status_counter_65536_53,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_vin_status_counter_65536_53,W
	BTRSS	STATUS,0
	MGOTO	_00314_DS_
	.line	616, "main.c"; 	bFlag_Vin_Plug_In = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	.line	618, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	MGOTO	_00314_DS_
_00304_DS_:
	.line	623, "main.c"; 	counter = 0;
	BANKSEL	_get_vin_status_counter_65536_53
	CLRR	_get_vin_status_counter_65536_53
	MGOTO	_00314_DS_
_00312_DS_:
	.line	628, "main.c"; 	if (P_VIN)
	BTRSS	_PORTAbits,5
	MGOTO	_00309_DS_
	.line	630, "main.c"; 	if (++counter > CONST_VIN_FILTER)
	BANKSEL	_get_vin_status_counter_65536_53
	INCR	_get_vin_status_counter_65536_53,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_vin_status_counter_65536_53,W
	BTRSS	STATUS,0
	MGOTO	_00314_DS_
	.line	632, "main.c"; 	bFlag_Vin_Plug_In = 1; //
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
	MGOTO	_00314_DS_
_00309_DS_:
	.line	639, "main.c"; 	counter = 0;
	BANKSEL	_get_vin_status_counter_65536_53
	CLRR	_get_vin_status_counter_65536_53
_00314_DS_:
	.line	642, "main.c"; 	}
	RETURN	
; exit point of _get_vin_status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _motor_close
;   _motor_close
;1 compiler assigned register :
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_get_motor_in_status
	.debuginfo subprogram _get_motor_in_status
;local variable name mapping:
	.debuginfo variable _counter=_get_motor_in_status_counter_65536_43,enc=unsigned
_get_motor_in_status:
; 2 exit points
	.line	568, "main.c"; 	P_MOTOR_PLUGIN_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BSR	r0x1017,4
	MOVR	r0x1017,W
	IOST	_IOSTA
	.line	570, "main.c"; 	if (bFlag_motor_plugin)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,1
	MGOTO	_00294_DS_
	.line	572, "main.c"; 	if (!P_MOTOR_PLUGIN)
	BTRSC	_PORTAbits,4
	MGOTO	_00286_DS_
	.line	574, "main.c"; 	if (++counter > CONST_PLUGIN_FILTER)
	BANKSEL	_get_motor_in_status_counter_65536_43
	INCR	_get_motor_in_status_counter_65536_43,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x9=9), size=1
	MOVIA	0x09
	SUBAR	_get_motor_in_status_counter_65536_43,W
	BTRSS	STATUS,0
	MGOTO	_00296_DS_
	.line	576, "main.c"; 	bFlag_motor_plugin = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,1
	.line	577, "main.c"; 	motor_close();
	MCALL	_motor_close
	MGOTO	_00296_DS_
_00286_DS_:
	.line	582, "main.c"; 	counter = 0;
	BANKSEL	_get_motor_in_status_counter_65536_43
	CLRR	_get_motor_in_status_counter_65536_43
	MGOTO	_00296_DS_
_00294_DS_:
	.line	587, "main.c"; 	if (P_MOTOR_PLUGIN)
	BTRSS	_PORTAbits,4
	MGOTO	_00291_DS_
	.line	589, "main.c"; 	if (++counter > CONST_PLUGIN_FILTER)
	BANKSEL	_get_motor_in_status_counter_65536_43
	INCR	_get_motor_in_status_counter_65536_43,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x9=9), size=1
	MOVIA	0x09
	SUBAR	_get_motor_in_status_counter_65536_43,W
	BTRSS	STATUS,0
	MGOTO	_00296_DS_
	.line	591, "main.c"; 	bFlag_motor_plugin = 1; // kaigai
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,1
	MGOTO	_00296_DS_
_00291_DS_:
	.line	596, "main.c"; 	counter = 0;
	BANKSEL	_get_motor_in_status_counter_65536_43
	CLRR	_get_motor_in_status_counter_65536_43
_00296_DS_:
	.line	599, "main.c"; 	}
	RETURN	
; exit point of _get_motor_in_status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _motor_open
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _motor_close
;   _motor_open
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _motor_close
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_gpioKeyScan
	.debuginfo subprogram _gpioKeyScan
_gpioKeyScan:
; 2 exit points
	.line	395, "main.c"; 	P_KEY_POWER_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BSR	r0x1015,4
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	396, "main.c"; 	if (gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSC	STATUS,2
	MGOTO	_00169_DS_
	.line	397, "main.c"; 	gpioKeyWaitTimer--;
	MOVR	_gpioKeyWaitTimer,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	DECR	r0x1015,W
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
_00169_DS_:
	.line	399, "main.c"; 	KeyIndex = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,5
	.line	401, "main.c"; 	if (P_KEY_POWER)
	BTRSC	_PORTBbits,4
	.line	403, "main.c"; 	KeyIndex = 1;
	BSR	_vFlag_1,5
	.line	406, "main.c"; 	switch (GpioKeyState)
	BANKSEL	_GpioKeyState
	MOVR	_GpioKeyState,W
	BTRSC	STATUS,2
	MGOTO	_00172_DS_
	MOVR	_GpioKeyState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00175_DS_
	MOVR	_GpioKeyState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_00181_DS_
	MOVR	_GpioKeyState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00197_DS_
	MGOTO	_00200_DS_
_00172_DS_:
	.line	409, "main.c"; 	if (KeyIndex)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_00174_DS_
	.line	412, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_00202_DS_
_00174_DS_:
	.line	417, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
	MOVIA	0x02
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	419, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_JITTER;
	MOVIA	0x01
	BANKSEL	_GpioKeyState
	MOVAR	_GpioKeyState
_00175_DS_:
	.line	422, "main.c"; 	if (KeyIndex) // if(PreKeyIndex != KeyIndex)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_00179_DS_
	.line	425, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_GpioKeyState
	CLRR	_GpioKeyState
	MGOTO	_00201_DS_
_00179_DS_:
	.line	428, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	.line	434, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
	MOVIA	0xc8
	MOVAR	_gpioKeyWaitTimer
	.line	435, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
	MOVIA	0x02
	BANKSEL	_GpioKeyState
	MOVAR	_GpioKeyState
	.line	439, "main.c"; 	break;
	MGOTO	_00201_DS_
_00181_DS_:
	.line	442, "main.c"; 	if (KeyIndex) // if(PreKeyIndex != KeyIndex)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_00195_DS_
	.line	446, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_GpioKeyState
	CLRR	_GpioKeyState
	.line	449, "main.c"; 	if (0 == bFlag_bat_shut_down)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	MGOTO	_00191_DS_
	.line	451, "main.c"; 	if (0 == bFlag_motor_open)
	BANKSEL	_vFlag_0
	BTRSC	_vFlag_0,0
	MGOTO	_00188_DS_
	.line	453, "main.c"; 	motor_open();
	MCALL	_motor_open
	MGOTO	_00191_DS_
_00188_DS_:
	.line	457, "main.c"; 	switch (moto_work_mode)
	BANKSEL	_moto_work_mode
	MOVR	_moto_work_mode,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00182_DS_
	MOVR	r0x1015,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_00183_DS_
	MOVR	r0x1015,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00184_DS_
	MGOTO	_00185_DS_
_00182_DS_:
	.line	460, "main.c"; 	moto_work_mode = 2;
	MOVIA	0x02
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
	.line	461, "main.c"; 	P_5V_REF_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BSR	r0x1015,5
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	462, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BSR	r0x1015,1
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	463, "main.c"; 	P_7V_REF_CLR;
	BCR	_PORTAbits,0
	.line	464, "main.c"; 	P_7V_REF_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BCR	r0x1015,0
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	465, "main.c"; 	dispTimerForce = (4 + PY);
	MOVIA	0x05
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	466, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	467, "main.c"; 	break;
	MGOTO	_00191_DS_
_00183_DS_:
	.line	469, "main.c"; 	moto_work_mode = 3;
	MOVIA	0x03
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
	.line	470, "main.c"; 	P_5V_REF_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BSR	r0x1015,5
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	471, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BSR	r0x1015,0
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	472, "main.c"; 	P_9V_REF_CLR;
	BCR	_PORTAbits,1
	.line	473, "main.c"; 	P_9V_REF_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BCR	r0x1015,1
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	474, "main.c"; 	dispTimerForce = (6 + PY);
	MOVIA	0x07
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	475, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	476, "main.c"; 	break;
	MGOTO	_00191_DS_
_00184_DS_:
	.line	479, "main.c"; 	moto_work_mode = 1;
	MOVIA	0x01
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
	.line	480, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BSR	r0x1015,0
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	481, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BSR	r0x1015,1
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	482, "main.c"; 	P_5V_REF_CLR;
	BCR	_PORTBbits,5
	.line	483, "main.c"; 	P_5V_REF_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1015
	BCR	r0x1015,5
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	484, "main.c"; 	dispTimerForce = (2 + PY);
	MOVIA	0x03
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	485, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	486, "main.c"; 	break;
	MGOTO	_00191_DS_
_00185_DS_:
	.line	488, "main.c"; 	moto_work_mode = 1;
	MOVIA	0x01
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
	.line	489, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BSR	r0x1015,0
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	490, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1015
	BSR	r0x1015,1
	MOVR	r0x1015,W
	IOST	_IOSTA
	.line	491, "main.c"; 	P_5V_REF_CLR;
	BCR	_PORTBbits,5
	.line	492, "main.c"; 	P_5V_REF_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1015
	BCR	r0x1015,5
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	493, "main.c"; 	dispTimerForce = (2 + PY);
	MOVIA	0x03
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	494, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
_00191_DS_:
	.line	500, "main.c"; 	return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
	MOVIA	0x21
	MGOTO	_00202_DS_
_00195_DS_:
	.line	503, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	.line	511, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_CP;
	MOVIA	0x03
	BANKSEL	_GpioKeyState
	MOVAR	_GpioKeyState
	.line	524, "main.c"; 	motor_close();
	MCALL	_motor_close
	.line	526, "main.c"; 	return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
	MOVIA	0x41
	MGOTO	_00202_DS_
_00197_DS_:
	.line	532, "main.c"; 	if (KeyIndex) // if(PreKeyIndex != KeyIndex)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_00201_DS_
	.line	537, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_GpioKeyState
	CLRR	_GpioKeyState
	.line	551, "main.c"; 	break;
	MGOTO	_00201_DS_
_00200_DS_:
	.line	554, "main.c"; 	GpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_GpioKeyState
	CLRR	_GpioKeyState
_00201_DS_:
	.line	558, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
_00202_DS_:
	.line	559, "main.c"; 	}
	RETURN	
; exit point of _gpioKeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_motor_close
	.debuginfo subprogram _motor_close
_motor_close:
; 2 exit points
	.line	327, "main.c"; 	P_MOTOR_EN_CLR;
	BCR	_PORTAbits,3
	.line	328, "main.c"; 	P_MOTOR_EN_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BCR	r0x1014,3
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	329, "main.c"; 	BOOST_EN_CLR;
	BCR	_PORTBbits,1
	.line	330, "main.c"; 	BOOST_EN_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BCR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	331, "main.c"; 	P_5V_REF_INPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BSR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	332, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,0
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	333, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	334, "main.c"; 	bFlag_motor_open = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,0
	.line	335, "main.c"; 	}
	RETURN	
; exit point of _motor_close

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;   _disable_breathing_mode
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_motor_open
	.debuginfo subprogram _motor_open
_motor_open:
; 2 exit points
	.line	270, "main.c"; 	bFlag_motor_open = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,0
	.line	271, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x0a
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	272, "main.c"; 	P_MOTOR_EN_SET;
	BSR	_PORTAbits,3
	.line	273, "main.c"; 	P_MOTOR_EN_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BCR	r0x1014,3
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	274, "main.c"; 	BOOST_EN_SET;
	BSR	_PORTBbits,1
	.line	275, "main.c"; 	BOOST_EN_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BCR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	276, "main.c"; 	switch (moto_work_mode)
	BANKSEL	_moto_work_mode
	MOVR	_moto_work_mode,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00138_DS_
	MOVR	r0x1014,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
	MOVR	r0x1014,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	MGOTO	_00141_DS_
_00138_DS_:
	.line	279, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,0
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	280, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	281, "main.c"; 	P_5V_REF_CLR;
	BCR	_PORTBbits,5
	.line	282, "main.c"; 	P_5V_REF_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BCR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	284, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	285, "main.c"; 	P_LED_R_ON;
	BSR	_PORTBbits,3
	.line	286, "main.c"; 	dispTimerForce = (2 + PY);
	MOVIA	0x03
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	287, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	288, "main.c"; 	break;
	MGOTO	_00143_DS_
_00139_DS_:
	.line	290, "main.c"; 	P_5V_REF_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	291, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	292, "main.c"; 	P_7V_REF_CLR;
	BCR	_PORTAbits,0
	.line	293, "main.c"; 	P_7V_REF_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BCR	r0x1014,0
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	295, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	296, "main.c"; 	P_LED_R_ON;
	BSR	_PORTBbits,3
	.line	297, "main.c"; 	dispTimerForce = (4 + PY);
	MOVIA	0x05
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	298, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	299, "main.c"; 	break;
	MGOTO	_00143_DS_
_00140_DS_:
	.line	301, "main.c"; 	P_5V_REF_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	302, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,0
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	303, "main.c"; 	P_9V_REF_CLR;
	BCR	_PORTAbits,1
	.line	304, "main.c"; 	P_9V_REF_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BCR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	306, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	307, "main.c"; 	P_LED_R_ON;
	BSR	_PORTBbits,3
	.line	308, "main.c"; 	dispTimerForce = (6 + PY);
	MOVIA	0x07
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	309, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	310, "main.c"; 	break;
	MGOTO	_00143_DS_
_00141_DS_:
	.line	312, "main.c"; 	P_7V_REF_INPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BSR	r0x1014,0
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	313, "main.c"; 	P_9V_REF_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1014
	BSR	r0x1014,1
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	314, "main.c"; 	P_5V_REF_CLR;
	BCR	_PORTBbits,5
	.line	315, "main.c"; 	P_5V_REF_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BCR	r0x1014,5
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	317, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	318, "main.c"; 	P_LED_R_ON;
	BSR	_PORTBbits,3
	.line	319, "main.c"; 	moto_work_mode = 1;
	MOVIA	0x01
	BANKSEL	_moto_work_mode
	MOVAR	_moto_work_mode
	.line	320, "main.c"; 	dispTimerForce = (2 + PY);
	MOVIA	0x03
	BANKSEL	_dispTimerForce
	MOVAR	_dispTimerForce
	.line	321, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
_00143_DS_:
	.line	324, "main.c"; 	}
	RETURN	
; exit point of _motor_open

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_disable_breathing_mode
	.debuginfo subprogram _disable_breathing_mode
_disable_breathing_mode:
; 2 exit points
	.line	253, "main.c"; 	bFlag_Vin_Plug_In = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	.line	254, "main.c"; 	bFlag_charge_complete = 1;
	BSR	_vFlag_0,6
	.line	257, "main.c"; 	bFlag_is_breathing_mode = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,0
	.line	259, "main.c"; 	P_LED_B_CLR;
	BCR	_PORTBbits,2
	.line	266, "main.c"; 	}
	RETURN	
; exit point of _disable_breathing_mode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_enable_breathing_mode
	.debuginfo subprogram _enable_breathing_mode
_enable_breathing_mode:
; 2 exit points
	.line	241, "main.c"; 	bFlag_is_breathing_mode = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,0
	.line	249, "main.c"; 	}
	RETURN	
; exit point of _enable_breathing_mode


;	code size estimation:
;	  771+  163 =   934 instructions ( 2194 byte)

	end
