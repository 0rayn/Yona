//
// util.s
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

.globl write32
write32:
    stp x29, x30, [sp, -16]!
    mov x29, sp
    str w1, [x0]
    ldp x29, x30, [sp], 16
    ret

.globl read32
read32:
    stp x29, x30, [sp, -16]!
    mov x29, sp
    ldr w0, [x0]
    ldp x29, x30, [sp], 16
    ret