# MMIO Interface files

These files are used to build a common Memory-mapped I/O interface that can be used for a bunch of common applications.
It basically simplifies the testbench interfacing so that there is a simple unified memory mapped slave interface in hardware.
The software portion is then imitating something like Arduino with a setup() and loop() function.
