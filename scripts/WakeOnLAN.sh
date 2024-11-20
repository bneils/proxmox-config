#!/bin/bash

MAC=9C:6B:00:14:CC:3F
MAC_NO_COL=$(echo $MAC | sed 's/://g')
MAC16=$(printf "$MAC_NO_COL%.0s" {1..16})
BRD_MAC=$(printf "f%.0s" {1..12})
# HEX_DUMP is the broadcast MAC followed by the target MAC (16x)
# Instead of colons it uses backslashes.
HEX_DUMP=$(echo $BRD_MAC$MAC16 | sed -e 's/../\\x&/g')
echo -e $HEX_DUMP | nc -w1 -u -b 255.255.255.255 4000