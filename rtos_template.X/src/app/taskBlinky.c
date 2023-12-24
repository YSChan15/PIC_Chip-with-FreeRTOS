
#include <stdint.h>
#include <stdbool.h>

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>

#include "board.h"

#define taskPRIORITY        1
#define taskSTACK_SIZE      128

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void vAppTask( void *pvParameters );

/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask, (char const*)"blink", (uint16_t)taskSTACK_SIZE/(uint16_t)(2), NULL, uxPriority, (TaskHandle_t *) NULL );
}

/*****************************************************************************

    Public functions implementation.

*****************************************************************************/
void taskBlinky_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

static void vAppTask( void *pvParameters )
{
    /* Just to stop compiler warnings. */
    (void) pvParameters;
    bool is_mode_1 = true;
    bool led_active = false;
    uint8_t state = 0;

    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
//        IO_TOGGLE(LED_3);
        
        if(is_mode_1)
        {
            /*
             * Mode 1: drive LED according to input pin's logic state
             */
            if(IO_RA10_GetValue() == false)  //active low
                IO_SET(LED_1);
            else
                IO_CLEAR(LED_1);
        }
        else
        {
            /*
             * Mode 2: input pin acts as toggle signal
             * Using state machine approach for this implementation
             * State 0: wait for input logic state goes high
             * State 1: trap in this state until input logic state goes low
             * State 2: update LED state (there are two options to choose from)
             */
            switch(state)
            {
                case 0:
                    if(IO_RA10_GetValue() == false)  //'if button is pressed'
                        state = 1;
                    break;
                case 1:
                    if(IO_RA10_GetValue())  //'if button is released'
                    {
                        led_active ^= 1;  //toggle signal
                        
                        state = 2;
                    }
                    break;
                case 2:
                    //option 1: toggle LED state directly
                    IO_TOGGLE(LED_1);
                    
                    //option 2: drive LED state based on variable
//                    if(led_active)
//                        IO_SET(LED_1);
//                    else
//                        IO_CLEAR(LED_1);
                    
                    //change state to 0
                    state = 0;
                    break;
                    
            }
        }

        //This is a secondary push button,
        //used for switching between Mode 1 and Mode 2
        //Known issue: pressing the button 'too long' (over 100 ms) could
        //cause the variable to flip between 1 and 0.
        //TODO: fix the issue by state machine implementation, similar to Mode 2 above
        if(IO_RA7_GetValue() == false)
        {
            is_mode_1 ^= 1;
            
            //LED off: Mode 1
            //LED on: Mode 2
            IO_TOGGLE(LED_2);
        }

        vTaskDelay(100);
    }
}