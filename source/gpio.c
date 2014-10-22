#include <xc.h>
#include "gpio.h"

void GPIO_Setup();

/**
 * Configure GPIOS. All LEDS are outputs per default, buttons are inputs. All
 * the other pins are up to the user.
 */

//1=input, 0=output
void GPIO_Setup()
{
    //Set up LED Pins, and make them low
    TRISD = TRISD & 0xf0;
    PORTD = PORTD & 0xf0;

    // Set up buttons as inputs
    TRISD = TRISD | 0xf0;

    TRISB = 0xff;//set PORTB as inputs (line sensor)

//    TRISA = 0x00;//set RA0 to RA3 as outputs (motor contoller)
//    ADCON1= 0xFF;//set to digital
//    CMCON=0x07;

    TRISC = TRISC&0xfe;
    TRISA = TRISA&0xef;
    TRISE = TRISE&0xf9;
}
