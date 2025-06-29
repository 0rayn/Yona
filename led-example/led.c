//
// led.c
//
// (C) by Satyria.de -> see https://satyria.de/arm/index.php?title=Making_the_LED_Blink_in_C_(PI5)
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 

#include "base.h"
#include "util.h"
#include "types.h"

void LED_off(void)
{
    u32 reg = read32(ARM_GPIO2_DATA0);
    reg &= ~0x200; // Set bit 9 to 0
    write32(ARM_GPIO2_DATA0, reg);
}

void LED_on(void)
{
    u32 reg = read32(ARM_GPIO2_DATA0);
    reg |= 0x200; // Set bit 9 to 1
    write32(ARM_GPIO2_DATA0, reg);
}