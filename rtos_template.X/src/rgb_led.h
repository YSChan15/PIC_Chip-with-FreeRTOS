#ifndef _RGB_LED_H_

#include <stdint.h>

typedef struct
{
    uint8_t red;  //duty cycle
    uint8_t green; //duty cycle
    uint8_t blue;  //duty cycle
    uint8_t state;  //for toggling

}RgbLed_st;

void rgb_led_init(RgbLed_st* context);
void rgb_led_off(RgbLed_st* context);
void rgb_led_on(RgbLed_st* context);
void rgb_led_toggle(RgbLed_st* context);
void rgb_led_set_color(RgbLed_st* context, uint8_t red, uint8_t green, uint8_t blue);

#endif