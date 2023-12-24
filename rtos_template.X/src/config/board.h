#ifndef BOARD_H
#define	BOARD_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <pin_manager.h>
#include <system.h>

#define LED_1    RA9
#define LED_2    RB3
//#define LED_3    RB3    

#define BTN_S3   RA10
#define BTN_S4   RA7
#define BTN_S6   RA9

#define IO(x, y, z)    x ## y ## z
#define IO_TOGGLE(n)    IO(IO_, n, _Toggle())
#define IO_SET(n)       IO(IO_,n,_SetHigh())
#define IO_CLEAR(n)     IO(IO_,n,_SetLow())

#ifdef	__cplusplus
}
#endif

#endif	/* BOARD_H */

