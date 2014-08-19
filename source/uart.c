#include <xc.h>
#include "uart.h"
#include "hardwareConfig.h"

void UART_Setup();
void UART_TX(char buffer[], int bufLength);
void UART_TX_byte(char character);
void RX_Interrupt();

volatile char RXBuffer[RX_BUF_SIZE];
char rx_write = 0;

/* About the UART
 * These UART functions send and receive. Sending is easy, just transmit a
 * byte and wait for it to be done.
 *
 * Receiving happens spontaneously. When data is received, it is placed in the
 * RXBuffer, and rx_write is incremented. When the buffer is full, rx_write is
 * reset, and the buffer starts filling agin.
 *
 * Your code should check and read from the buffer regularly, otherwise data
 * might be overwritten. To read, keep another pointer. This pointer points
 * to the last place in the buffer that data was read from.
 */

/**
 * Configure the UART to run int 8 bit mode, at UARTSPEED
 */
void UART_Setup()
{
    /*
     * TXSTA1bits.CSRC  = 0;
     * TXSTA1bits.TX9   = 0;
     * TXSTA1bits.TXEN  = 1;
     * TXSTA1bits.SYNC  = 0;
     * TXSTA1bits.SENDB = 1;
     * TXSTA1bits.BRGH  = 0;
     * TXSTA1bits.TRMT  = 0;
     * TXSTA1bits.TX9D  = 0;
     */
    TXSTA1 = 0b00001000;
    /*
     * RCSTAbits.SPEN   = 1;
     * RCSTAbits.RX9    = 0;
     * RCSTAbits.SREN   = 0;
     * RCSTAbits.CREN   = 1;
     * RCSTAbits.ADDEN  = 0;
     * RCSTAbits.FERR   = 0;
     * RCSTAbits.OERR   = 0;
     * RCSTAbits.RX9D   = 0;
     */
    RCSTA = 0b10010000;
    INTCONbits.GIE  = 1;    //Enable Global interrupts
    INTCONbits.PEIE = 1;    //Enable peripheral interrupts
    RCONbits.IPEN   = 1;

    //These can be used to enable the transmit interrupts, and clear
    //the flags.
    //PIR1bits.TXIF   = 1;
    //PIE1bits.TXIE   = 1;
    
    //Clear the receive interrupt flag
    PIR1bits.RCIF   = 0;
    //Enable the receive interrupt
    PIE1bits.RCIE   = 1;

    BAUDCONbits.BRG16 = 1; //Set the baud rate generator to 16 bit mode.

    SPBRG = ((CLOCK_SPEED/UARTSPEED)/16)-1;

    //Finally, turn it on
    TXSTA1bits.TXEN  = 1;
}


/**
 * Transmits bufLength charaters from the buffer. 
 * This function blocks execution until transmission is done.
 * 
 * @param buffer
 * @param bufLength
 */
void UART_TX(char buffer[], int bufLength)
{
    int i = 0;
    
    for (i = 0; i<bufLength; i++)
    {
        UART_TX_byte(buffer[i]);
    }
}

/**
 * Transmits a single character. Blocks execution until done.
 * 
 * @param character
 */
void UART_TX_byte(char character)
{ 
    //Copy the data
    TXREG = character;

    while (TXSTAbits.TRMT == 0); //While the buffer is full
}


/**
 * This function is called when the UART receives a character. Do not call it
 * from the main code.
 */
void RX_Interrupt()
{
    //Place the received word in the buffer
    RXBuffer[rx_write] = RCREG;

    //Increment the pointer
    rx_write++;
    if (rx_write ==  RX_BUF_SIZE)
        rx_write = 0;
    
    //Clear the flag
    PIR1bits.RCIF = 0;
}
