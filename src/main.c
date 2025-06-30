# include "drivers/led.h"

__attribute__((noreturn)) void kmain(void) {
    stat_led_init();

    while (1) {
        stat_led_on();
        for (volatile int i = 0; i < 1000000; i++);
        stat_led_off();
        for (volatile int i = 0; i < 1000000; i++);
    }
}