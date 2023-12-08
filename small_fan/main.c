

#include <ny8.h>
#include "ny8_constant.h"
#include "app_cfg.h"

#define UPDATE_REG(x) __asm__("MOVR _" #x ",F")
#define PY (1)
#define CONST_dispTimerBatLow (11)

volatile unsigned char vFlag_0;
__sbit bFlag_motor_open = vFlag_0 : 0;
__sbit bFlag_motor_plugin = vFlag_0 : 1;
__sbit bFlag_Timeslice_500ms = vFlag_0 : 2;
__sbit bFlag_Timeslice_1Sec = vFlag_0 : 3;
__sbit bFlag_Vin_Plug_In = vFlag_0 : 4;
__sbit bFlag_gSysTick_Change = vFlag_0 : 5;
__sbit bFlag_charge_complete = vFlag_0 : 6;
__sbit bFlag_Power_On = vFlag_0 : 7;

volatile unsigned char vFlag_1;
__sbit bFlag_is_breathing_mode = vFlag_1 : 0;
__sbit bFlag_inc_or_dec = vFlag_1 : 1;
__sbit bFlag_bat_low = vFlag_1 : 2;
__sbit bFlag_bat_shut_down = vFlag_1 : 3;
// __sbit bFlag_lowpower_mode = vFlag_1 : 4;
__sbit KeyIndex = vFlag_1 : 5;

volatile unsigned char moto_work_mode;
// volatile unsigned char always_light_timer;
volatile unsigned char displayData;
volatile unsigned char dispTimerForce;
volatile unsigned char dispTimerBatLow;
volatile unsigned char timer_slice_16ms;
volatile unsigned char delaySleepTime;
volatile unsigned char gpioKeyWaitTimer;

GPIO_KEY_STATE GpioKeyState;

#ifdef BREATH_LED_MODE
volatile unsigned char respiration_lamp_timer;
#endif

volatile unsigned char gSysTick;

#define CONST_RESPIRATION_LAMP_SERIES 80

const unsigned char RESPIRATION_LAMP_TABLE[] =
    {
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        5,
        5,
        5,
        6,
        6,
        6,
        7,
        7,
        8,
        9,
        9,
        10,
        11,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        20,
        21,
        23,
        24,
        26,
        28,
        30,
        32,
        34,
        37,
        39,
        42,
        45,
        48,
        52,
        56,
        60,
        64,
        68,
        73,
        79,
        84,
        90,
        97,
        104,
        111,
        119,
        128,
        137,
        147,
        157,
        168,
        180,
        193,
        207,
        222,
        238,
        255,
        255};

void isr(void) __interrupt(0) // 64us
{
    static unsigned char timerCnt;
    static unsigned char led_lamp;
    static unsigned char respiration_lamp_series;

    if (TM0IF)
    {
        TM0IF = 0;
        // TMR0 = 0;//125 138;//0x0F;  34.8us

        // if (SmartChargerWaitTimerLeft)
        //     SmartChargerWaitTimerLeft--;

        timerCnt++;

        if (!(timerCnt & 0x01))
        {
            bFlag_gSysTick_Change = 1; // 128us
        }

        // if(!timerCnt)
        {
            if (bFlag_is_breathing_mode) // 100us
            {
                respiration_lamp_timer++;

                if (!(respiration_lamp_timer))
                {
                    if (bFlag_inc_or_dec)
                    {
                        if (!(--respiration_lamp_series))
                        {
                            bFlag_inc_or_dec = 0;
                            // bFlag_disable_key = 0;

                            // if (0 == dispTimerForce)
                            // {
                            //     bFlag_is_breathing_mode = 0;
                            //     // always_light_timer_shadow = 0;
                            // }
                            // else
                            // {
                            // dispTimerForce--;
                            // always_light_timer = always_light_timer_shadow;
                            // }
                        }
                    }
                    else
                    {
                        if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
                        {
                            respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;

                            // if (!always_light_timer)
                            // {
                            bFlag_inc_or_dec = 1;
                            // }
                        }
                    }

                    led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
                }

                if (respiration_lamp_timer >= led_lamp)
                {
                    P_LED_B_OFF;
                    // P_LED_G_OFF;
                    // P_LED_B_OFF;    //white led
                }
                else
                {
                    P_LED_B_ON;
#if 0

                    // if(0x03 == indicator_light_mode)
                    // {
                    //     P_LED_B_ON;  //white
                    // }
                    // else  if(0x0F == indicator_light_mode)
                    // {
                    //     P_LED_G_ON;  //green
                    // }
                    // else //if(0x01 == indicator_light_mode)
                    // {
                    //     P_LED_R_ON; //orange
                    // }

#endif
                }
            }
        }
    }

    // if(INTFbits.PABIF)
    //{
    // INTFbits.PABIF = 0;                 // Clear PABIF(PortB input change interrupt flag bit)
    // }
    if (INTFbits.LVDIF)
    {
        INTFbits.LVDIF = 0;
    }
}
#ifdef BREATH_LED_MODE
void enable_breathing_mode(void)
{

    // if (0 == bFlag_is_breathing_mode)
    {
        bFlag_is_breathing_mode = 1;
        // always_light_timer = always_light_timer_shadow;
    }
    // else
    // {
    // always_light_timer = 0;
    // dispTimerForce = 1;
    // }
}

