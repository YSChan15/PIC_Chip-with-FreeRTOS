/* 
 * File:   taskSerial.h
 * Author: emb_dev
 *
 * Created on July 9, 2023, 10:04 PM
 */

#ifndef TASKSERIAL_H
#define	TASKSERIAL_H

#ifdef	__cplusplus
extern "C" {
#endif

    extern void taskSerial_init(void);
    extern float threshold;
    extern uint8_t statealarm;
    extern int bufferarray;
    extern int signal;

#ifdef	__cplusplus
}
#endif

#endif	/* TASKSERIAL_H */

