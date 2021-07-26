CC=arm-linux-gnueabihf-g++

INC=../../sw_infrastructure/inc

.PHONY: clean

sw_driver.o: main.cpp $(INC)/regItf.hpp 
	$(CC) main.cpp -o sw_driver.o -I$(INC)

clean:
	rm -rf sw_driver.o