void disable_breathing_mode(void)
{
    bFlag_Vin_Plug_In = 0;
    bFlag_charge_complete = 1;
    // if (1 == bFlag_is_breathing_mode)
    {
        bFlag_is_breathing_mode = 0;
        // always_light_timer = always_light_timer_shadow;
        P_LED_B_CLR;
    }
    // else
    // {
    // always_light_timer = 0;
    // dispTimerForce = 1;
    // }
}
#endif
void motor_open(void)
{
    bFlag_motor_open = 1;
    delaySleepTime = CONST_DELAY_SLEEP_TIME;
    P_MOTOR_EN_SET;
    P_MOTOR_EN_OUTPUT;
    BOOST_EN_SET;
    BOOST_EN_OUTPUT;
    switch (moto_work_mode)
    {
    case 1:
        P_7V_REF_INPUT;
        P_9V_REF_INPUT;
        P_5V_REF_CLR;
        P_5V_REF_OUTPUT;

        P_LED_B_OFF;
        P_LED_R_ON;
        dispTimerForce = (2 + PY);
        disable_breathing_mode();
        break;
    case 2:
        P_5V_REF_INPUT;
        P_9V_REF_INPUT;
        P_7V_REF_CLR;
        P_7V_REF_OUTPUT;

        P_LED_B_OFF;
        P_LED_R_ON;
        dispTimerForce = (4 + PY);
        disable_breathing_mode();
        break;
    case 3:
        P_5V_REF_INPUT;
        P_7V_REF_INPUT;
        P_9V_REF_CLR;
        P_9V_REF_OUTPUT;

        P_LED_B_OFF;
        P_LED_R_ON;
        dispTimerForce = (6 + PY);
        disable_breathing_mode();
        break;
    default:
        P_7V_REF_INPUT;
        P_9V_REF_INPUT;
        P_5V_REF_CLR;
        P_5V_REF_OUTPUT;

        P_LED_B_OFF;
        P_LED_R_ON;
        moto_work_mode = 1;
        dispTimerForce = (2 + PY);
        disable_breathing_mode();
        break;
    }
}
void motor_close(void)
{
    P_MOTOR_EN_CLR;
    P_MOTOR_EN_OUTPUT;
    BOOST_EN_CLR;
    BOOST_EN_OUTPUT;
    P_5V_REF_INPUT;
    P_7V_REF_INPUT;
    P_9V_REF_INPUT;
    bFlag_motor_open = 0;
}

