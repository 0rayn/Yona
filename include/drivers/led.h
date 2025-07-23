# pragma once
# include "types.h"

/*gpio2 = "/soc@107c000000/gpio@7d517c00";*/

/*
gpio@7d517c00 {
			compatible = "brcm,brcmstb-gpio";
			reg = <0x7d517c00 0x40>;
*/

/*
gpio-line-names =	"RP1_SDA",			0
					"RP1_SCL",			1
					"RP1_RUN",			2
					"SD_IOVDD_SEL",		3
					"SD_PWR_ON",		4
					"SD_CDET_N",		5
					"SD_FLG_N",			6
					"-",				7
					"2712_WAKE",		8
					"2712_STAT_LED",	9
*/

#define GPIO2_BASE		0x107C000000UL + 0x1517C00
#define GPIO2_DIR         (*(volatile u32 *)(GPIO2_BASE + 0x08))
#define GPIO2_DATA        (*(volatile u32 *)(GPIO2_BASE + 0x04))
#define STAT_LED_BIT	(1u << 9)



void stat_led_off(void);
void stat_led_on(void);
void stat_led_init(void);