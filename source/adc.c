#include <xc.h>
#include "adc.h"
#include "timer.h"

void ADCSetup();
int ADC_sample(char channel);
/**
 * Configure the ADC
 */
void ADCSetup()
{
    ADCON0bits.CHS = 0b000; //Set to channel 0

    ADCON1bits.VCFG1 = 0; //Voltage reference is Vss
    ADCON1bits.VCFG0 = 0; //Voltage reference is VDD
    ADCON1bits.PCFG = 0b1010; //Channels 0 to 5 are analog

    ADCON2bits.ADFM = 1; //Results are right justified
    ADCON2bits.ACQT = 0b101; //12 TAD per aquisition
    ADCON2bits.ADCS = 0b110; //Clock derived from Fosc/64

    //Set up the ports as inputs
    TRISA = TRISA | 0x2f;
    TRISE = TRISE | 0x01;

    ADCON0bits.ADON = 1; //Turn on
   
}

/**
 * Sample from one of the adc channels. Because the channel needs to change,
 * This function delays one millisecond. This can be removed, and replaced with
 * delay loop, to make sampling much faster.
 *
 * @param channel Number between 0 and 5, indicating which pin to sample from
 * @return A 10-bit int, the number that was sampled.
 */
int ADC_sample(char channel)
{
    //Set up the required channel
    ADCON0bits.CHS = channel & 0b111;
    delay_Millis(0);

    //Start sampling
    ADCON0bits.GO = 1;
    
    //Wait for the conversion
    while(ADCON0bits.GO == 1);

    return (ADRESH <<8 | ADRESL);
    //There should be at least 3 TAD before the next aquisition starts
}