#ifdef USING_IO_UART
void io_uart_tx(unsigned char sendByte)
{

    unsigned char bCount;

    DISI();           // GIE = 0;
    P_IO_UART_TX_CLR; //输出高
    P_IO_UART_TX_OUTPUT;
    bCount = 8;
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();

    while (bCount)
    {
        if (sendByte & 0x01)
        {
            P_IO_UART_TX_SET; //输出高
            NOP();
            NOP();
        }
        else
        {
            P_IO_UART_TX_CLR; //输出低
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
        }
        bCount--;
        sendByte >>= 1;
    }

    NOP();
    P_IO_UART_TX_SET; //输出高
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    ENI(); // GIE = 1;
}
#endif
// bms
KEY_EVENT gpioKeyScan(void)
{
    P_KEY_POWER_INPUT;
    if (gpioKeyWaitTimer)
        gpioKeyWaitTimer--;

    KeyIndex = 0;

    if (P_KEY_POWER)
    {
        KeyIndex = 1;
    }

    switch (GpioKeyState)
    {
    case GPIO_KEY_STATE_IDLE:
        if (KeyIndex)
        {
            // bFlag_wakeup_4sleep = 0;
            return MSG_NONE;
        }

        // PreKeyIndex = KeyIndex;
        // timer_set(&gpioKeyWaitTimer, GPIO_KEY_JTTER_TIME);
        gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
        // DBG(("GOTO JITTER!\n"));
        GpioKeyState = GPIO_KEY_STATE_JITTER;

    case GPIO_KEY_STATE_JITTER:
        if (KeyIndex) // if(PreKeyIndex != KeyIndex)
        {
            // DBG(("GOTO IDLE Because jitter!\n"));
            GpioKeyState = GPIO_KEY_STATE_IDLE;
        }
        // else if(timer_expired(&gpioKeyWaitTimer))
        else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
        {
            // DBG(("GOTO PRESS_DOWN!\n"));
            // P_KEY_OUT = 0;
            // UARTSendDataByte(0xA1);
            // timer_set(&gpioKeyWaitTimer, GPIO_KEY_CP_TIME);
            gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
            GpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
            // return MSG_NONE;//GpioKeyEvent[PreKeyIndex][0];//PDS(鎸夐敭寮濮?
        }

        break;

    case GPIO_KEY_STATE_PRESS_DOWN:
        if (KeyIndex) // if(PreKeyIndex != KeyIndex)
        {
            // short key
            //  DBG(("ADC KEY SP!*****\n"));
            GpioKeyState = GPIO_KEY_STATE_IDLE;

            //! test if (bFlag_motor_plugin)
            if (0 == bFlag_bat_shut_down)
            {
                if (0 == bFlag_motor_open)
                {
                    motor_open();
                }
                else
                {
                    switch (moto_work_mode)
                    {
                    case 1:
                        moto_work_mode = 2;
                        P_5V_REF_INPUT;
                        P_9V_REF_INPUT;
                        P_7V_REF_CLR;
                        P_7V_REF_OUTPUT;
                        dispTimerForce = (4 + PY);
                        disable_breathing_mode();
                        break;
                    case 2:
                        moto_work_mode = 3;
                        P_5V_REF_INPUT;
                        P_7V_REF_INPUT;
                        P_9V_REF_CLR;
                        P_9V_REF_OUTPUT;
                        dispTimerForce = (6 + PY);
                        disable_breathing_mode();
                        break;
                    case 3:

                        moto_work_mode = 1;
                        P_7V_REF_INPUT;
                        P_9V_REF_INPUT;
                        P_5V_REF_CLR;
                        P_5V_REF_OUTPUT;
                        dispTimerForce = (2 + PY);
                        disable_breathing_mode();
                        break;
                    default:
                        moto_work_mode = 1;
                        P_7V_REF_INPUT;
                        P_9V_REF_INPUT;
                        P_5V_REF_CLR;
                        P_5V_REF_OUTPUT;
                        dispTimerForce = (2 + PY);
                        disable_breathing_mode();
                        break;
                    }
                }
            }

            return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
        }
        // else if(timer_expired(&gpioKeyWaitTimer))
        else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
        {

            // long key press

            // DBG(("ADC KEY CP!********\n"));
            // timer_set(&gpioKeyWaitTimer, GPIO_KEY_CPH_TIME);
            // tune up gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;//gSysTick_current;
            GpioKeyState = GPIO_KEY_STATE_CP;
            // bFlag_send_cmd_left = 1;
            // bFlag_enable_get_0x1bcmd = 1;
            // indicator_light_mode = 3; // 白灯
            // always_light_timer_shadow = 0;
            // enable_breathing_mode();
            // dispTimerForce = 10; // 强制显示
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            //! close motor
            //! test if (bFlag_motor_plugin)
            {
                motor_close();
            }
            return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
        }

        break;

    case GPIO_KEY_STATE_CP:
        if (KeyIndex) // if(PreKeyIndex != KeyIndex)
        {
            // DBG(("ADC KEY CPR!*************\n"));
            // UARTSendDataByte(0xA4);
            // P_LED_R_OFF;
            GpioKeyState = GPIO_KEY_STATE_IDLE;
            // return MSG_NONE;//GpioKeyEvent[PreKeyIndex][4]; //CPR
        }

        // else if(timer_expired(&gpioKeyWaitTimer))
        // tune up
        /*else if(!gpioKeyWaitTimer)//if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CPH_TIME)
        {
            //DBG(("ADC KEY CPH!*************\n"));
            //timer_set(&gpioKeyWaitTimer, GPIO_KEY_CPH_TIME);
            gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;//gSysTick_current;
            return MSG_NONE;//GpioKeyEvent[PreKeyIndex][3]; // CPH
        }*/

        break;

    default:
        GpioKeyState = GPIO_KEY_STATE_IDLE;
        break;
    }

    return MSG_NONE;
}

