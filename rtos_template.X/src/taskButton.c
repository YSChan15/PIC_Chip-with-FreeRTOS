#include <stdint.h>
#include <stddef.h>
#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"
#include "clock.h"
#include "board.h"
#include "taskButton.h"
#include "pin_manager.h"
#include "queue.h"


//Private Macros
#define TASK_ID_BUTTON    1
#define TASK_INTERVAL     100   //in millisecond
#define buffersize        6

/* A block time of zero simple means "don't block". */
#define DONT_BLOCK    ( ( TickType_t ) 0 )

int hold;
int out = 0;

extern QueueHandle_t sendData;

//Private variables declaration
static TimerHandle_t xTimer_BUTTON = NULL;

//Private functions prototype
static void prvTimer_cbk2( TimerHandle_t xTimer );

//Public functions implementation
void taskButton_init(void)
{
    const portBASE_TYPE id = TASK_ID_BUTTON;
    TickType_t interval = pdMS_TO_TICKS(TASK_INTERVAL);
    TimerCallbackFunction_t cbk = prvTimer_cbk2;

    xTimer_BUTTON = xTimerCreate(
        (const char * const) "Timer_BT", /* A text name, purely to help debugging. */
        interval,                        /* The timer period, which is a multiple of ledFLASH_RATE_BASE. */
        pdTRUE,                          /* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
        (void *) id,                     /* The ID is used to identify the timer within the timer callback function, as each timer uses the same callback. */
        cbk                              /* Each timer uses the same callback. */
        );
}

void taskButton_start(void)
{
    //check
    if( xTimer_BUTTON != NULL)
    {
        xTimerStart( xTimer_BUTTON, DONT_BLOCK);
    }
}

//Variables 
int counter = 0;
uint8_t state = 0;
char buttonstate[buffersize];

//FreeRTOS implementation
static void prvTimer_cbk2( TimerHandle_t xTimer )
{
    const portBASE_TYPE cExpectedTaskID = TASK_ID_BUTTON;
    portBASE_TYPE xTimerID;

    /* The timer ID is used to identify the timer that has actually expired as
    each timer uses the same callback.  The ID is then also used as the number
    of the LED that is to be toggled. */
    xTimerID = (portBASE_TYPE) pvTimerGetTimerID(xTimer);

    //ensure the invoked RTOS task is for me
    if(xTimerID != cExpectedTaskID)
        return;
    
    buttonstate[0] = 0xd4;
    buttonstate[1] = 0x10;
    
    //Add counter by 1
    counter++;
    
    //Check if button is pressed
    if(IO_RB7_GetValue() == 1)
    {
        //Take in value of 1
        hold = IO_RB7_GetValue();
    }
    
    //If button is released 
    if((IO_RB7_GetValue() == 0) && (hold != IO_RB7_GetValue()))
    {
        //Toggles the state
        if(state == 0)
        {
            state = 1;
            IO_RB9_SetHigh();
        }
        else
        {
            state = 0;
            IO_RB9_SetLow();
        }
        hold = 0;
    }
    
    //If counter is equal to 100, 10 seconds has passeed, send the data
    if(counter >= 100)
    {
        memcpy(buttonstate + 2, &state, sizeof(uint8_t));
        //sprintf(buttonstate, "d410%u",state);
        xQueueSend(sendData, buttonstate, portMAX_DELAY);
        counter = 0;
    }
}


