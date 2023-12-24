/*
 * Final Project - Temperature Sensor Data Logger 
 * Author: Yu Sheng Chan
 * Date: 12/1/2023
 * Description: The code used the generated MCC pinheader file that's found under 
 *              MCC Generated Files -> pin_manager.h
 *              The pin header is then initialized accordingly 
 *              UART is enabled and configured under the MCC generator 
 *                           
 *              There are three tasks, Serial, ADC and Button
 *              
 *              taskSerial is used to send / receive data to / from GUI via UART
 *              There are 3 tasks running on taskSerial
 *              First task is used to purely send the data to the GUI
 *              Second task is used to receive data from the GUI and process the data
 *              Third task is used purely on blinking LED for 1 second
 * 
 *              taskADC is used to sample the ADC data and convert it to raw ADC and voltage / temperature
 *              The averaging algorithm of the temperature is done on another task 
 * 
 *              taskButton is used to check the state of the LED 
 *              
 *              All the data is accessed via a queue. Where it all sends via a string 
 *              The queue is accessed via extern on taskSerial.c, and it will send whenever data 
 *              is available. The queue will be checked every 100ms to see if there's new data. 
 */

/**
  Section: Included Files
*/
#include <stddef.h>      // Defines NULL
#include <stdbool.h>     // Defines true
#include <stdlib.h>      // Defines EXIT_FAILURE

#include "FreeRTOS.h"
#include "croutine.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>
#include "FreeRTOSConfig.h"

#include "board.h"
#include <taskSerial.h>
#include "taskADC.h"
#include "rgb_led.h"

/* Only one co-routine is created so the index is not significant. */
#define crfFLASH_INDEX             (0)

/* The number of flash co-routines to create. */
#define mainNUM_FLASH_COROUTINES   (1)

static void taskHeartbeat_Init(unsigned portBASE_TYPE uxPriority);
static void taskHeartbeat_Execute(void);
static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex);

RgbLed_st led_instance;

int main(void)
{
    //Initialize the device
    SYSTEM_Initialize();
    IO_RB7_SetDigitalInput();
    rgb_led_init(&led_instance);

    //Application Task initialization
    taskADC_init();
    taskADC_start();
    taskSerial_init();
    taskButton_init();
    taskButton_start();
    
    
    //FreeRTOS scheduler
    vTaskStartScheduler();
    /* If all is well then this line will never be reached.  If it is reached
    then it is likely that there was insufficient (FreeRTOS) heap memory space
    to create the idle task.  This may have been trapped by the malloc() failed
    hook function, if one is configured.
    */
    while (1)
    {

    }
    
    return 1;
}
//End of File

static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex)
{
    /* Co-routines MUST start with a call to crSTART. */
    crSTART(xHandle);
    for (;;)
    {
        crDELAY(xHandle, pdMS_TO_TICKS(500));

        taskHeartbeat_Execute();
    }
    /* Co-routines MUST end with a call to crEND. */
    crEND();
}

static void taskHeartbeat_Init( unsigned portBASE_TYPE uxPriority )
{
    xCoRoutineCreate( prvMainCoRoutine, uxPriority + 2, crfFLASH_INDEX );
}

/*
    Process the heartbeat. This is done in the main event loop (as
    opposed to an interrupt) so we can see if the App has locked up.
*/
static void taskHeartbeat_Execute(void)
{
    portENTER_CRITICAL();
    {
        IO_RB15_Toggle();
    }
    portEXIT_CRITICAL();
}