// KAIGAI -- H
// HE GAI  -- L
#define CONST_PLUGIN_FILTER (8)
void get_motor_in_status(void)
{
    static unsigned char counter;

    P_MOTOR_PLUGIN_INPUT;

    if (bFlag_motor_plugin)
    {
        if (!P_MOTOR_PLUGIN)
        {
            if (++counter > CONST_PLUGIN_FILTER)
            {
                bFlag_motor_plugin = 0;
                motor_close();
            }
        }
        else
        {
            counter = 0;
        }
    }
    else
    {
        if (P_MOTOR_PLUGIN)
        {
            if (++counter > CONST_PLUGIN_FILTER)
            {
                bFlag_motor_plugin = 1; // kaigai
            }
        }
        else
        {
            counter = 0;
        }
    }
}

// bms
#define CONST_VIN_FILTER (31)

void get_vin_status(void)
{
    static unsigned char counter;

    P_VIN_INPUT;

    if (bFlag_Vin_Plug_In)
    {
        if (!(P_VIN))
        {
            if (++counter > CONST_VIN_FILTER)
            {
                bFlag_Vin_Plug_In = 0;
                // always_light_timer = 0;
                disable_breathing_mode();
            }
        }
        else
        {
            counter = 0;
        }
    }
    else
    {
        if (P_VIN)
        {
            if (++counter > CONST_VIN_FILTER)
            {
                bFlag_Vin_Plug_In = 1; //
                // delaySleepTime = CONST_DELAY_SLEEP_TIME;
                // enable_breathing_mode();
            }
        }
        else
        {
            counter = 0;
        }
    }
}
// #define CONST_FULL_FILTER (128)
void get_chrg_status(void)
{
    static unsigned char counter;

    P_CHRG_FULL_INPUT;

    if (0 == bFlag_charge_complete)
    {
        if (P_CHRG_FULL)
        {
            if (++counter > 128)
            {
                bFlag_charge_complete = 1;
                // always_light_timer = 0;
                disable_breathing_mode();
                P_LED_B_ON;
            }
        }
        else
        {
            counter = 0;
        }
    }
    else
    {
        if (!(P_CHRG_FULL))
        {
            if (++counter > 63)
            {
                bFlag_charge_complete = 0; //
                delaySleepTime = CONST_DELAY_SLEEP_TIME;
                enable_breathing_mode();
            }
        }
        else
        {
            counter = 0;
        }
    }
}
// #define CONST_BTA_LOW (0x0B)
// #define CONST_BTA_SHUT_DOWN (0x09)
void get_lvd_voltage(void)
{
    // unsigned char reg_054e;
    static unsigned char counter;
    static unsigned char counter2;
    if (bFlag_Vin_Plug_In)
    {
        counter = 0;
        counter2 = 0;
        bFlag_bat_low = 0;
        bFlag_bat_shut_down = 0;
        dispTimerBatLow = 0;
        PCON1 &= 0xC3;
        PCON1 |= C_LVD_3P45V;
        return;
    }

    if (0 == bFlag_bat_low)
    {

        // if (bFlag_lowpower_mode)
        if (!(PCON1 & C_LVDOUT))
        {
            RA2 = 0;
            counter++;
            if (counter > 31)
            {
                bFlag_bat_low = 1;
                // bFlag_lowpower_mode = 0;
                PCON1 &= 0xC3;
                PCON1 |= C_LVD_3P15V;
                if (dispTimerForce)
                {
                    dispTimerBatLow = dispTimerForce; //和挡位同步闪烁
                }
                else
                {
                    dispTimerBatLow = CONST_dispTimerBatLow;
                }
            }
        }
        else
        {
            counter = 0;
            RA2 = 1;
        }
    }
    else
    {
        if (0 == bFlag_bat_shut_down)
        {
            // if (bFlag_lowpower_mode)
            if (!(PCON1 & C_LVDOUT))
            {
                RA2 = 0;
                counter2++;
                if (counter2 > 31)
                {
                    bFlag_bat_shut_down = 1;
                    // bFlag_lowpower_mode = 0;
                    motor_close();
                }
            }
            else
            {
                counter2 = 0;
                RA2 = 1;
            }
        }
    }
}

