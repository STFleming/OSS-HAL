# Swansea OPS-SAT FPGA Shell 

Provides a hardware abstraction layer (HAL) around the FPGA device and scripts for bulding it.
FPGA design can be developed in user_top.sv and will be able to interact with the rest of the system. 

## ToDo

* Add a user_top.sv file where user logic can go
* Add standard ports to the user_top file (initially just a slave interface)
* Setup a Verilator based simulation environment
* Pull out the bitstream file and timing information once the build completes
* tidy up the structure of the folders

