#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "xc.h"
#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"
#include <pin_manager.h>
#include <system.h>
#include "board.h"
#include <uart1.h>
#include "queue.h"
#include "../rgb_led.h"
#include "../taskADC.h"

#define taskPRIORITY        2
#define taskSTACK_SIZE      512
#define buffersizesend      6
#define buffersizereceive   12

//Private functions prototype
static void vAppTask( void *pvParameters );
static void vAppTask2( void *pvParameters );
static void vAppTask3( void *pvParameters );

//Extern handler 
extern QueueHandle_t sendData;
extern RgbLed_st led_instance;

//FreeRTOS Task implementation
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask, (char const*)"uartSend", (uint16_t)taskSTACK_SIZE/(uint16_t)(2), NULL, uxPriority, (TaskHandle_t *) NULL );
    xTaskCreate(vAppTask2, (char const*)"uartReceive", (uint16_t)taskSTACK_SIZE/(uint16_t)(2), NULL, uxPriority, (TaskHandle_t *) NULL );
    xTaskCreate(vAppTask3, (char const*)"HeartBeat", (uint16_t)taskSTACK_SIZE/(uint16_t)(8), NULL, uxPriority + 2, (TaskHandle_t *) NULL );
}   

//Public functions implementation.
void taskSerial_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

//Send task 
static void vAppTask( void *pvParameters )
{
    //Just to stop compiler warnings.
    (void) pvParameters;
    char sendstring[buffersizesend];
    
    //Task entrance
    while(1)
    {    
        //Delay by 100ms 
        vTaskDelay(100);
        //Receive queues for data sending
        xQueueReceive(sendData,sendstring,portMAX_DELAY);
        //Print the entire array of sendData
        for(int i = 0; i < sizeof(sendstring);i++)
        {
            //Typecast it to be unsigned char (unsigned 8 bit)
            //Print in hexadecimal number
            printf("%02x",(unsigned char)sendstring[i]);
        }
        //Print newline
        printf("\n");
    }
}

//Extern variable that will be accessed by taskADC
extern float threshold = 100;
extern uint8_t statealarm = 0;
extern int signal = 0;
extern int bufferarray = 8;

//Receive task
static void vAppTask2( void *pvParameters )
{
    //Just to stop compiler warnings.
    (void) pvParameters;
    
    //Index buffer for receivestring
    int i = 0;
    //receivestring with buffersize of[12+1], 12 should be enough 
    char receivestring[buffersizereceive+1];
    //variable to check for UART1Read()
    char rx_char;
    
    //String for red, blue and green rgb values
    char redstring[3];
    char bluestring[3];
    char greenstring[3];
    
    //Variables to hold red,green, and blue values 
    int red = 0;
    int blue = 0;
    int green = 0;
    
    //Buffersize temperature values
    char buffertemp[3];

    //Temperature threshold values 
    char tempstring[9];
    
    while(1)
    {
        //If UART is ready to receive
        if(UART1_IsRxReady())
        {
            //Read the received character
            rx_char = UART1_Read();
            //If receive character is not \n, add it to the array buffer
            if(rx_char != '\n')
            {    
                //Add to array buffer
                receivestring[i] = rx_char;
                //Increase index by 1
                i++;
            }
            //Else, finish receiving the entire message
            else
            {
                //Place null character behind 
                receivestring[i] = '\0';
                //If marker is d6
                if((receivestring[0] =='d') && (receivestring[1] == '6'))
                {
                    //If message type is 91 (RGB)
                    if((receivestring[2] =='9') && (receivestring[3] == '1'))
                    {
                        //Use stringcopy, skip the first 6th character (d6,91,00) and only copy 2 bytes 
                        //Place a null character behind 
                        //Repeat for green and blue, but +2 of data skipped 
                        strncpy(redstring,receivestring+6,sizeof(redstring)-1);
                        redstring[sizeof(redstring)-1] = '\0';
                        strncpy(greenstring,receivestring+8,sizeof(greenstring)-1);
                        greenstring[sizeof(greenstring)-1] = '\0';
                        strncpy(bluestring,receivestring+10,sizeof(bluestring)-1);
                        bluestring[sizeof(bluestring)-1] = '\0';
                        
                        //Converts string into long integer, indicate its a hexadecimal number 
                        //Typecast it to integer
                        red = (int)strtol(redstring,NULL,16);
                        blue = (int)strtol(bluestring,NULL,16);
                        green = (int)strtol(greenstring,NULL,16);
                        
                        //Set the rgb color 
                        rgb_led_set_color(&led_instance,red,green,blue);
                    }
                    
                    //If message is B2 (Temperature Alarm Threshold)
                    else if((receivestring[2] =='B') && (receivestring[3] == '2'))
                    {
                        //Use stringcopy, only the data after marker and message type (+4)
                        strncpy(tempstring,receivestring+4,sizeof(tempstring)-1);
                        //Place a null terminator behind 
                        tempstring[sizeof(tempstring)-1] = '\0';
                        
                        //Converts string into long integer, indicate its a hexadecimal number
                        long hexValue = strtol(tempstring,NULL,16);
                        //Gets address of hexValue, typecast it as float 
                        //* outside the (float*) dereference the pointer 
                        threshold = *(float*)&hexValue;
                    }
                }
                
                //Else if marker is d4
                else if((receivestring[0] =='d') && (receivestring[1] == '4'))
                {
                    //If message type is 81 (clear alarm)
                    if((receivestring[2] == '8') && (receivestring [3] == '1'))
                    {
                        //Clear the alarm 
                        statealarm = 0;
                        //Set LED to low 
                        IO_RB6_SetLow();
                    }
                    
                    //If message type is 82 (temperature averaging window size)
                    else if((receivestring[2] == '8') && (receivestring [3] == '2'))
                    {
                        //Set signal to 0
                        signal = 0;
                        //Use stringcopy, only the data after marker and message type (+4)
                        strncpy(buffertemp,receivestring+4,sizeof(buffertemp)-1);
                        //Place a null terminator behind 
                        buffertemp[sizeof(buffertemp)-1] = '\0';
                        //Converts string into long integer, indicate its a hexadecimal number 
                        //Typecast it to integer
                        bufferarray = (int)strtol(buffertemp,NULL,16);   
                        //Set signal back to 1, telling the window to reinitialize everything to 0
                        signal = 1;
                    }
                }
                //Resets receivearray buffer to 0
                i = 0;
            }
        }
    }
}

//Blinking LED task 
static void vAppTask3( void *pvParameters )
{
    (void) pvParameters;
    while(1)
    {
        //Toggle the LED to be on / off every 0.5ms 
        vTaskDelay(500);
        IO_RB15_Toggle();
    }
}


