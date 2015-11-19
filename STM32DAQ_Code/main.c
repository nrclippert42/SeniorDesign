/*------------------------------------------------------------------------------------------------------
 * Name:    Intern_Project.c
 * Purpose: Collects data from the GPS and ISK01A1 expansion board sensors
 * 					and sends that data using an XBee to a reciever.
 * Date: 		7/14/15
 * Author:	Christopher Jordan - Denny
 *------------------------------------------------------------------------------------------------------
 * Note(s):
 *----------------------------------------------------------------------------------------------------*/
 
 /*-----------------------Include Statements----------------------------------------------------------*/
#include <stdio.h>											// Standard Input Output
#include <stdlib.h>											//Various useful conversion functions
#include "stm32l053xx.h"								// Specific Device Header
#include "Serial.h"											// Usart2 Communication
#include "GPIO.h"												// GPIO Drivers
#include "Timing.h"											// Clock Drivers
#include "ADC.h"												// ADC Drivers
#include "PWM.h"												// Servo Motor Control
#include "string.h"											// Various useful string manipulation functions

#define Green_LED  					5						// Green LED on board
/*-----------------------Functions--------------------------------------------------------------------*/
void IO_Init(void);

/**
  \fn          int main (void)
  \brief       Initializes all peripherals and continually fetch data
*/

int main (void){
	/*Initialize IO*/
	IO_Init();
	
	/*Run for all of time*/
	while(1){
		printf("ADC: %i\r\n",ADC_Pin(0));
		Delay(1000);
	}
}

/**
  \fn					void IO_Init(void)
	\brief			Initializes peripherals:
							*	System Clock
							*	GPIO
							*	USART2
							*	ADC
*/

void IO_Init(void){
	
	/* configure HSI as System Clock */
	SystemCoreClockInit();
  SystemCoreClockUpdate();
	SysTick_Config(SystemCoreClock / 1000);  // SysTick 1 msec interrupts
	
  /* Port initializations */
	GPIO_Output_Init(GPIOA,Green_LED);										//LD2 Initialization
	Button_Initialize();																	//User button init
	
	/* Serial Communications Initializations */
  SER_Initialize();
	
	/* ADC Initializations */
	ADC_Init();
}
