// HardwareProfile.h

#ifndef _HARDWAREPROFILE_H_
#define _HARDWAREPROFILE_H_

#if defined( __PIC32MX__)
#endif

//#define USE_USB_PLL

#if defined (__C30__)
    #if defined (__dsPIC33EP512MU810__)||defined(__PIC24EP512GU810__)
        #define GetSystemClock()            40000000UL
        #define GetPeripheralClock()        (GetSystemClock())
        #define GetInstructionClock()       (GetSystemClock() / 2)
    #else
    // Various clock values
        #define GetSystemClock()            32000000UL
        #define GetPeripheralClock()        (GetSystemClock())
        #define GetInstructionClock()       (GetSystemClock() / 2)
    #endif
#elif defined( __PIC32MX__)
    //#define USB_A0_SILICON_WORK_AROUND
    //#define RUN_AT_48MHZ
    //#define RUN_AT_24MHZ
    #define RUN_AT_60MHZ

    // Various clock values
    #if defined(RUN_AT_48MHZ)
        #define GetSystemClock()            48000000UL
        #define GetPeripheralClock()        48000000UL
        #define GetInstructionClock()       (GetSystemClock() / 2) 
    #elif defined(RUN_AT_24MHZ)
        #define GetSystemClock()            24000000UL
        #define GetPeripheralClock()        24000000UL
        #define GetInstructionClock()       (GetSystemClock() / 2) 
    #elif defined(RUN_AT_60MHZ)    
        #define GetSystemClock()            60000000UL
        #define GetPeripheralClock()        60000000UL  // Will be divided down
        #define GetInstructionClock()       (GetSystemClock() / 2) 
    #else
        #error Choose a speed
    #endif        
#endif

// Define the baud rate constants
#define BAUDRATE2       57600 //19200
#define BRG_DIV2        4 //16
#define BRGH2           1 //0

#define DEMO_TIMEOUT_LIMIT  0xF000

#if defined(__PIC24F__) || defined(__PIC24H__)
    #include <p24fxxxx.h>
    #include <uart2.h>
#elif defined (__dsPIC33EP512MU810__)
#elif defined(__dsPIC33EP512MU810__)
    #include <p33Exxxx.h>
    #include <p33Exxxx.h>
    #include <uart2.h>
#elif defined (__PIC24EP512GU810__)
    #include <p24Exxxx.h>
    #include <uart2.h>
#else
    #include <p32xxxx.h>
    #include <plib.h>
    #include <uart2.h>
#endif


#endif  