void main(void)
{
    DISI();

    APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
    BPHCON = 0xEF; //! PB5--PB0 ,only pb4 have pullhigh

    PORTA = 0x00;
    PORTB = 0x00;

    // IOSTA = 0xF7; // PA5 Input <-- Set PA5 to open drain output
    // IOSTB = 0xF1; // PB5 output PB4 Input
    IOSTA = 0x73; // PA5 Input <-- Set PA5 to open drain output
    IOSTB = 0xF0; // PB5 output PB4 Input

    // BODCON = 0x00; // PB4 open-drain
    //  init_Timer0();
    // PCON1 = 0x00; // Disable Timer0

    CMPCR = C_RBias_High_Dis | C_RBias_Low_Dis | C_CMPFINV_Dis | 0x0A; // initial SFR CMPCR (CMPF_INV=0) measure LVD_L
    PCON1 &= 0xC3;
    PCON1 |= C_LVD_3P45V; // Set LVDS[3:0]=0101b (2.8V) , Timer0 disable
    PCONbits.LVDEN = 1;   // Enable low-voltage detector
    // TMR0 = CONST_TIMER_34P8;                                       // Load 0x00 to TMR0 (Initial Timer0 register)
    // T0MD = 0x00;
    T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
    // T0MD = 0x08;  //4M,2T  125us
    // T0MD = 0x00;                                    // 4M,2T// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:2,clock source is instruction clock
    // T0MD = 0x08;//C_PS0_WDT     2M,2T             // Prescaler0 is assigned to WDT, Prescaler0 dividing rate = 1:2 (WDT select interrupt)
    // init_cmdQueueArray();
    // io_uart_rx.CNT = 2;
    // UART_INIT();
    // GpioKeyInit();
    // Setting Interrupt Enable Register
    INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
    INTF = 0;
    // Initial Power control register
    PCON = 0xFC; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
    // PCONbits.LVDEN = 1;  // Enable low-voltage detector
    //;Enable Timer0 & Global interrupt bit
    PCON1 |= C_TMR0_En; // Enable Timer0

    ENI();

    delaySleepTime = CONST_DELAY_SLEEP_TIME;
    bFlag_Power_On = 1;
    // bFlag_is_breathing_mode = 1;
    moto_work_mode = 1;

    while (TRUE)
    {
        CLRWDT(); // Clear WatchDog

        // sendCmdProc();

        if (bFlag_gSysTick_Change) // 128us
        {
            bFlag_gSysTick_Change = 0;

            gSysTick++;

            if (!(gSysTick & 0x7F)) // 16ms
            {
                // if (PCON1 & C_LVDOUT)
                // {
                //     bFlag_lowpower_mode = 0;
                //     RA2 = 1;
                // }
                // else
                // {
                //     bFlag_lowpower_mode = 1;
                //     RA2 = 0;
                // }

                // P_RA3 ^= 0x01;
                //! test get_motor_in_status();
                if (0 == dispTimerForce)
                {
                    get_vin_status();
                    if (bFlag_Vin_Plug_In)
                    {
                        get_chrg_status();
                    }
                }

                gpioKeyScan();

                timer_slice_16ms++;
#ifdef USING_IO_UART
                if (timer_slice_16ms & 0x01)
                {
                    io_uart_tx(0x55);
                }
                else
                {
                    io_uart_tx(0xAA);
                }
#endif
                if (!(timer_slice_16ms & 0x0F))
                {
                    // bFlag_Timeslice_500ms = 1;
                    get_lvd_voltage();
                }

                if (!(timer_slice_16ms & 0x1F))
                {
                    bFlag_Timeslice_500ms = 1;
                }
            }

            if (bFlag_Timeslice_500ms)
            {
                bFlag_Timeslice_500ms = 0;
                // io_uart_tx(0x55);
                // io_uart_tx(0x5A);
                // io_uart_tx(0xA5);
                // io_uart_tx(0xAA);

                // get_lvd_voltage();

                // if (always_light_timer)
                // {
                //     always_light_timer--;
                // }

                if (dispTimerForce)
                {
                    dispTimerForce--;
                    if (dispTimerForce & BIT0)
                    {
                        P_LED_R_OFF;
                        P_LED_B_ON;
                    }
                    else
                    {
                        P_LED_B_OFF;
                    }
                }
                else
                {
                    P_LED_R_OFF;
                }

                if (dispTimerBatLow)
                {
                    dispTimerBatLow--;
                    if (dispTimerBatLow & BIT0)
                    {
                        P_LED_R_ON;
                        P_LED_R_OUTPUT;
                    }
                    else
                    {
                        P_LED_R_OFF;
                        P_LED_R_OUTPUT;
                    }
                    if (0 == dispTimerBatLow)
                    {
                        if (bFlag_bat_low)
                        {
                            dispTimerBatLow = (CONST_dispTimerBatLow - 1);
                        }
                    }
                }

#if 1

                if ((0 == bFlag_Vin_Plug_In) && (0 == bFlag_motor_open) /*&& (bFlag_OCP2_CC)*/)
                {
                    if (!delaySleepTime)
                    {
                        // RB2 RA1 --> wake up
                        DISI();
                        INTE = 0x00; // Timer0 overflow interrupt enable bit
                        PCON = 0x78; //! PA4 PA5 上拉disable
                                     // BPHCON = (unsigned char)~C_PB1_PHB;     // Enable PB1 Pull-High resistor
                                     // BWUCON = C_PB1_Wakeup;                    // Enable PB1 input change wakeup function
                                     // IOSTB  = C_PB1_Input;                 // Set PB1 to input mode,others set to output mode
                                     // PORTB  = 0;                               // PORTB data buffer=0x00
                                     // init_gpio();
                        // APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
                        // BPHCON = 0xEF;
                        PORTA = 0x00;
                        PORTB = 0x00;

                        IOSTA = 0x73; // PA5 Input <-- Set PA5 to open drain output
                        IOSTB = 0xF0; // PB5 output PB4 Input
                        // APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
                        // BPHCON = 0xEF;
                        BODCON = 0x00; // PB4 open-drain
                        P_LED_R_OFF;
                        // P_LED_G_OFF;
                        P_LED_B_OFF;
                        AWUCON = (C_PA6_Wakeup | C_PA5_Wakeup); // | C_PA0_Wakeup
                        BWUCON = C_PB4_Wakeup;
                        // Initial Interrupt Setting
                        INTE = C_INT_PABKey; // Enable PortB input change interrupt
                        INTF = 0;
                        // ADMD  =   C_ADC_CH_Dis | C_Quarter_VDD ;
                        // ADMDbits.GCHS = 0;                              // disable global ADC channel    (SFR "ADMD")
                        //                        bFlag_display_always = 0;
                        //                        bFlag_display_flash = 0;
                        //                        bFlag_display_flash_green = 0;
                        if (!P_KEY_POWER)
                        {
                            goto skip_sleep;
                        }
                        UPDATE_REG(PORTB);
                        UPDATE_REG(PORTA);
                        NOP();
                        SLEEP();
                        NOP();
                    skip_sleep:
                        INTFbits.PABIF = 0;
                        // INTFbits.PAIF = 0;
                        // OSCCR = C_Standby_Mode | C_FHOSC_Sel;
                        //-------------------------------休眠-----------------------------------//
                        delaySleepTime = CONST_DELAY_SLEEP_TIME;
                        // if(!P_KEY_POWER)
                        //{
                        // dispTimer = LED_DISP_TIME;
                        // }
                        //! FUCK PCON = 0x98;
                        CMPCR = C_RBias_High_Dis | C_RBias_Low_Dis | C_CMPFINV_Dis | 0x0A; // initial SFR CMPCR (CMPF_INV=0) measure LVD_L
                        PCON = 0xFC;
                        // PCONbits.LVDEN = 1;
                        PCON1 &= 0xC3;
                        if (bFlag_bat_low)
                        {
                            PCON1 |= C_LVD_3P15V;
                        }
                        else
                        {
                            PCON1 |= C_LVD_3P45V; // Set LVDS[3:0]=0101b (2.8V) , Timer0 disable
                        }
                        PCON1 |= C_TMR0_En;            // Enable Timer0
                        INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
                        ENI();
                    }
                    else
                    {
                        delaySleepTime--;
                    }
                }

#endif
            }
        }
    }
}
