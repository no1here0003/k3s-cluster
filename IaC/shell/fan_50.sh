#!/bin/sh -vxf

# Used to reduce fan speed on R720 to 50%
# Enable control
ipmitool -I lanplus -H $IDRAC_IP -U $IDRAC_USERNAME -P $IDRAC_PASSWORD raw 0x30 0x30 0x01 0x00

# Set to 50%
ipmitool -I lanplus -H $IDRAC_IP -U $IDRAC_USERNAME -P $IDRAC_PASSWORD raw 0x30 0x30 0x02 0xff 0x32
