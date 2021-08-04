# OSS-HAL : OPS-SAT Swansea Hardware Abstraction Layer 
### Version 0.1.2

Provides a hardware abstraction layer (HAL) around the OPS-SAT FPGA device alowing for the rapid deployment and testing of hardware designs..

# userLogic

The userLogic hardware is the logic that is implemented within the FPGA by the user within the OSS-HAL shell.
The top-level System Verilog file can be found in ``src/userLogic/oss_hal.sv``. 

It is possible to add additional files to the build but they needed to be included in the ``src/userLogic/files.tcl`` file so that the build tools can locate them.

To construct the hardware in the root directory of OSS-HAL type:
```
make hw
```

If successful this will produce a bitstream in ``image/bitstream.rbf``.

# userSoftware

In addition to the hardware we will also need software that will run on the hard processing system (HPS), the hardended ARM cores within the FPGA device on OPS-SAT.

The software can be edited in ``src/userSoftware/main.cpp``. To make the software driver binary type ``make sw`` in the root directory of OSS-HAL. This will produce the ARM binary file ``image/sw_driver.o`` that can be run on the OPS-SAT HPS. 

# Deploying the image (Automated)
Once we have a complete image (HW + SW) we can then deploy it on our local test machine.
To do this type 
```
make test_deploy
```
This command will generate an experiment script and transfer it along with the sw and hw binaries to our test device over ssh. The script will then be run via and ssh connection and show stdout. Once completed the ssh connection will be terminated. If you do not have ssh keys setup with the test device then you may have to enter the password in twice when doing a test_deployment (once for transfering the files over and once to connect and run the image). 

# Deploying the image (manual)
TODO: write something here

## ToDo

* Setup a Verilator based simulation environment
* tidy up the structure of the folders
* create a deployment script

## Version Historyn
* 0.1.2 -- test_deploy makefile fixes 
* 0.1.1 -- Decoupled the userLogic and userSoftware from the OSS-HAL repository so that the OSS-HAL repository can be included as a submodule.
* 0.1.0 -- Avalon S interface working along with software libs.
