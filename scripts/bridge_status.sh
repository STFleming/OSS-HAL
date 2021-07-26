#!/bin/bash
# This should be run on the embedded linux of the FPGA device
# author: shane

cat /sys/class/fpga-bridge/fpga2hps/enable
cat /sys/class/fpga-bridge/hps2fpga/enable
cat /sys/class/fpga-bridge/lwhps2fpga/enable
