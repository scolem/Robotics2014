#include <xc.h>

#include "configBits.h"
#include "HardwareConfig.h"
#include "adc.h"
#include "gpio.h"
#include "pwm.h"
#include "timer.h"
#include "uart.h"
#include "motorController.h"


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
        //directly show inputs on leds
        LED0=PORTBbits.RB0;
        LED1=PORTBbits.RB1;
        LED2=PORTBbits.RB2;
        LED3=PORTBbits.RB3;

        //can still refine values with tests.
        //Don't make values very low, need to still figure out lowest pwm value to get moving
        switch(PORTB)
        {
            case(0x80): case(0xC0):
                //1000 0000; 1100 0000
                motorRforward(300);
                motorLforward(160);
                break;

            case(0x40): case(0x60): case(0xE0):
                //0100 0000; 0110 0000; 1110 0000
                motorRforward(280);
                motorLforward(180);
                break;

            case(0x20): case(0x30): case(0x70):
                //0010 0000; 0011 0000; 0111 0000
                motorRforward(260);
                motorLforward(200);
                break;

            case(0x10): case(0x18): case(0x38):
                //0001 0000; 0001 1000; 0011 1000
                motorRforward(240);
                motorLforward(220);
                break;

            case(0x08): case(0x0C): case(0x1C):
                //0000 1000; 0000 1100; 0001 1100
                motorRforward(220);
                motorLforward(240);
                break;

            case(0x04): case(0x06): case(0x0E):
                //0000 0100; 0000 0110; 0000 1110
                motorRforward(200);
                motorLforward(260);
                break;

            case(0x02): case(0x03): case(0x07):
                //0000 0010; 0000 0011; 0000 0111
                motorRforward(180);
                motorLforward(280);
                break;

            case(0x01):
                //0000 0001
                motorRforward(160);
                motorLforward(300);
                break;

            default:
                //could count number of 1 and 0 bits to see which side more likely ()
                //maybe have variable that keeps side of line for when it loses line
                //or just turn in circle when lost line
                motorRforward(0);
                motorLforward(0);
                break;
        }

        // check if button0 was pressed
        if (BUT0 == 0)
        {
            if (button0_flag == 0) //Set a flag to prevent repeating
            {
                button0_flag=1;
                pwmValue+=10;
                PWM1_level(300-pwmValue);
                PWM2_level(pwmValue);
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

                UART_TX_byte(PORTB);
                UART_TX_byte(NEWLINE);

                char temp=PORTB&0x0f;//only want to work with bits 0 -> 4

                //line =1, off line=0
                //bit3=left, bit0=right
                switch(temp)
                {
                    case(0x08):UART_TX("Hard right",10);break;      //1000
                    case(0x0C):UART_TX("Right",5);break;            //1100
                    case(0x04):UART_TX("Nudge right",11);break;     //0100
                    case(0x06):UART_TX("Straight",8);break;         //0110
                    case(0x02):UART_TX("Nudge left",10);break;      //0010
                    case(0x03):UART_TX("Left",4);break;             //0011
                    case(0x01):UART_TX("Hard left",9);break;        //0001
                    case(0x0f):UART_TX("Intersection",12);break;    //1111
                    case(0x00):UART_TX("Lost line",9);break;        //0000
                    default:UART_TX("none",4);UART_TX_byte(temp);break;
                }

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



