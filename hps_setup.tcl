# Setup Device
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CSEBA2U23C8S

# Setup Bank Voltages
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 3A
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 3B
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 4A
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 5A
set_global_assignment -name IOBANK_VCCIO 1.35V -section_id 6A
set_global_assignment -name IOBANK_VCCIO 1.35V -section_id 6B
set_global_assignment -name IOBANK_VCCIO 3.3V -section_id 7A
set_global_assignment -name IOBANK_VCCIO 1.8V -section_id 7B
set_global_assignment -name IOBANK_VCCIO 3.3V -section_id 7C
set_global_assignment -name IOBANK_VCCIO 1.8V -section_id 7D
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 8A

# Setup Pin Voltages
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TX_CTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_MDC
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_MDIO
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RESETn
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RXD0
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RXD1
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RXD2
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RXD3
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RX_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_RX_CTL
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TXD0
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TXD1
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TXD2
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TXD3
set_instance_assignment -name IO_STANDARD "1.8 V" -to RGMII1_TX_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_DQ0
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_DQ1
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_DQ2
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_DQ3
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_SS0
set_instance_assignment -name IO_STANDARD "1.8 V" -to QSPI_SS1
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_CMD
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_D0
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_D1
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_D2
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SDMMC_D3
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_STP
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_CS
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D0
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D1
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D2
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D3
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D4
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D5
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D6
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_D7
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_DIR
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_NXT
set_instance_assignment -name IO_STANDARD "1.8 V" -to USB1_ULPI_RESET_N
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_CAN0_RX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_CAN0_TX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_CAN1_RX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_CAN1_TX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_I2C0_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_I2C0_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_UART0_RX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to B7A_UART0_TX
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SW3
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SW1
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SW2
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to I2C1_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to I2C1_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to LED1
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to LED2
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to LED3


