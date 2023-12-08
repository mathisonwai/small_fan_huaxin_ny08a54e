#ifndef __APP_CFG_H_
#define __APP_CFG_H_

typedef unsigned char           BOOL;
typedef unsigned char           BYTE;
typedef unsigned char           INT8U;
typedef signed char             INT8S;
typedef unsigned int            INT16U;
typedef signed int              INT16S;
typedef unsigned long           INT32U;
typedef signed long             INT32S;
typedef unsigned int            clock_time_t;
typedef unsigned char           u8_t;
typedef signed char             s8_t;
typedef unsigned char           uint8_t;
typedef unsigned int            u16_t;
typedef unsigned int            uint16_t;

typedef signed int              s16_t;
typedef unsigned long int       u32_t;
typedef signed long int         s32_t;
typedef unsigned char           u8;
typedef signed char             s8;
typedef unsigned int            u16;
typedef signed int              s16;
typedef unsigned long           u32;
typedef signed long             s32;
typedef unsigned char           uchar;
typedef unsigned int            uint;
typedef unsigned long           ulong;
typedef unsigned short          WORD;
typedef unsigned long           DWORD;

typedef const signed char       sc8;    /*!< Read Only */
typedef const signed int        sc16;   /*!< Read Only */
typedef const signed long       sc32;   /*!< Read Only */
typedef const unsigned char     uc8;    /*!< Read Only */
typedef const unsigned int      uc16;   /*!< Read Only */
typedef const unsigned long     uc32;   /*!< Read Only */



// #define USING_IO_UART

#ifndef TRUE
#define TRUE    (1)
#endif

#ifndef FALSE
#define FALSE   (0)
#endif


#define BIT0        0x01
#define BIT1        0x02
#define BIT2        0x04
#define BIT3        0x08
#define BIT4        0x10
#define BIT5        0x20
#define BIT6        0x40
#define BIT7        0x80


#define  RA0        PORTAbits.PA0
#define  RA1        PORTAbits.PA1
#define  RA2        PORTAbits.PA2
#define  RA3        PORTAbits.PA3
#define  RA4        PORTAbits.PA4
#define  RA5        PORTAbits.PA5
#define  RA6        PORTAbits.PA6
#define  RA7        PORTAbits.PA7

#define  RB0        PORTBbits.PB0
#define  RB1        PORTBbits.PB1
#define  RB2        PORTBbits.PB2
#define  RB3        PORTBbits.PB3
#define  RB4        PORTBbits.PB4
#define  RB5        PORTBbits.PB5
#define  RB6        PORTBbits.PB6
#define  RB7        PORTBbits.PB7

#define TM1IE       INTEbits.T1IE
#define TM0IE       INTEbits.T0IE
#define RBIE        INTEbits.PBIE

#define RABIF       INTFbits.PABIF
#define TM1IF       INTFbits.T1IF
#define TM0IF       INTFbits.T0IF

//--- PIN1
//P_VDD
#ifdef USING_IO_UART
#define P_IO_UART_TX                   RA2
#define P_IO_UART_TX_CLR               P_IO_UART_TX = 0
#define P_IO_UART_TX_SET               P_IO_UART_TX = 1
#define P_IO_UART_TX_OUTPUT            IOSTA &= (~BIT2)
#define P_IO_UART_TX_INPUT             IOSTA |= (BIT2)
#endif
//MOTO_EN
#define P_MOTOR_EN                   RA3
#define P_MOTOR_EN_CLR               P_MOTOR_EN = 0
#define P_MOTOR_EN_SET               P_MOTOR_EN = 1
#define P_MOTOR_EN_OUTPUT            IOSTA &= (~BIT3)
#define P_MOTOR_EN_INPUT             IOSTA |= (BIT3)

//!MOTO_CHE
#define P_MOTOR_PLUGIN                   RA4
#define P_MOTOR_PLUGIN_CLR               P_MOTOR_PLUGIN = 0
#define P_MOTOR_PLUGIN_SET               P_MOTOR_PLUGIN = 1
#define P_MOTOR_PLUGIN_OUTPUT            IOSTA &= (~BIT4)
#define P_MOTOR_PLUGIN_INPUT             IOSTA |= (BIT4)


//!BOOST_EN
#define P_BOOST_EN                      RB1
#define BOOST_EN_CLR                  P_BOOST_EN = 0
#define BOOST_EN_SET                  P_BOOST_EN = 1
#define BOOST_EN_OUTPUT               IOSTB &= (~BIT1)
#define BOOST_EN_INPUT                IOSTB |= (BIT1)

//!5VREF
#define P_5V_REF                      RB5
#define P_5V_REF_CLR                  P_5V_REF = 0
#define P_5V_REF_SET                  P_5V_REF = 1
#define P_5V_REF_OUTPUT               IOSTB &= (~BIT5)
#define P_5V_REF_INPUT                IOSTB |= (BIT5)

