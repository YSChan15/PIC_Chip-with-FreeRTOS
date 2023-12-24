#include "rgb_led.h"
#include "../mcc_generated_files/oc1.h"
#include "../mcc_generated_files/oc2.h"
#include "../mcc_generated_files/oc3.h"
#include <stdint.h>

static uint32_t timer = 4999;
static uint16_t red1; 
static uint16_t blue1;
static uint16_t green1;

void rgb_led_init(RgbLed_st* context)
{
    context->state = 0;
    rgb_led_toggle(context);
}
void rgb_led_off(RgbLed_st* context)
{
    /* Drive all PWM 100% (assuming common anode LED)  */
    context->red = 255;
    context->blue = 255;
    context->green = 255;
    
    OC1_Stop();
    OC2_Stop();
    OC3_Stop();
    
    red1 = context->red * timer / 255;
    blue1 = context->blue * timer / 255;
    green1 = context->green * timer / 255;
    
    OC1_PrimaryValueSet(blue1);
    OC2_PrimaryValueSet(green1);
    OC3_PrimaryValueSet(red1);
    
    OC1_Start();
    OC2_Start();
    OC3_Start();
}

void rgb_led_on(RgbLed_st* context)
{
    OC1_Stop();
    OC2_Stop();
    OC3_Stop();
    
    OC1_PrimaryValueSet(blue1);
    OC2_PrimaryValueSet(green1);
    OC3_PrimaryValueSet(red1);
    
    OC1_Start();
    OC2_Start();
    OC3_Start();
}

void rgb_led_toggle(RgbLed_st* context)
{
    if(context->state == 0)
    {
        rgb_led_off(context);
        context->state = 1;
    }
    else
    {
        rgb_led_on(context);
        context->state = 0;
    }
}

void rgb_led_set_color(RgbLed_st* context, uint8_t red, uint8_t green, uint8_t blue)
{
    context->red = red;
    context->blue = blue;
    context->green = green;
    
    red1 = context->red * timer / 255;
    blue1 = context->blue * timer / 255;
    green1 = context->green * timer / 255;
    
    OC1_Stop();
    OC1_PrimaryValueSet(blue1);
    OC1_Start();
    OC2_Stop();
    OC2_PrimaryValueSet(green1);
    OC2_Start();
    OC3_Stop();
    OC3_PrimaryValueSet(red1);
    OC3_Start();
}