# Define HPS pin locations, this is only to remove critical warners produced by Quartus.
set_location_assignment PIN_A17 -to B7A_CAN0_RX                  
set_location_assignment PIN_H17 -to B7A_CAN0_TX                  
set_location_assignment PIN_B18 -to B7A_CAN1_RX                  
set_location_assignment PIN_J17 -to B7A_CAN1_TX                  
set_location_assignment PIN_B16 -to B7A_I2C0_SCL                 
set_location_assignment PIN_C19 -to B7A_I2C0_SDA                 
set_location_assignment PIN_B19 -to B7A_UART0_RX                 
set_location_assignment PIN_C16 -to B7A_UART0_TX                 
set_location_assignment PIN_C28 -to HPS_DDR_A[0]                 
set_location_assignment PIN_B28 -to HPS_DDR_A[1]                 
set_location_assignment PIN_A24 -to HPS_DDR_A[10]                
set_location_assignment PIN_B24 -to HPS_DDR_A[11]                
set_location_assignment PIN_D24 -to HPS_DDR_A[12]                
set_location_assignment PIN_C24 -to HPS_DDR_A[13]                
set_location_assignment PIN_G23 -to HPS_DDR_A[14]                
set_location_assignment PIN_E26 -to HPS_DDR_A[2]                 
set_location_assignment PIN_D26 -to HPS_DDR_A[3]                 
set_location_assignment PIN_J21 -to HPS_DDR_A[4]                 
set_location_assignment PIN_J20 -to HPS_DDR_A[5]                 
set_location_assignment PIN_C26 -to HPS_DDR_A[6]                 
set_location_assignment PIN_B26 -to HPS_DDR_A[7]                 
set_location_assignment PIN_F26 -to HPS_DDR_A[8]                 
set_location_assignment PIN_F25 -to HPS_DDR_A[9]                 
set_location_assignment PIN_A27 -to HPS_DDR_BAS[0]               
set_location_assignment PIN_H25 -to HPS_DDR_BAS[1]               
set_location_assignment PIN_G25 -to HPS_DDR_BAS[2]               
set_location_assignment PIN_A26 -to HPS_DDR_CAS_N                
set_location_assignment PIN_N20 -to HPS_DDR_CK_N                 
set_location_assignment PIN_N21 -to HPS_DDR_CK_P                 
set_location_assignment PIN_L28 -to HPS_DDR_CKE                  
set_location_assignment PIN_L21 -to HPS_DDR_CS0_N                
set_location_assignment PIN_J25 -to HPS_DDR_D[0]                 
set_location_assignment PIN_J24 -to HPS_DDR_D[1]                 
set_location_assignment PIN_J27 -to HPS_DDR_D[10]                
set_location_assignment PIN_J28 -to HPS_DDR_D[11]                
set_location_assignment PIN_M27 -to HPS_DDR_D[12]                
set_location_assignment PIN_M26 -to HPS_DDR_D[13]                
set_location_assignment PIN_M28 -to HPS_DDR_D[14]                
set_location_assignment PIN_N28 -to HPS_DDR_D[15]                
set_location_assignment PIN_N24 -to HPS_DDR_D[16]                
set_location_assignment PIN_N25 -to HPS_DDR_D[17]                
set_location_assignment PIN_T28 -to HPS_DDR_D[18]                
set_location_assignment PIN_U28 -to HPS_DDR_D[19]                
set_location_assignment PIN_E28 -to HPS_DDR_D[2]                 
set_location_assignment PIN_N26 -to HPS_DDR_D[20]                
set_location_assignment PIN_N27 -to HPS_DDR_D[21]                
set_location_assignment PIN_R27 -to HPS_DDR_D[22]                
set_location_assignment PIN_V27 -to HPS_DDR_D[23]                
set_location_assignment PIN_R26 -to HPS_DDR_D[24]                
set_location_assignment PIN_R25 -to HPS_DDR_D[25]                
set_location_assignment PIN_AA28 -to HPS_DDR_D[26]                
set_location_assignment PIN_W26 -to HPS_DDR_D[27]                
set_location_assignment PIN_R24 -to HPS_DDR_D[28]                
set_location_assignment PIN_T24 -to HPS_DDR_D[29]                
set_location_assignment PIN_D27 -to HPS_DDR_D[3]                 
set_location_assignment PIN_Y27 -to HPS_DDR_D[30]                
set_location_assignment PIN_AA27 -to HPS_DDR_D[31]                
set_location_assignment PIN_T26 -to HPS_DDR_D[32]                
set_location_assignment PIN_U25 -to HPS_DDR_D[33]                
set_location_assignment PIN_AC28 -to HPS_DDR_D[34]                
set_location_assignment PIN_V25 -to HPS_DDR_D[35]                
set_location_assignment PIN_V19 -to HPS_DDR_D[36]                
set_location_assignment PIN_V20 -to HPS_DDR_D[37]                
set_location_assignment PIN_AE27 -to HPS_DDR_D[38]                
set_location_assignment PIN_AD28 -to HPS_DDR_D[39]                
set_location_assignment PIN_J26 -to HPS_DDR_D[4]                 
set_location_assignment PIN_K26 -to HPS_DDR_D[5]                 
set_location_assignment PIN_G27 -to HPS_DDR_D[6]                 
set_location_assignment PIN_F28 -to HPS_DDR_D[7]                 
set_location_assignment PIN_K25 -to HPS_DDR_D[8]                 
set_location_assignment PIN_L25 -to HPS_DDR_D[9]                 
set_location_assignment PIN_G28 -to HPS_DDR_DQM[0]               
set_location_assignment PIN_P28 -to HPS_DDR_DQM[1]               
set_location_assignment PIN_W28 -to HPS_DDR_DQM[2]               
set_location_assignment PIN_AB28 -to HPS_DDR_DQM[3]               
set_location_assignment PIN_AE28 -to HPS_DDR_DQM[4]               
set_location_assignment PIN_R16 -to HPS_DDR_DQS_N[0]             
set_location_assignment PIN_R18 -to HPS_DDR_DQS_N[1]             
set_location_assignment PIN_T18 -to HPS_DDR_DQS_N[2]             
set_location_assignment PIN_T20 -to HPS_DDR_DQS_N[3]             
set_location_assignment PIN_V17 -to HPS_DDR_DQS_N[4]             
set_location_assignment PIN_R17 -to HPS_DDR_DQS_P[0]             
set_location_assignment PIN_R19 -to HPS_DDR_DQS_P[1]             
set_location_assignment PIN_T19 -to HPS_DDR_DQS_P[2]             
set_location_assignment PIN_U19 -to HPS_DDR_DQS_P[3]             
set_location_assignment PIN_V18 -to HPS_DDR_DQS_P[4]             
set_location_assignment PIN_A25 -to HPS_DDR_RAS_N                
set_location_assignment PIN_V28 -to HPS_DDR_RESET_N              
set_location_assignment PIN_E25 -to HPS_DDR_WE_N                 
set_location_assignment PIN_D28 -to HPS_ODT                      
set_location_assignment PIN_D25 -to HPS_RZQ0                     
set_location_assignment PIN_K18 -to I2C1_SCL                     
set_location_assignment PIN_A21 -to I2C1_SDA                     
set_location_assignment PIN_B21 -to LED1                         
set_location_assignment PIN_A22 -to LED2                         
set_location_assignment PIN_C21 -to LED3                         
set_location_assignment PIN_C14 -to QSPI_CLK                     
set_location_assignment PIN_A8  -to QSPI_DQ0                     
set_location_assignment PIN_H16 -to QSPI_DQ1                     
set_location_assignment PIN_A7  -to QSPI_DQ2                     
set_location_assignment PIN_J16 -to QSPI_DQ3                     
set_location_assignment PIN_A6  -to QSPI_SS0                     
set_location_assignment PIN_B14 -to QSPI_SS1                     
set_location_assignment PIN_A13 -to RGMII1_MDC                   
set_location_assignment PIN_E16 -to RGMII1_MDIO                  
set_location_assignment PIN_D15 -to RGMII1_RESETn                
set_location_assignment PIN_J12 -to RGMII1_RX_CLK                
set_location_assignment PIN_J13 -to RGMII1_RX_CTL                
set_location_assignment PIN_A14 -to RGMII1_RXD0                  
set_location_assignment PIN_A11 -to RGMII1_RXD1                  
set_location_assignment PIN_C15 -to RGMII1_RXD2                  
set_location_assignment PIN_A9  -to RGMII1_RXD3                  
set_location_assignment PIN_J15 -to RGMII1_TX_CLK                
set_location_assignment PIN_A12 -to RGMII1_TX_CTL                
set_location_assignment PIN_A16 -to RGMII1_TXD0                  
set_location_assignment PIN_J14 -to RGMII1_TXD1                  
set_location_assignment PIN_A15 -to RGMII1_TXD2                  
set_location_assignment PIN_D17 -to RGMII1_TXD3                  
set_location_assignment PIN_B8  -to SDMMC_CLK                    
set_location_assignment PIN_D14 -to SDMMC_CMD                    
set_location_assignment PIN_C13 -to SDMMC_D0                     
set_location_assignment PIN_B6  -to SDMMC_D1                     
set_location_assignment PIN_B11 -to SDMMC_D2                     
set_location_assignment PIN_B9  -to SDMMC_D3                     
set_location_assignment PIN_A5  -to SW1                          
set_location_assignment PIN_H13 -to SW2                          
set_location_assignment PIN_A4  -to SW3                          
set_location_assignment PIN_G4  -to USB1_ULPI_CLK                
set_location_assignment PIN_E4  -to USB1_ULPI_CS                 
set_location_assignment PIN_C10 -to USB1_ULPI_D0                 
set_location_assignment PIN_F5  -to USB1_ULPI_D1                 
set_location_assignment PIN_C9  -to USB1_ULPI_D2                 
set_location_assignment PIN_C4  -to USB1_ULPI_D3                 
set_location_assignment PIN_C8  -to USB1_ULPI_D4                 
set_location_assignment PIN_D4  -to USB1_ULPI_D5                 
set_location_assignment PIN_C7  -to USB1_ULPI_D6                 
set_location_assignment PIN_F4  -to USB1_ULPI_D7                 
set_location_assignment PIN_E5  -to USB1_ULPI_DIR                
set_location_assignment PIN_D5  -to USB1_ULPI_NXT                
set_location_assignment PIN_C6  -to USB1_ULPI_RESET_N            
set_location_assignment PIN_C5  -to USB1_ULPI_STP                