//!7VREF
#define P_7V_REF                      RA0
#define P_7V_REF_CLR                  P_7V_REF = 0
#define P_7V_REF_SET                  P_7V_REF = 1
#define P_7V_REF_OUTPUT               IOSTA &= (~BIT0)
#define P_7V_REF_INPUT                IOSTA |= (BIT0)

//!9VREF
#define P_9V_REF                      RA1
#define P_9V_REF_CLR                  P_9V_REF = 0
#define P_9V_REF_SET                  P_9V_REF = 1
#define P_9V_REF_OUTPUT               IOSTA &= (~BIT1)
#define P_9V_REF_INPUT                IOSTA |= (BIT1)



//!RED LED
#define P_LED_R                      RB3
#define P_LED_R_CLR              P_LED_R = 0
#define P_LED_R_SET              P_LED_R = 1
#define P_LED_R_OUTPUT           IOSTB &= (~BIT3)
#define P_LED_R_INPUT            IOSTB |= (BIT3)
#define P_LED_R_OFF             P_LED_R_CLR
#define P_LED_R_ON              P_LED_R_SET

//!BLUE LED
#define P_LED_B                   RB2
#define P_LED_B_CLR              P_LED_B = 0
#define P_LED_B_SET              P_LED_B = 1
#define P_LED_B_OUTPUT           IOSTB &= (~BIT2)
#define P_LED_B_INPUT            IOSTB |= (BIT2)
#define P_LED_B_OFF             P_LED_B_CLR
#define P_LED_B_ON              P_LED_B_SET


//PIN9
#define P_KEY_POWER                     RB4
#define P_KEY_POWER_CLR             P_KEY_POWER = 0
#define P_KEY_POWER_SET             P_KEY_POWER = 1
#define P_KEY_POWER_OUTPUT          IOSTB &= (~BIT4)
#define P_KEY_POWER_INPUT           IOSTB |= (BIT4)



//!CHRG
#define P_CHRG_FULL                  RA6
#define P_CHRG_FULL_CLR              P_CHRG_FULL = 0
#define P_CHRG_FULL_SET              P_CHRG_FULL = 1
#define P_CHRG_FULL_OUTPUT          IOSTA &= (~BIT6)
#define P_CHRG_FULL_INPUT           IOSTA |= (BIT6)


//!VIN

#define P_VIN                  RA5
#define P_VIN_CLR              P_VIN = 0
#define P_VIN_SET              P_VIN = 1
#define P_VIN_OUTPUT          IOSTA &= (~BIT5)
#define P_VIN_INPUT           IOSTA |= (BIT5)



//AD_CH_I_R

//AD_CH_I_L
#define CONST_KAI_GAI    16  // // 8-- 128ms   16 --256
#define CONST_HE_GAI    255  //  4  sec


#define CONST_MS_CNT        4
#define CONST_RX_TIMER  (30*CONST_MS_CNT)

#define CONST_RX_TIMER_OUT  (10*CONST_MS_CNT)
#define CONST_DELAY_TIMER  16//(16*CONST_MS_CNT)

#define BREATH_LED_MODE
//#define USING_CHG_FULL

//#define CONST_PRE_CNT           32        // 32 <-- 22

//#define CONST_POWER_DN          0xFE
//#define CONST_POWER_DN_MAX      0xF0
//#define CONST_POWER_BALANCE     0x00
//#define CONST_POWER_UP          0x02

#define CONST_TIMER_5MS             13  // 400us/per
#define CONST_TIMER_2MS             5   // 400us/per

#define CONST_TIMER_34P8            147
#define CONST_LOSS_TIMER            5

#define CONST_DELAY_SLEEP_TIME      10
//#define CONST_DISP_ALL_TIMER        7//10//5
#define LED_DISP_TIME               10
#define DISP_TIMER                  1
#define DISP_SHORT_TIMER            6
#define DISP_LONG_TIMER             20
//#define CONST_UV_DISP_TIME          11

//#define MODE_STANDBY                0
//#define MODE_WORKING                1

//#define CONST_RATIO_CAHRGE          42          // <-- 44000/819 = 53.724
//#define CONST_RATIO_DISCAHRGE       48          // <-- 44000/819 = 53.724
//#define CONST_VREF_AD               462         // <-- 461.5

/*
#define CONST_AD_SET_UV             (1542+64)        // 3.14
#define CONST_AD_BAT_CAP_0          (1552+64)        // 3.16
#define CONST_AD_CLEAR_UV           (1695+64)        // 3.452
#define CONST_AD_BAT_CAP_100        (2052+64)        // 4.176
#define CONST_AD_BAT_FULL           (2057+64)        // 4.187
#define CONST_AD_1PER               5           // (2052 - 1552)/100
*/

