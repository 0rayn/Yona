# include "drivers/led.h"

void stat_led_init(void) {
    // GPIO2_DIR |= STAT_LED_BIT;
}

// void stat_led_on(void) {
//     GPIO2_DATA |= STAT_LED_BIT;
// }

// void stat_led_off(void) {
//     GPIO2_DATA &= ~STAT_LED_BIT;
// }
void write32(u64 a, u32 b);
u32 read32(u64 a);

void stat_led_off(void)
{
    u32 reg = read32(GPIO2_DATA);
    reg &= ~0x200; // Set bit 9 to 0
    write32(GPIO2_DATA, reg);
}

void stat_led_on(void)
{
    u32 reg = read32(GPIO2_DATA);
    reg |= 0x200; // Set bit 9 to 1
    write32(GPIO2_DATA, reg);
}