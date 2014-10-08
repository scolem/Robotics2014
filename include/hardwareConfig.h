
#ifndef HARDWARECONFIG
#define HARDWARECONFIG
#define LED0 PORTDbits.RD0
#define LED1 PORTDbits.RD1
#define LED2 PORTDbits.RD2
#define LED3 PORTDbits.RD3

#define BUT0 PORTDbits.RD4
#define BUT1 PORTDbits.RD5

#define CLOCK_SPEED 48000000

#define PWM1_TRIS TRISCbits.RC2
#define PWM2_TRIS TRISCbits.RC1
#define PWM1_PIN PORTCbits.RC2
#define PWM2_PIN PORTCbits.RC1

#define MAX(a,b) (a > b ? a : b)
#define MIN(a,b) (a < b ? a : b)

//Our pin setup
#define motorRfor PORTAbits.RA0
#define motorRrev PORTAbits.RA1
#define motorLfor PORTAbits.RA2
#define motorLrev PORTAbits.RA3

/*
 * To turn right motor forward:
 * motorRfor=1;
 * motorRrev=0;
 *
 * To turn left motor reverse:
 * motorLfor=0;
 * motorLrev=1;
 */


#endif