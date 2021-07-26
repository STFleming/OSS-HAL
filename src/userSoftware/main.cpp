// An example main file to interact with the hardware
//
// author: stf

#include "regItf.hpp" // the interface to the registers 
#include <stdio.h>

int main() {
	RegItf regs;

	fprintf(stderr, "A simple adder hardware check\n");
	regs.write(0, 8); // write this into register a
	regs.write(1, 2); // write this into register b

	if(regs.read(3) == 10) {
		fprintf(stderr, "PASSED\n");
	} else {
		fprintf(stderr, "FAILED\n");
	}

	return 0;
}
