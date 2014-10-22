#include <xc.h>

#include "motorController.h"
#include "hardwareConfig.h"
#include "pwm.h"


/*
 * Was getting errors, so value between 0 and 300, not using thresh
 */


//value of pwm to start bot moving
int motor1thresh=10;
int motor2thresh=10;

void motorRforward(int value)
//value = pwm value between 0 and 100
{
    motorRfor=1;
    motorRrev=0;

  ////  float lev = 8.5;
  //  float lyv = 4.5;

  //  float g = lyv+lev;

 //   u = (short)(u*lev);
//    PWM1_level((short)(value*(300-motor1thresh)/100+motor1thresh));
    PWM1_level(value);
}

void motorRreverse(int value)
//value = pwm value between 0 and 100
{
    motorRfor=0;
    motorRrev=1;

  //  PWM1_level((int)value*(300.0-motor1thresh)/100.0+motor1thresh);
    PWM1_level(value);
}

void motorLforward(int value)
//value = pwm value between 0 and 100
{
    motorLfor=1;
    motorLrev=0;

 //   PWM2_level((int)value*(300-motor1thresh)/100.0+motor1thresh);
    PWM2_level(value);
}

void motorLreverse(int value)
//value = pwm value between 0 and 100
{
    motorLfor=0;
    motorLrev=1;

 //   PWM2_level((int)value*(300-motor1thresh)/100.0+motor1thresh);
    PWM2_level(value);
}
