# OSS HAL: OPS-SAT Swansea Hardware Abstraction Layer 

This is the shell that you custom hardware will interact with in the rest of the OPS-SAT system. It provides external ports to the memory subsystem and provides a memory-mapped interface for receiving register commands/data. 


## ToDo
* Make the shell fault tolerant -- duplicate all the interfaces. This might be incredibly tricky to get full fault-tolerance as we might need to start locking the logic to isolated regions.
