// regItf.cpp
// A simulator register interface library for interacting with the simulation in Verilator
// of the OSS-HAL hardware 
//
// author: stf

#include <cstdint>
#include <queue>
#include <mutex>

typedef struct {
	uint32_t addr;
	uint32_t data;
	uint8_t wr;
	uint8_t rd;
} mmio_cmd_t;

class RegItf {
	public:
		// constructor
		RegItf() {

		}

		//read function
		uint32_t read(uint32_t reg){

		}	

		// write function
		void write(uint32_t reg, uint32_t data) {

		}

	private:

};
