/*
 * File:   MCP4901.c
 * Author: Yu Sheng
 *
 * Created on September 27, 2023, 6:41 PM
 * 
 * This code utilize SPI header file to transmit data 
 */


#include "xc.h"
//#include "spi1.h"
#include "pin_manager.h"



void MCP4901_init()
{
    MCP4901_output(0);
}

uint16_t input = 0x0000;
//int counter = 50;
void MCP4901_output(uint16_t value)
{

}
