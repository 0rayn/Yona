//
// config.h
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

#ifndef _config_h
#define _config_h

.equ MEGABYTE, 0x100000

.equ MEM_KERNEL_START, 0x80000          // Startadresse des Hauptprogramms
.equ KERNEL_MAX_SIZE, (2 * MEGABYTE)
.equ MEM_KERNEL_END, (MEM_KERNEL_START + KERNEL_MAX_SIZE)
.equ KERNEL_STACK_SIZE, 0x20000
.equ MEM_KERNEL_STACK, (MEM_KERNEL_END + KERNEL_STACK_SIZE)

#endif