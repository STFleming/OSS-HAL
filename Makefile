
.PHONY: bitstream.rbf

bitstream.rbf:
	make -C hw_infrastructure/


clean:
	rm -rf bitstream.rbf
	rm -rf hw_infrastructure/db
	rm -rf hw_infrastructure/dev_5cse_l2_3y8
	rm -rf hw_infrastructure/incremental_db
	rm -rf hw_infrastructure/output_files
	rm -rf hw_infrastructure/c5_pin_model_dump.txt
	rm -rf hw_infrastructure/hps_isw_handoff
	rm -rf hw_infrastructure/*.csv

