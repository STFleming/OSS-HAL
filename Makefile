TEST_DEV_SSH=root@137.44.2.50


image/bitstream.rbf:
	make -C infrastructure/hw_infrastructure/
	mkdir -p image/
	mv infrastructure/hw_infrastructure/bitstream.rbf image/

image/sw_driver.o: 
	make -C src/userSoftware 
	mkdir -p image/
	mv src/userSoftware/sw_driver.o image/ 

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
	rm -rf infrastructure/hw_infrastructure/db
	rm -rf infrastructure/hw_infrastructure/dev_5cse_l2_3y8
	rm -rf infrastructure/hw_infrastructure/dev_5cse_l2_3y8.sof
	rm -rf infrastructure/hw_infrastructure/bitstream.rbf
	rm -rf infrastructure/hw_infrastructure/incremental_db
	rm -rf infrastructure/hw_infrastructure/output_files
	rm -rf infrastructure/hw_infrastructure/c5_pin_model_dump.txt
	rm -rf infrastructure/hw_infrastructure/hps_isw_handoff
	rm -rf infrastructure/hw_infrastructure/*.csv
	rm -rf src/userSoftware/sw_driver.o

