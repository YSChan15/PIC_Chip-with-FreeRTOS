
#include <stdint.h>
#include <stddef.h>

/* FreeRTOS scheduler includes. */
#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include "Clock.h"
#include "board.h"

#include "queue.h"

#include "taskDAC.h"
#include "pin_manager.h"
#include "../taskButton.h"
//#include "MCP4901.h"



/*****************************************************************************
    Private Macros
 *****************************************************************************/
#define TASK_ID_DAC       2
#define TASK_INTERVAL     500   //in millisecond

/* A block time of zero simple means "don't block". */
#define DONT_BLOCK    ( ( TickType_t ) 0 )

int value = 0;
int toggle = 0;


//QueueHandle_t ramen;
//Makes it extern so that it could be accessed from main 
//extern QueueHandle_t ramen;

/*****************************************************************************
    Private variables declaration
 *****************************************************************************/
static TimerHandle_t xTimer_DAC = NULL;

/*****************************************************************************
    Private functions prototype
 *****************************************************************************/
static void prvTimer_cbk( TimerHandle_t xTimer );

/*****************************************************************************
    Public functions implementation
 *****************************************************************************/
void taskDAC_init(void)
{
    const portBASE_TYPE id = TASK_ID_DAC;
    TickType_t interval = pdMS_TO_TICKS(TASK_INTERVAL);
    TimerCallbackFunction_t cbk = prvTimer_cbk;

    //DAC_init();       //TODO: implementation, initialize DAC chip
    
    //Create a queue of queuelength of 255, with the size of value found in taskDAC.c
    //ramen = xQueueCreate(255, sizeof(uint8_t));
    
    xTimer_DAC = xTimerCreate(
        (const char * const) "Timer_AD", /* A text name, purely to help debugging. */
        interval, /* The timer period, which is a multiple of ledFLASH_RATE_BASE. */
        pdTRUE, /* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
        (void *) id, /* The ID is used to identify the timer within the timer callback function, as each timer uses the same callback. */
        cbk /* Each timer uses the same callback. */
        );
}

void taskDAC_start(void)
{
    //check
    if( xTimer_DAC  != NULL)
    {
        xTimerStart( xTimer_DAC, DONT_BLOCK);
    }
}


/*****************************************************************************
    FreeRTOS implementation
 *****************************************************************************/
static void prvTimer_cbk( TimerHandle_t xTimer )
{
    const portBASE_TYPE cExpectedTaskID = TASK_ID_DAC;
    portBASE_TYPE xTimerID;

    /* The timer ID is used to identify the timer that has actually expired as
    each timer uses the same callback.  The ID is then also used as the number
    of the LED that is to be toggled. */
    xTimerID = (portBASE_TYPE) pvTimerGetTimerID(xTimer);

    //ensure the invoked RTOS task is for me
    if(xTimerID != cExpectedTaskID)
        return;
    
    //Test code
    //TODO: toggle LED
    if(out)
    {
        if(value >= 255)
        {
            toggle = 1;
        }
        else if(value <= 0)
        {
            toggle = 0;
        }

        if(toggle == 0)
        {
            value += 1;
        }
        else if(toggle == 1)
        {
            value -= 1;
        }
    }
    MCP4901_output(value);
    
    //Macro that calls xQueueGenericSend()
    //Equivalent to xQueueSendtoBack())
    //VTaskSuspend is set to 0, portMAX_DELAY is set to 
    //xQueueSend(ramen, &value, portMAX_DELAY);
}

