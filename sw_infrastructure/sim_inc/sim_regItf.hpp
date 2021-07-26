// regItf.cpp
// A simulator register interface library for interacting with the simulation in Verilator
// of the OSS-HAL hardware 
//
// author: stf

#include <cstdint>

#define H2F_LW_BASE 0xFF000000
#define BASE_ADDR 0x00C0

class RegItf {
	public:
		// constructor
		RegItf() {
			// get a virtual address to the physical address	
		}

		// 

	private:
		uint32_t _paddr = H2F_LW_BASE + BASE_ADDR;
		uint32_t _vaddr = NULL; // the virt address that points to our dev
};