#define CONST_PY                    0//(64)
#define CONST_AD_SET_UV             (1542+CONST_PY)        // 3.14
#define CONST_AD_BAT_CAP_0          (1552+CONST_PY)        // 3.16
#define CONST_AD_CLEAR_UV           (1695+CONST_PY)        // 3.452
#define CONST_AD_BAT_CAP_100        (2052+CONST_PY)        // 4.176
#define CONST_AD_BAT_FULL           (2057+CONST_PY)        // 4.187
#define CONST_AD_1PER               5           // (2052 - 1552)/100



#define CMD_INTERVALNUM                 (400)
#define CMD_QUEUE_SIZE                  (4)
#define CONST_SCS_START_TIMER           (625)           // 40ms
#define CONST_SCS_SEND_ONE_BIT_TIMER    (625)           // 40ms
#define CONST_INTERVAL_TIMER            (6250)          // 400ms
#define CONST_GAP_TIMER                 (4688)



#define CMD_FACTORY_SET         (0x04)          // 0000 0100  发命令给耳机恢复出厂设置
#define CMD_BT_POWER_ON         (0x0E)          // 0000 1110  BT POWER ON
#define CMD_BT_POWER_OFF        (0x10)          // 0001 0000  BT POWER OFF
#define CMD_IN_PAIRING_MODE     (0x12)          // 0001 0010  Enter Pairing Mode
#define CMD_IN_DUT_MODE         (0x20)          // 0010 0000  Enter DUT Mode




typedef struct
{
    unsigned char head;
    unsigned char tail;
} T_Buf_Info;

typedef enum _SMART_CHARGER_STATE
{
    SCS_IDLE,
    SCS_WAIT,
    SCS_START,
    SCS_SEND_DATA,
} SMART_CHARGER_STATE;


typedef   struct _BIN_CMD
{
    u8_t  status;           //
    u8_t  len;              //
    u8_t  recing_len;       //
} BIN_CMD_T;


#define  REC_INIT               0
#define  REC_SYN                1
#define  REC_CMD                2
#define  REC_LEN                3
#define  REC_DATA               4
#define  REC_BAT_VOL             5

#define  REC_CRC8               6

#define  GET_CMD_NORMAL         0
#define  GET_CMD_OK             1
#define  GET_CMD_FAIL           2






//#define KEY_EVENT_BASE_ADDR         0xA0

//#define MSG_NONE                  0x00
#define KEY_BREAK                   0x20     //
#define KEY_LONG_START              0x40     //
#define KEY_LONG                    0x80     //
#define KEY_LONG_BREAK              0x60     //important

#define K1                          0x01
#define K1_BREAK                    0x21
#define K1_LONG_START               0x41
#define K1_LONG                     0x81
#define K1_LONG_BREAK               0x61

// timer 8ms
//#define GPIO_KEY_SCAN_TIME            15   //20ms
#define GPIO_KEY_JTTER_TIME             2//30
#define GPIO_KEY_CP_TIME                200//1000
#define GPIO_KEY_CPH_TIME               20  //200  //

/*
typedef enum _GPIO_KEY_STATE
{
    GPIO_KEY_STATE_IDLE,
    GPIO_KEY_STATE_JITTER,
    GPIO_KEY_STATE_PRESS_DOWN,
    GPIO_KEY_STATE_SP,
    GPIO_KEY_STATE_CP,
    GPIO_KEY_STATE_CPR
} GPIO_KEY_STATE;
*/
typedef enum _GPIO_KEY_STATE
{
    GPIO_KEY_STATE_IDLE,
    GPIO_KEY_STATE_JITTER,
    GPIO_KEY_STATE_PRESS_DOWN,
    GPIO_KEY_STATE_CP

} GPIO_KEY_STATE;


typedef enum _KEY_EVENT
{
    MSG_NONE = 0x00,

    MSG_FAN_MODE = K1,                         // -- [0x01,0x1F]
    //TODO:

    MSG_MODE = K1_BREAK,             // -- [0x21,0x3F]
    MSG_LIGHT,
    //TODO:

    MSG_POWER_ON = K1_LONG_START,   // -- [0x41,0x5F]
    MSG_LIGHT_CPS,
    //TODO:

    KEY_POWER_LONG_BREAK = K1_LONG_BREAK,   // -- [0x61,0x7F]
    MSG_LIGHT_CPR,
    //TODO:

    KEY_POWER_LONG = K1_LONG,               // -- [0x81,0x5F]
    MSG_LIGHT_CPH,
    //TODO:

} KEY_EVENT;


#endif/* __HC_DEFINE_H__ */
