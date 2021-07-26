// OSS-HAL : OPS-SAT Swansea Hardware Abstraction Layer
//
// author: stf (shane)

module oss_hal (
	input hal_clk,
	input hal_reset,

	// Register interface
	input logic reg_itf_write_in,
	input logic reg_itf_read_in,
	input logic [3:0] reg_itf_addr_in,
	output logic [31:0] reg_itf_readdata_out,
	input logic [31:0] reg_itf_writedata_in

);




endmodule /* oss_hal */ 
