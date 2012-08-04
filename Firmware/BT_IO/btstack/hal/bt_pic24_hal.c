/*
Copyright (c) 2012, Akinori Harada
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

  * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following disclaimer
    in the documentation and/or other materials provided with the
    distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
 * bt_pi24_hal.c
 */

#include <stdint.h>

#define USE_AND_OR 
#include<timer.h>
#include<PwrMgnt.h>

#include "btstack/hal_cpu.h"
#include "btstack/hal_tick.h"

static void dummy_handler(void){};
static void (*tick_handler)(void) = &dummy_handler;


void hal_tick_init(void)
{
	ConfigIntTimer1(T1_INT_ON|T1_INT_PRIOR_3);
	OpenTimer1(T1_ON|T1_PS_1_64,0x7a12);
}

void hal_tick_set_handler(void (*handler)(void))
{
    if (handler == NULL){
        tick_handler = &dummy_handler;
        return;
    }
    tick_handler = handler;	
}

int  hal_tick_get_tick_period_in_ms(void)
{
	return 250;
}

void hal_tick_handler()
{
	tick_handler();
}

void __attribute__ ((interrupt,no_auto_psv)) _T1Interrupt (void)
{
	hal_tick_handler();
	T1_Clear_Intr_Status_Bit;
}

void hal_cpu_disable_irqs()
{
	__builtin_disi(0x3FFF); /* disable interrupts */
}

void hal_cpu_enable_irqs()
{
	__builtin_disi(0x0000); /* enable interrupts */	
}

void hal_cpu_enable_irqs_and_sleep()
{
	__builtin_disi(0x0000); /* enable interrupts */
	mPWRMGNT_GotoIdleMode();
}
