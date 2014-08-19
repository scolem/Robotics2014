#include <xc.h>
#include "pwm.h"

void PWM1_enable(char enable);
void PWM2_enable(char enable);
void PWM1_level(int level);
void PWM2_level(int level);

/**
 * Enable PWM1. For the PWM to generate output the relevant pin's TRIS bit needs
 * to be cleared, eg. PWM1_TRIS = 0;
 *
 * @param enable 0 to disable, anything else to enable
 */
void PWM1_enable(char enable)
{
    if (enable == 0)
       CCP1CONbits.CCP1M = 0b0000;// Disable CCP module
    else
    {
        CCP1CONbits.CCP1M = 0b1100;// Set to PWM mode
    }
}

/**
 * Enable PWM1. For the PWM to generate output the relevant pin's TRIS bit needs
 * to be cleared, eg. PWM2_TRIS = 0;
 *
 * @param enable 0 to disable, anything else to enable
 */
void PWM2_enable(char enable)
{
    if (enable == 0)
        CCP2CONbits.CCP2M = 0b0000;// Disable CCP module
    else
        CCP2CONbits.CCP2M = 0b1100;// Set to PWM mode2
}

/**
 * Set the duty cycle of PWM1, between 0 and 300.
 *
 * @param level The duty cycle, between 0 and 300
 */
void PWM1_level(int level)
{
    CCP1CONbits.DC1B = level & 0x03;
    CCPR1L= level>>2;
}

/**
 * Set the duty cycle of PWM2, between 0 and 300.
 *
 * @param level The duty cycle, between 0 and 300
 */
void PWM2_level(int level)
{
    CCP2CONbits.DC2B = level & 0x03;
    CCPR2L= level>>2;
}
