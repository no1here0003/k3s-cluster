#!/bin/sh

# Used to reduce fan speed on R720 to 50%

ipmitool -I lanplus -H <ip here> -U root -P 'password here' raw 0x30 0x30 0x02 0xff 0x32
