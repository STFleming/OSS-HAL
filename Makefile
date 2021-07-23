.PHONY: build

build:
	qsys-generate dev_5cse_l2_3y8.qsys --synthesis=VHDL
	quartus_map dev_5cse_l2_3y8
	quartus_fit dev_5cse_l2_3y8
	quartus_sta dev_5cse_l2_3y8
	quartus_asm dev_5cse_l2_3y8

clean:
	rm -rf db
	rm -rf dev_5cse_l2_3y8
	rm -rf incremental_db
	rm -rf output_files

