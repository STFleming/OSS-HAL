CC=arm-linux-gnueabihf-g++

INC=../../infrastructure/sw_infrastructure/inc
CFLAGS=-Wno-pointer-arith

.PHONY: clean

sw_driver.o: main.cpp $(INC)/regItf.hpp 
	$(CC) $(CFLAGS) main.cpp -o sw_driver.o -I$(INC)

clean:
	rm -rf sw_driver.o
