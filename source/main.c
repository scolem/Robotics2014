#include <xc.h>

#include "configBits.h"
#include "HardwareConfig.h"
#include "adc.h"
#include "gpio.h"
#include "pwm.h"
#include "timer.h"
#include "uart.h"

//Defined in uart.c
extern volatile char RXBuffer[];
extern char rx_write = 0;

volatile int rx_read = 0;

/*About the @0x15
 *
 * For TinyBootloader to work the code needs to be generated at the beginning
 * of the adress space. This is fine in MPLab and C18, which does this. However,
 * MPLabX and XC8 puts the code at the bottom of the adress space, causing the
 * bootloader to crash. The @0x15 forces the linker to place the function at the
 * indicated position. There are some other sections after it, and some before
 * it.
 *
 * The linker documentation says that -Ptext0=0x15 is a valid commandline
 * argument to do the same, but it gives an error.
 *
 * If the bootloader ever complains, check the adresses first
 */
int main(int argc, char** argv) @ 0x15
{
    char button0_flag = 0;
    char button1_flag = 0;
    char ledCounter = 0;

    int pwmValue = 0;

    //Setup the peripherals. always call this part first
    GPIO_Setup();
    Timer_Setup();
    UART_Setup();
    ADCSetup();
    rx_read = 0;
    rx_write=0;

    //Send a welcom message, also indicates the board is working
    UART_TX("Hello",5);
    

    //Turn the psm signals on.
    PWM1_enable(1);
    PWM1_TRIS = 0;

    PWM2_enable(1);
    PWM2_TRIS = 0;

    while(1)
    {
        // check if button0 was pressed
        if (BUT0 == 0)
        {
            if (button0_flag == 0) //Set a flag to prevent repeating
            {
                button0_flag=1;

                ledCounter+=1;
                pwmValue+=1;
                PWM1_level(300-pwmValue);
                PWM2_level(pwmValue);

                PORTD = (PORTD &0xf0) | (ledCounter &0x0f);
       //       PORTD = (PORTD &0xf0) | (led1 &0b00000001)  | (led2 &0b00000010) | ...;
       //       PORTD = (PORTD &0xf0) | (led1 &0x01) | (led2 &0b02) | (led3 &0b04) | (led4 &0b08);
            }
        }
        else
        {
            button0_flag = 0;
        }

        if (BUT1 == 0)
        {
            if (button1_flag == 0)
            {
                button1_flag =1;
                
                //Do some status transmissions
                UART_TX("ADC value is ",13);
                UART_TX_byte(ADC_sample(5)>>2);
                UART_TX_byte(NEWLINE);
                UART_TX("PWM value is ",13);
                UART_TX_byte(pwmValue);
                UART_TX_byte(NEWLINE);
                UART_TX("UART has received",17);
                while(rx_read != rx_write)
                {
                    UART_TX_byte(RXBuffer[rx_read]);
                    
                    rx_read++;
                    if (rx_read >=  RX_BUF_SIZE)
                        rx_read = 0;
                }
                UART_TX_byte(NEWLINE);

            }
        }
        else
        {
            button1_flag=0;
        }

        if (BUT0 == 0)
        {
             UART_TX_byte(ADC_sample(5)>>2);
        }
    }
}

void interrupt isr(void)
{
    //if (PIR1bits.TXIF == 1); //If the buffer is empty,1 else, it is 0. Cleared by writing

    //Uart Receive interrupt
    if (PIR1bits.RCIF == 1)
    {
        RX_Interrupt();
    }

    //Timer 2 interrupt
    if (PIR1bits.TMR2IF == 1)
    {
        Timer2_Interrupt();
    }
    
}



