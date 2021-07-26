CC = arm-linux-gnueabihf-gcc
CXX =  arm-linux-gnueabihf-g++

CPP_FILES += $(wildcard *.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

CC_FLAGS += -I .
CC_FLAGS += -MMD

all:	stamps obj readsysid

stamps:
	touch main.cpp

readsysid: $(OBJ_FILES)
	echo $(OBJ_FILES)
	$(CXX) $(LD_FLAGS) -o $@ $^

obj:
	mkdir -p obj

obj/%.o: %.cpp
	$(CXX) $(CC_FLAGS) -c -o $@ $<

clean:
	rm -rf obj

-include $(OBJ_FILES:.o=.d)
