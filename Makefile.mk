TEST_DEV_SSH=root@137.44.2.50


image/bitstream.rbf:
	rm -rf $(OSS-HAL)/src/userLogic/*
	cp -r $(HW_DIR)/* $(OSS-HAL)/src/userLogic/
	make -C $(OSS-HAL)/infrastructure/hw_infrastructure/
	mkdir -p image/
	mv $(OSS-HAL)/infrastructure/hw_infrastructure/bitstream.rbf image/

image/sw_driver.o: 
	rm -rf $(OSS-HAL)/src/userSoftware/*.cpp
	rm -rf $(OSS-HAL)/src/userSoftware/*.h
	cp -r $(SW_DIR)/* $(OSS-HAL)/src/userSoftware/
	make -C $(OSS-HAL)/src/userSoftware 
	mkdir -p image/
	mv $(OSS-HAL)/src/userSoftware/sw_driver.o image/ 

sw: image/sw_driver.o

hw: image/bitstream.rbf

image: sw hw

test_deploy: image
	echo "echo 0 > /sys/class/fpga-bridge/fpga2hps/enable" > image/deploy.sh	
	echo "echo 0 > /sys/class/fpga-bridge/hps2fpga/enable" > image/deploy.sh	
	echo "echo 0 > /sys/class/fpga-bridge/lwhps2fpga/enable" > image/deploy.sh	
	echo "dd if=.test/bitstream.rbf of=/dev/fpga0 bs=1M" > image/deploy.sh	
	echo "echo 1 > /sys/class/fpga-bridge/fpga2hps/enable" > image/deploy.sh	
	echo "echo 1 > /sys/class/fpga-bridge/hps2fpga/enable" > image/deploy.sh	
	echo "echo 1 > /sys/class/fpga-bridge/lwhps2fpga/enable" > image/deploy.sh	
	echo ".test/sw_driver.o" > image/deploy.sh	
	chmod u+x image/deploy.sh
	scp -r image $(TEST_DEV_SSH):~/.test
	ssh $(TEST_DEV_SSH) '.test/deploy.sh' 

clean:
	rm -rf image/ 
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/db
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/dev_5cse_l2_3y8
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/dev_5cse_l2_3y8.sof
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/bitstream.rbf
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/incremental_db
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/output_files
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/c5_pin_model_dump.txt
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/hps_isw_handoff
	rm -rf $(OSS-HAL)/infrastructure/hw_infrastructure/*.csv
	rm -rf $(OSS-HAL)/src/userSoftware/sw_driver.o

