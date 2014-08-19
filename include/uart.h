#ifndef UART_H
#define UART_H

//#defines
#define UARTSPEED 115200
#define RX_BUF_SIZE 128
#define NEWLINE 0x0A

// functions prototypes
void UART_Setup();
void UART_TX(char buffer[], int bufLength);
void UART_TX_byte(char character);
void RX_Interrupt();

#endif
