#include <xc.h>
#include "gpio.h"

void GPIO_Setup();

/**
 * Configure GPIOS. All LEDS are outputs per default, buttons are inputs. All
 * the other pins are up to the user.
 */
void GPIO_Setup()
{
    //Set up LED Pins, and make them low
    TRISD = TRISD & 0xf0;
    PORTD = PORTD & 0xf0;

    // Set up buttons as inputs
    TRISD = TRISD | 0x30;
}