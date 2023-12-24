#include <stdint.h>
#include <stddef.h>
#include "stdio.h"
#include "string.h"
#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"
#include "clock.h"
#include "board.h"
#include "queue.h"
#include "taskADC.h"
#include "pin_manager.h"
#include "adc1.h"
#include "uart1.h"
#include "taskSerial.h"

//Private Macros
#define TASK_ID_ADC       2
#define TASK_ID_AVG       3
#define TASK_INTERVAL     1000   //in millisecond
#define TASK_INTERVAL_AVG 1000   //in millisecond

//Queue handler 
QueueHandle_t sendData;

//Task 1 variables
//ADC reading
uint16_t ADC;
float voltage;
float temperature;
float ringBuffer[32];
int i = 0;
int icopy = 0;
int countalarm = 0;
char bufferADC[6];
char bufferVoltage[6];
char bufferAlarm[6];
int count = 0;

//Task 2 variables
int k = 0;
float temp;
char buffertemp[6];
int countertemp = 0;


/* A block time of zero simple means "don't block". */
#define DONT_BLOCK    ( ( TickType_t ) 0 )

//Private variables declaration
static TimerHandle_t xTimer_ADC = NULL;
static TimerHandle_t xTimer_AVG = NULL;

//Private functions prototype
static void prvTimer_cbk( TimerHandle_t xTimer );
static void prvTimer_cbk2( TimerHandle_t xTimer );

//Public functions implementation
void taskADC_init(void)
{
    const portBASE_TYPE id = TASK_ID_ADC;
    const portBASE_TYPE id2 = TASK_ID_AVG; 
    TickType_t interval = pdMS_TO_TICKS(TASK_INTERVAL);
    TickType_t intervalAVG = pdMS_TO_TICKS(TASK_INTERVAL_AVG);
    
    TimerCallbackFunction_t cbk = prvTimer_cbk;
    TimerCallbackFunction_t cbk2 = prvTimer_cbk2;

    sendData = xQueueCreate(8, sizeof(char)*6);
    
    
    xTimer_ADC = xTimerCreate(
        (const char * const) "Timer_AD",  /* A text name, purely to help debugging. */
        interval,                         /* The timer period, which is a multiple of ledFLASH_RATE_BASE. */
        pdTRUE,                           /* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
        (void *) id,                      /* The ID is used to identify the timer within the timer callback function, as each timer uses the same callback. */
        cbk                               /* Each timer uses the same callback. */
        );
    
    xTimer_AVG = xTimerCreate(
        (const char * const) "Timer_AVG", /* A text name, purely to help debugging. */
        intervalAVG,                      /* The timer period, which is a multiple of ledFLASH_RATE_BASE. */
        pdTRUE,                           /* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
        (void *) id2,                     /* The ID is used to identify the timer within the timer callback function, as each timer uses the same callback. */
        cbk2                              /* Each timer uses the same callback. */
        );
}

void taskADC_start(void)
{
    //Enable ADC
    ADC1_Enable();
    //Select AN0 as the ADC input
    ADC1_ChannelSelect(channel_AN0);
    //Enable software trigger to sample 
    ADC1_SoftwareTriggerEnable();
    
    //Sets the predifined marker and message type 
    bufferADC[0] = 0xd5;
    bufferADC[1] = 0x10;
    
    bufferVoltage[0] = 0xd6;
    bufferVoltage[1] = 0x31;
    
    bufferAlarm[0] = 0xd4;
    bufferAlarm[1] = 0x01;
    
    buffertemp[0] = 0xd6;
    buffertemp[1] = 0x32;
    
    //Check if timer is valid 
    if( xTimer_ADC  != NULL)
    {
        xTimerStart( xTimer_ADC, DONT_BLOCK);
    }
    
    if( xTimer_AVG != NULL)
    {
        xTimerStart( xTimer_AVG, DONT_BLOCK);
    }
}


//FreeRTOS implementation
static void prvTimer_cbk( TimerHandle_t xTimer )
{
    const portBASE_TYPE cExpectedTaskID = TASK_ID_ADC;
    portBASE_TYPE xTimerID;

    /* The timer ID is used to identify the timer that has actually expired as
    each timer uses the same callback.  The ID is then also used as the number
    of the LED that is to be toggled. */
    xTimerID = (portBASE_TYPE) pvTimerGetTimerID(xTimer);

    //ensure the invoked RTOS task is for me
    if(xTimerID != cExpectedTaskID)
        return;
               
    //Disable trigger so that ADC can be read 
    ADC1_SoftwareTriggerDisable();
    //Convert the ADC to integer value 
    while(!ADC1_IsConversionComplete(channel_AN0));
    ADC = ADC1_ConversionResultGet(channel_AN0);
    //Enable the trigger again 
    ADC1_SoftwareTriggerEnable();  
    temperature   = (float)ADC/10;
    ringBuffer[i] = temperature;
    icopy = i;
    i = (i + 1) % bufferarray;
    
    if(bufferarray)
    {
        
    }
    count++;
    countalarm++;

    voltage = (float)ADC / 1000;
    
    //If statealarm is triggered, temperature is greater than threshold
    //Send it every 1 second
    if(temperature>threshold)
    {
        statealarm = 1;
        IO_RB6_SetHigh();
    }
    
    if((countalarm >= 10) /*(statealarm == 1)*/)
    {
        memcpy(bufferAlarm + 2, &statealarm, sizeof(uint8_t));
        xQueueSend(sendData, bufferAlarm, portMAX_DELAY);
        countalarm = 0;
    }
    
    //Send it as a queue, every 2 seconds
    if(count >= 2)
    {
        memcpy(bufferADC + 2, &ADC, sizeof(uint16_t));
        //sprintf(bufferADC,"d410%u",ADC);
        xQueueSend(sendData, bufferADC, portMAX_DELAY);
        memcpy(bufferVoltage + 2, &voltage, sizeof(float));
        //sprintf(bufferVoltage,"d631%2.1f",voltage);
        xQueueSend(sendData, bufferVoltage, portMAX_DELAY);
        //xQueueSend(temperature, &convertedtemp, portMAX_DELAY);
        count = 0;
    }
}


static void prvTimer_cbk2( TimerHandle_t xTimer )
{
    const portBASE_TYPE cExpectedTaskID = TASK_ID_AVG;
    portBASE_TYPE xTimerID;

    /* The timer ID is used to identify the timer that has actually expired as
    each timer uses the same callback.  The ID is then also used as the number
    of the LED that is to be toggled. */
    xTimerID = (portBASE_TYPE) pvTimerGetTimerID(xTimer);
    
    //ensure the invoked RTOS task is for me
    if(xTimerID != cExpectedTaskID)
        return;
       
    if(signal)
    {
        signal = 0;
        for(int j = 0; j < 32; j++)
        {
            ringBuffer[j] = 0;
        }
    }
    
    temp = 0;
    k = 0;
    if(icopy == 0)
    {
        temp = ringBuffer[icopy];
    }
    else 
    {
        for (int j = 0; j < icopy; j++) 
        {
            
            //if (ringBuffer[j] != 0) 
            //{
                temp += ringBuffer[j];
                k++;
            //}
        }
    }
    
    
    if(k > 0)
    {
        temp = temp / k;
    }
    
    countertemp++;
    
    if(countertemp >= 30)
    {
        memcpy(buffertemp + 2, &temp, sizeof(float));
        //sprintf(buffertemp, "d632%2.1f", temp);
        xQueueSend(sendData,buffertemp,portMAX_DELAY);
        countertemp = 0;
    }
}
