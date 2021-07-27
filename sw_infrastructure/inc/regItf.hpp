// regItf.cpp
// A register interface library for interacting with the custom register hardware on the OSS-HAL
//
// author: stf

#include <cstdint>
#include <cstdlib>
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define H2F_LW_BASE 0xFF200000
#define BASE_ADDR 0x40000

#define MAP_SIZE 4096UL
#define MAP_MASK (MAP_SIZE - 1)

// ToDo : Make this better
void reg_kill() { exit(0); }

class RegItf {
	public:
		// constructor
		RegItf() {
			// get a virtual address to the physical address	
			off_t dev_base = _paddr;	
			_memfd = open("/dev/mem", O_RDWR | O_SYNC); // requires root
			if(_memfd == -1) {
				fprintf(stderr, "Cannot open /dev/mem -- unable to operate\n");
			        exit(0);	
			}

			// Map one page of memory into user space such that the device is in that page
			_mapped_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, _memfd, dev_base & ~MAP_MASK); 
			if(_mapped_base == (void *) -1) {
				fprintf(stderr, "Unable to map the register region into user space\n");
				exit(0);
			}

			_mapped_dev_base = _mapped_base + (dev_base & MAP_MASK);

			// we should now have a virtual address to the device
		}

		// destructor 
		~RegItf() {
			close(_memfd);	
		}
	
		// ToDo : Add some bound checks on the address 
		uint32_t read(uint32_t reg) {
			if(_debug) 
				fprintf(stderr, "Reading: 0x%x\n", (uint32_t)(_mapped_dev_base+(reg*0x4)));
			return *((uint32_t *)(_mapped_dev_base+(reg*0x4)));
		}

		void write(uint32_t reg, uint32_t data) {
			if(_debug)
				fprintf(stderr, "Writing: 0x%x\n", (uint32_t)(_mapped_dev_base+(reg*0x4)));
			*((uint32_t *)(_mapped_dev_base+(reg*0x4))) = data;
		}

		void debug(bool v) { _debug = v; }

		// dumps the register space
		void dump(uint32_t amount) {
			fprintf(stderr, "\n-----------------------------\n");
			fprintf(stderr, "\t Reg Dump\n");
			fprintf(stderr, "-----------------------------\n");
			for(int i=0; i<amount; i++) {
				uint32_t creg = _paddr + i*(0x4); 
				fprintf(stderr, "Reg: 0x%x = %u\n", creg, read(i)); 
			}
		}

	private:
		uint32_t _paddr = H2F_LW_BASE + BASE_ADDR;
		int _memfd;
		void *_mapped_base;
		void *_mapped_dev_base;
		bool _debug = false;
};
