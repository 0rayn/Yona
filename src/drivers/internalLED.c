# include "drivers/led.h"

void stat_led_init(void) {
    GPIO2_DIR |= STAT_LED_BIT;
}

void stat_led_on(void) {
    GPIO2_DATA |= STAT_LED_BIT;
}

void stat_led_off(void) {
    GPIO2_DATA &= ~STAT_LED_BIT;
}
