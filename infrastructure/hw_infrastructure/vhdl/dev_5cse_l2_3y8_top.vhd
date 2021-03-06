-------------------------------------------------------------------------------
-- Title      : dev_5cse_l2_3y8_top
-- Project    : 
-------------------------------------------------------------------------------
--
--     o  0                          
--     | /       Copyright (c) 20154
--    (CL)---o   Critical Link, LLC  
--      \                            
--       O                           
--
-- File       : mitysom-5cse_dev_exp_top.vhd
-- Company    : Critical Link, LLC
-- Created    : 2013-07-29
-- Last update: 2015-06-09
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Top level entity for the mitysom-5CSE Development Board
-------------------------------------------------------------------------------
-- Copyright (c) 2014 Critical Link, LLC
-------------------------------------------------------------------------------
-- Revisions  :
-- Date			Version	Author	Description
-- 2014-10-22	0.1		Adam D	Initial project to use 5CSEBA2U23C8[S] Exp I/O
-- 2015-06-09	0.2		Dan V		-Changed top level name
--											-Changed HSMC/Expanded IO to use PIO blocks
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------

entity dev_5cse_l2_3y8_top is
	port(
		-- HPS DDR
		HPS_DDR_A         : out   std_logic_vector(14 downto 0);
		HPS_DDR_BAS       : out   std_logic_vector(2 downto 0);
		HPS_DDR_CK_P      : out   std_logic;
		HPS_DDR_CK_N      : out   std_logic;
		HPS_DDR_CKE       : out   std_logic;
		HPS_DDR_CS0_N     : out   std_logic;
		HPS_DDR_RAS_N     : out   std_logic;
		HPS_DDR_CAS_N     : out   std_logic;
		HPS_DDR_WE_N      : out   std_logic;
		HPS_DDR_RESET_N   : out   std_logic;
		HPS_DDR_D         : inout std_logic_vector(15 downto 0) := (others => 'X');
		HPS_DDR_DQS_P     : inout std_logic_vector(1 downto 0)  := (others => 'X');
		HPS_DDR_DQS_N     : inout std_logic_vector(1 downto 0)  := (others => 'X');
		HPS_DDR_DQM       : out   std_logic_vector(1 downto 0);
		HPS_RZQ0          : in    std_logic                     := 'X';
		HPS_ODT           : out   std_logic;
		-- RGMII1
		RGMII1_TX_CLK     : out   std_logic;
		RGMII1_TXD0       : out   std_logic;
		RGMII1_TXD1       : out   std_logic;
		RGMII1_TXD2       : out   std_logic;
		RGMII1_TXD3       : out   std_logic;
		RGMII1_RXD0       : in    std_logic                     := 'X';
		RGMII1_MDIO       : inout std_logic                     := 'X';
		RGMII1_MDC        : out   std_logic;
		RGMII1_RX_CTL     : in    std_logic                     := 'X';
		RGMII1_TX_CTL     : out   std_logic;
		RGMII1_RX_CLK     : in    std_logic                     := 'X';
		RGMII1_RXD1       : in    std_logic                     := 'X';
		RGMII1_RXD2       : in    std_logic                     := 'X';
		RGMII1_RXD3       : in    std_logic                     := 'X';
		RGMII1_RESETn     : inout std_logic;
		-- QSPI
		QSPI_DQ0          : inout std_logic                     := 'X';
		QSPI_DQ1          : inout std_logic                     := 'X';
		QSPI_DQ2          : inout std_logic                     := 'X';
		QSPI_DQ3          : inout std_logic                     := 'X';
		QSPI_SS0          : out   std_logic;
		QSPI_SS1          : out   std_logic;
		QSPI_CLK          : out   std_logic;
		-- SDMMC
		SDMMC_CMD         : inout std_logic                     := 'X';
		SDMMC_D0          : inout std_logic                     := 'X';
		SDMMC_D1          : inout std_logic                     := 'X';
		SDMMC_CLK         : out   std_logic;
		SDMMC_D2          : inout std_logic                     := 'X';
		SDMMC_D3          : inout std_logic                     := 'X';
		-- USB1
		USB1_ULPI_D0      : inout std_logic                     := 'X';
		USB1_ULPI_D1      : inout std_logic                     := 'X';
		USB1_ULPI_D2      : inout std_logic                     := 'X';
		USB1_ULPI_D3      : inout std_logic                     := 'X';
		USB1_ULPI_D4      : inout std_logic                     := 'X';
		USB1_ULPI_D5      : inout std_logic                     := 'X';
		USB1_ULPI_D6      : inout std_logic                     := 'X';
		USB1_ULPI_D7      : inout std_logic                     := 'X';
		USB1_ULPI_CLK     : in    std_logic                     := 'X';
		USB1_ULPI_STP     : out   std_logic;
		USB1_ULPI_DIR     : in    std_logic                     := 'X';
		USB1_ULPI_NXT     : in    std_logic                     := 'X';
		USB1_ULPI_CS      : inout std_logic;
		USB1_ULPI_RESET_N : inout std_logic;
		-- UART0
		B7A_UART0_RX      : in    std_logic                     := 'X';
		B7A_UART0_TX      : out   std_logic;
		-- I2C0
		B7A_I2C0_SDA      : inout std_logic                     := 'X';
		B7A_I2C0_SCL      : inout std_logic                     := 'X';
		-- CAN0
		B7A_CAN0_RX       : in    std_logic                     := 'X';
		B7A_CAN0_TX       : out   std_logic;
		-- CAN1
		B7A_CAN1_RX       : in    std_logic                     := 'X';
		B7A_CAN1_TX       : out   std_logic;
		-- I2C1
		I2C1_SCL          : inout std_logic;
		I2C1_SDA          : inout std_logic;
		-- LEDs
		LED1              : inout std_logic;
		LED2              : inout std_logic;
		LED3              : inout std_logic;
		-- Switches
		SW1               : inout std_logic;
		SW2               : inout std_logic;
		SW3               : inout std_logic;

		-- HSMC1
		HSMC1_SMSDA       : inout std_logic;
		HSMC1_SMSCL       : inout std_logic;
		HSMC1_CLKOUT0     : inout std_logic;
		HSMC1_CLKOUT1     : inout std_logic;
		HSMC1_CLKOUT2     : inout std_logic;
		HSMC1_CLKIN0      : inout std_logic;
		HSMC1_CLKIN1      : inout std_logic;
		HSMC1_CLKIN2      : inout std_logic;
		HSMC1_CLKOUT1_N   : inout std_logic;
		HSMC1_CLKOUT2_N   : inout std_logic;
		HSMC1_CLKIN1_N    : inout std_logic;
		HSMC1_CLKIN2_N    : inout std_logic;
		HSMC1_PRSNTn      : inout std_logic;
		HSMC1_D0          : inout std_logic;
		HSMC1_D1          : inout std_logic;
		HSMC1_D2          : inout std_logic;
		HSMC1_D3          : inout std_logic;
		HSMC1_TX0         : inout std_logic;
		HSMC1_TX1         : inout std_logic;
		HSMC1_TX2         : inout std_logic;
		HSMC1_TX3         : inout std_logic;
		HSMC1_TX4         : inout std_logic;
		HSMC1_TX5         : inout std_logic;
		HSMC1_TX6         : inout std_logic;
		HSMC1_TX7         : inout std_logic;
		HSMC1_TX8         : inout std_logic;
		HSMC1_TX9         : inout std_logic;
		HSMC1_TX10        : inout std_logic;
		HSMC1_TX11        : inout std_logic;
		HSMC1_TX12        : inout std_logic;
		HSMC1_TX13        : inout std_logic;
		HSMC1_TX14        : inout std_logic;
		HSMC1_TX15        : inout std_logic;
		HSMC1_TX16        : inout std_logic;
		HSMC1_TX0_N       : inout std_logic;
		HSMC1_TX1_N       : inout std_logic;
		HSMC1_TX2_N       : inout std_logic;
		HSMC1_TX3_N       : inout std_logic;
		HSMC1_TX4_N       : inout std_logic;
		HSMC1_TX5_N       : inout std_logic;
		HSMC1_TX6_N       : inout std_logic;
		HSMC1_TX7_N       : inout std_logic;
		HSMC1_TX8_N       : inout std_logic;
		HSMC1_TX9_N       : inout std_logic;
		HSMC1_TX10_N      : inout std_logic;
		HSMC1_TX11_N      : inout std_logic;
		HSMC1_TX12_N      : inout std_logic;
		HSMC1_TX13_N      : inout std_logic;
		HSMC1_TX14_N      : inout std_logic;
		HSMC1_TX15_N      : inout std_logic;
		HSMC1_TX16_N      : inout std_logic;
		HSMC1_RX0         : inout std_logic;
		HSMC1_RX1         : inout std_logic;
		HSMC1_RX2         : inout std_logic;
		HSMC1_RX3         : inout std_logic;
		HSMC1_RX4         : inout std_logic;
		HSMC1_RX5         : inout std_logic;
		HSMC1_RX6         : inout std_logic;
		HSMC1_RX7         : inout std_logic;
		HSMC1_RX8         : inout std_logic;
		HSMC1_RX9         : inout std_logic;
		HSMC1_RX10        : inout std_logic;
		HSMC1_RX11        : inout std_logic;
		HSMC1_RX12        : inout std_logic;
		HSMC1_RX13        : inout std_logic;
		HSMC1_RX14        : inout std_logic;
		HSMC1_RX15        : inout std_logic;
		HSMC1_RX16        : inout std_logic;
		HSMC1_RX0_N       : inout std_logic;
		HSMC1_RX1_N       : inout std_logic;
		HSMC1_RX2_N       : inout std_logic;
		HSMC1_RX3_N       : inout std_logic;
		HSMC1_RX4_N       : inout std_logic;
		HSMC1_RX5_N       : inout std_logic;
		HSMC1_RX6_N       : inout std_logic;
		HSMC1_RX7_N       : inout std_logic;
		HSMC1_RX8_N       : inout std_logic;
		HSMC1_RX9_N       : inout std_logic;
		HSMC1_RX10_N      : inout std_logic;
		HSMC1_RX11_N      : inout std_logic;
		HSMC1_RX12_N      : inout std_logic;
		HSMC1_RX13_N      : inout std_logic;
		HSMC1_RX14_N      : inout std_logic;
		HSMC1_RX15_N      : inout std_logic;
		HSMC1_RX16_N      : inout std_logic;
		HSMC2_SMSDA       : inout std_logic;
		HSMC2_D1_P        : inout std_logic;
		HSMC2_D1_N        : inout std_logic;
		HSMC2_TX0_P       : inout std_logic;
		HSMC2_TX0_N       : inout std_logic;
		HSMC2_TX1         : inout std_logic;
		HSMC2_SMSCL       : inout std_logic;
		HSMC2_D2_P        : inout std_logic;
		HSMC2_D2_N        : inout std_logic;
		HSMC2_RX0_P       : inout std_logic;
		HSMC2_RX0_N       : inout std_logic;
		HSMC2_RX1_P       : inout std_logic;
		HSMC2_RX1_N       : inout std_logic;
		HSMC2_PRSNTN      : inout std_logic;

		-- Dev Board Expanded I/O Pins
		B5A_TX_R1_P       : inout   std_logic; -- B5A_TX_R1_P J100pin47 AF26
		B5A_TX_R1_N       : inout   std_logic; -- B5A_TX_R1_N J100pin49 AE26
		B5A_TX_R3_P       : inout   std_logic; -- B5A_TX_R3_P J100pin53 AE25
		B5A_TX_R3_N       : inout   std_logic; -- B5A_TX_R3_N J100pin55 AD26
		B5A_TX_R5_P       : inout   std_logic; -- B5A_TX_R5_P J100pin42 AC24
		B5A_TX_R5_N       : inout   std_logic; -- B5A_TX_R5_N J100pin44 AB23

		B5A_RX_R2_P       : inout   std_logic; -- B5A_RX_R2_P J100pin183 AA20
		B5A_RX_R2_N       : inout   std_logic; -- B5A_RX_R2_N J100pin185 Y19
		B5A_RX_R4_P       : inout   std_logic; -- B5A_RX_R4_P J100pin187 Y17
		B5A_RX_R4_N       : inout   std_logic; -- B5A_RX_R4_N J100pin189 Y18

		B3A_RX_B7_P       : inout   std_logic; -- B3A_RX_B7_P J100pin191 Y11
		B3A_RX_B7_N       : inout   std_logic; -- B3A_RX_B7_N J100pin193 AA11
		B3A_RX_B5_P       : inout   std_logic; -- B3A_RX_B5_P J100pin195 U10
		B3A_RX_B5_N       : inout   std_logic; -- B3A_RX_B5_N J100pin197 V10
		B3A_RX_B3_P       : inout   std_logic; -- B3A_RX_B3_P J100pin199 U9 
		B3A_RX_B3_N       : inout   std_logic; -- B3A_RX_B3_N J100pin201 T8 
		B3A_RX_B1_P       : inout   std_logic; -- B3A_RX_B1_P J100pin203 W8 
		B3A_RX_B1_N       : inout   std_logic; -- B3A_RX_B1_N J100pin205 Y8 

		B3A_TX_B8_P       : inout   std_logic; -- B3A_TX_B8_P J100pin184 AD5
		B3A_TX_B8_N       : inout   std_logic; -- B3A_TX_B8_N J100pin186 AE6
		B3A_TX_B6_P       : inout   std_logic; -- B3A_TX_B6_P J100pin188 AC4
		B3A_TX_B6_N       : inout   std_logic; -- B3A_TX_B6_N J100pin190 AD4
		B3A_TX_B4_P       : inout   std_logic; -- B3A_TX_B4_P J100pin192 AA4
		B3A_TX_B4_N       : inout   std_logic; -- B3A_TX_B4_N J100pin194 AB4
		B3A_TX_B2_P       : inout   std_logic; -- B3A_TX_B2_P J100pin196 Y5 
		B3A_TX_B2_N       : inout   std_logic -- B3A_TX_B2_N J100pin198 Y4
	);
end entity dev_5cse_l2_3y8_top;

-------------------------------------------------------------------------------

architecture rtl of dev_5cse_l2_3y8_top is
	component dev_5cse_l2_3y8 is
		port(
			hps_ddr_mem_a                   : out   std_logic_vector(14 downto 0); -- mem_a
			hps_ddr_mem_ba                  : out   std_logic_vector(2 downto 0); -- mem_ba
			hps_ddr_mem_ck                  : out   std_logic; -- mem_ck
			hps_ddr_mem_ck_n                : out   std_logic; -- mem_ck_n
			hps_ddr_mem_cke                 : out   std_logic; -- mem_cke
			hps_ddr_mem_cs_n                : out   std_logic; -- mem_cs_n
			hps_ddr_mem_ras_n               : out   std_logic; -- mem_ras_n
			hps_ddr_mem_cas_n               : out   std_logic; -- mem_cas_n
			hps_ddr_mem_we_n                : out   std_logic; -- mem_we_n
			hps_ddr_mem_reset_n             : out   std_logic; -- mem_reset_n
			hps_ddr_mem_dq                  : inout std_logic_vector(15 downto 0) := (others => 'X'); -- mem_dq
			hps_ddr_mem_dqs                 : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs
			hps_ddr_mem_dqs_n               : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs_n
			hps_ddr_mem_odt                 : out   std_logic; -- mem_odt
			hps_ddr_mem_dm                  : out   std_logic_vector(1 downto 0); -- mem_dm
			hps_ddr_oct_rzqin               : in    std_logic                     := 'X'; -- oct_rzqin
			hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic; -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   : out   std_logic; -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   : out   std_logic; -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   : out   std_logic; -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   : out   std_logic; -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X'; -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    : out   std_logic; -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic; -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X'; -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_SS1     : out   std_logic; -- hps_io_qspi_inst_SS1
			hps_io_hps_io_qspi_inst_IO0     : inout std_logic                     := 'X'; -- hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1     : inout std_logic                     := 'X'; -- hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2     : inout std_logic                     := 'X'; -- hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3     : inout std_logic                     := 'X'; -- hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0     : out   std_logic; -- hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK     : out   std_logic; -- hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X'; -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X'; -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X'; -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK     : out   std_logic; -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X'; -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X'; -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := 'X'; -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := 'X'; -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     : out   std_logic; -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := 'X'; -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := 'X'; -- hps_io_usb1_inst_NXT
			hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X'; -- hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     : out   std_logic; -- hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA     : inout std_logic                     := 'X'; -- hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL     : inout std_logic                     := 'X'; -- hps_io_i2c0_inst_SCL
			hps_io_hps_io_i2c1_inst_SDA     : inout std_logic                     := 'X'; -- hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL     : inout std_logic                     := 'X'; -- hps_io_i2c1_inst_SCL
			hps_io_hps_io_can0_inst_RX      : in    std_logic                     := 'X'; -- hps_io_can0_inst_RX
			hps_io_hps_io_can0_inst_TX      : out   std_logic; -- hps_io_can0_inst_TX
			hps_io_hps_io_can1_inst_RX      : in    std_logic                     := 'X'; -- hps_io_can1_inst_RX
			hps_io_hps_io_can1_inst_TX      : out   std_logic; -- hps_io_can1_inst_TX
			hps_io_hps_io_gpio_inst_GPIO00  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO00
			hps_io_hps_io_gpio_inst_GPIO09  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO28  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO28
			hps_io_hps_io_gpio_inst_GPIO37  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO37
			hps_io_hps_io_gpio_inst_GPIO40  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO41  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO41
			hps_io_hps_io_gpio_inst_GPIO48  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO48
			hps_io_hps_io_gpio_inst_GPIO49  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO49
			hps_io_hps_io_gpio_inst_GPIO50  : inout std_logic                     := 'X'; -- hps_io_gpio_inst_GPIO50
			pio_0_export                    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_1_export                    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_2_export                    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_3_export                    : inout std_logic_vector(28 downto 0)  := (others => 'X') -- export

		);
	end component dev_5cse_l2_3y8;

begin                                   -- architecture rtl

	----------------------------------------------------------------------------
	-- Component instantiations
	----------------------------------------------------------------------------

	u0 : component dev_5cse_l2_3y8
		port map(
			hps_ddr_mem_a                   => HPS_DDR_A, -- hps_ddr.mem_a
			hps_ddr_mem_ba                  => HPS_DDR_BAS, --       .mem_ba
			hps_ddr_mem_ck                  => HPS_DDR_CK_P, --       .mem_ck
			hps_ddr_mem_ck_n                => HPS_DDR_CK_N, --       .mem_ck_n
			hps_ddr_mem_cke                 => HPS_DDR_CKE, --       .mem_cke
			hps_ddr_mem_cs_n                => HPS_DDR_CS0_N, --       .mem_cs_n
			hps_ddr_mem_ras_n               => HPS_DDR_RAS_N, --       .mem_ras_n
			hps_ddr_mem_cas_n               => HPS_DDR_CAS_N, --       .mem_cas_n
			hps_ddr_mem_we_n                => HPS_DDR_WE_N, --       .mem_we_n
			hps_ddr_mem_reset_n             => HPS_DDR_RESET_N, --       .mem_reset_n
			hps_ddr_mem_dq                  => HPS_DDR_D, --       .mem_dq
			hps_ddr_mem_dqs                 => HPS_DDR_DQS_P, --       .mem_dqs
			hps_ddr_mem_dqs_n               => HPS_DDR_DQS_N, --       .mem_dqs_n
			hps_ddr_mem_odt                 => HPS_ODT, --       .mem_odt
			hps_ddr_mem_dm                  => HPS_DDR_DQM, --       .mem_dm
			hps_ddr_oct_rzqin               => HPS_RZQ0, --       .oct_rzqin
			hps_io_hps_io_emac1_inst_TX_CLK => RGMII1_TX_CLK, -- hps_io.hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   => RGMII1_TXD0, --       .hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   => RGMII1_TXD1, --       .hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   => RGMII1_TXD2, --       .hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   => RGMII1_TXD3, --       .hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   => RGMII1_RXD0, --       .hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_RXD1   => RGMII1_RXD1, --       .hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   => RGMII1_RXD2, --       .hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   => RGMII1_RXD3, --       .hps_io_emac1_inst_RXD3
			hps_io_hps_io_emac1_inst_MDIO   => RGMII1_MDIO, --       .hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    => RGMII1_MDC, --       .hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL => RGMII1_RX_CTL, --       .hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL => RGMII1_TX_CTL, --       .hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK => RGMII1_RX_CLK, --       .hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_qspi_inst_SS1     => QSPI_SS1, -- hps_io.hps_io_qspi_inst_SS1
			hps_io_hps_io_qspi_inst_IO0     => QSPI_DQ0, --       .hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1     => QSPI_DQ1, --       .hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2     => QSPI_DQ2, --       .hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3     => QSPI_DQ3, --       .hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0     => QSPI_SS0, --       .hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK     => QSPI_CLK, --       .hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD     => SDMMC_CMD, --       .hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      => SDMMC_D0, --       .hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      => SDMMC_D1, --       .hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_D2      => SDMMC_D2, --       .hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      => SDMMC_D3, --       .hps_io_sdio_inst_D3
			hps_io_hps_io_sdio_inst_CLK     => SDMMC_CLK, --       .hps_io_sdio_inst_CLK
			hps_io_hps_io_usb1_inst_D0      => USB1_ULPI_D0, --       .hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      => USB1_ULPI_D1, --       .hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      => USB1_ULPI_D2, --       .hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      => USB1_ULPI_D3, --       .hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      => USB1_ULPI_D4, --       .hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      => USB1_ULPI_D5, --       .hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      => USB1_ULPI_D6, --       .hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      => USB1_ULPI_D7, --       .hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     => USB1_ULPI_CLK, --       .hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     => USB1_ULPI_STP, --       .hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     => USB1_ULPI_DIR, --       .hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     => USB1_ULPI_NXT, --       .hps_io_usb1_inst_NXT
			hps_io_hps_io_uart0_inst_RX     => B7A_UART0_RX, --       .hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     => B7A_UART0_TX, --       .hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA     => B7A_I2C0_SDA, --       .hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL     => B7A_I2C0_SCL, --       .hps_io_i2c0_inst_SCL
			hps_io_hps_io_i2c1_inst_SDA     => I2C1_SDA, -- hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL     => I2C1_SCL, -- hps_io_i2c1_inst_SCL
			hps_io_hps_io_can0_inst_RX      => B7A_CAN0_RX, --       .hps_io_can0_inst_RX
			hps_io_hps_io_can0_inst_TX      => B7a_CAN0_TX, --       .hps_io_can0_inst_TX
			hps_io_hps_io_can1_inst_RX      => B7A_CAN1_RX, --       .hps_io_can1_inst_RX
			hps_io_hps_io_can1_inst_TX      => B7A_CAN1_TX, --       .hps_io_can1_inst_TX
			hps_io_hps_io_gpio_inst_GPIO00  => USB1_ULPI_CS, --       .hps_io_gpio_inst_GPIO00
			hps_io_hps_io_gpio_inst_GPIO09  => USB1_ULPI_RESET_N, --       .hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO48  => LED3, --       .hps_io_gpio_inst_GPIO48
			hps_io_hps_io_gpio_inst_GPIO28  => RGMII1_RESETn, -- hps_io_gpio_inst_GPIO28
			hps_io_hps_io_gpio_inst_GPIO37  => SW1, -- hps_io_gpio_inst_GPIO37
			hps_io_hps_io_gpio_inst_GPIO40  => SW2, -- hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO41  => SW3, -- hps_io_gpio_inst_GPIO41
			hps_io_hps_io_gpio_inst_GPIO49  => LED2, -- hps_io_gpio_inst_GPIO49
			hps_io_hps_io_gpio_inst_GPIO50  => LED1, -- hps_io_gpio_inst_GPIO50
			pio_0_export(0)                 => HSMC1_TX0,
			pio_0_export(1)                 => HSMC1_TX1,
			pio_0_export(2)                 => HSMC1_TX2,
			pio_0_export(3)                 => HSMC1_TX3,
			pio_0_export(4)                 => HSMC1_TX4,
			pio_0_export(5)                 => HSMC1_TX5,
			pio_0_export(6)                 => HSMC1_TX6,
			pio_0_export(7)                 => HSMC1_TX7,
			pio_0_export(8)                 => HSMC1_TX8,
			pio_0_export(9)                 => HSMC1_TX9,
			pio_0_export(10)                => HSMC1_TX10,
			pio_0_export(11)                => HSMC1_TX11,
			pio_0_export(12)                => HSMC1_TX12,
			pio_0_export(13)                => HSMC1_TX13,
			pio_0_export(14)                => HSMC1_TX14,
			pio_0_export(15)                => HSMC1_TX15,
			pio_0_export(16)                => HSMC1_TX16,
			pio_0_export(17)                => HSMC1_TX0_N,
			pio_0_export(18)                => HSMC1_TX1_N,
			pio_0_export(19)                => HSMC1_TX2_N,
			pio_0_export(20)                => HSMC1_TX3_N,
			pio_0_export(21)                => HSMC1_TX4_N,
			pio_0_export(22)                => HSMC1_TX5_N,
			pio_0_export(23)                => HSMC1_TX6_N,
			pio_0_export(24)                => HSMC1_TX7_N,
			pio_0_export(25)                => HSMC1_TX8_N,
			pio_0_export(26)                => HSMC1_TX9_N,
			pio_0_export(27)                => HSMC1_TX10_N,
			pio_0_export(28)                => HSMC1_TX11_N,
			pio_0_export(29)                => HSMC1_TX12_N,
			pio_0_export(30)                => HSMC1_TX13_N,
			pio_0_export(31)                => HSMC1_TX14_N,
			pio_1_export(0)                 => HSMC1_TX15_N,
			pio_1_export(1)                 => HSMC1_TX16_N,
			pio_1_export(2)                 => HSMC1_SMSCL,
			pio_1_export(3)                 => HSMC1_CLKOUT0,
			pio_1_export(4)                 => HSMC1_CLKOUT1,
			pio_1_export(5)                 => HSMC1_CLKOUT2,
			pio_1_export(6)                 => HSMC1_CLKOUT1_N,
			pio_1_export(7)                 => HSMC1_CLKOUT2_N,
			pio_1_export(8)                 => HSMC1_D0,
			pio_1_export(9)                 => HSMC1_D2,
			pio_1_export(10)                => HSMC1_RX0,
			pio_1_export(11)                => HSMC1_RX1,
			pio_1_export(12)                => HSMC1_RX2,
			pio_1_export(13)                => HSMC1_RX3,
			pio_1_export(14)                => HSMC1_RX4,
			pio_1_export(15)                => HSMC1_RX5,
			pio_1_export(16)                => HSMC1_RX6,
			pio_1_export(17)                => HSMC1_RX7,
			pio_1_export(18)                => HSMC1_RX8,
			pio_1_export(19)                => HSMC1_RX9,
			pio_1_export(20)                => HSMC1_RX10,
			pio_1_export(21)                => HSMC1_RX11,
			pio_1_export(22)                => HSMC1_RX12,
			pio_1_export(23)                => HSMC1_RX13,
			pio_1_export(24)                => HSMC1_RX14,
			pio_1_export(25)                => HSMC1_RX15,
			pio_1_export(26)                => HSMC1_RX16,
			pio_1_export(27)                => HSMC1_RX0_N,
			pio_1_export(28)                => HSMC1_RX1_N,
			pio_1_export(29)                => HSMC1_RX2_N,
			pio_1_export(30)                => HSMC1_RX3_N,
			pio_1_export(31)                => HSMC1_RX4_N,
			pio_2_export(0)                 => HSMC1_RX5_N,
			pio_2_export(1)                 => HSMC1_RX6_N,
			pio_2_export(2)                 => HSMC1_RX7_N,
			pio_2_export(3)                 => HSMC1_RX8_N,
			pio_2_export(4)                 => HSMC1_RX9_N,
			pio_2_export(5)                 => HSMC1_RX10_N,
			pio_2_export(6)                 => HSMC1_RX11_N,
			pio_2_export(7)                 => HSMC1_RX12_N,
			pio_2_export(8)                 => HSMC1_RX13_N,
			pio_2_export(9)                 => HSMC1_RX14_N,
			pio_2_export(10)                => HSMC1_RX15_N,
			pio_2_export(11)                => HSMC1_RX16_N,
			pio_2_export(12)                => HSMC1_SMSDA,
			pio_2_export(13)                => HSMC1_CLKIN0,
			pio_2_export(14)                => HSMC1_CLKIN1,
			pio_2_export(15)                => HSMC1_CLKIN2,
			pio_2_export(16)                => HSMC1_CLKIN1_N,
			pio_2_export(17)                => HSMC1_CLKIN2_N,
			pio_2_export(18)                => HSMC1_D1,
			pio_2_export(19)                => HSMC1_D3,
			pio_2_export(20)                => HSMC1_PRSNTn,
			pio_2_export(21)                => HSMC2_SMSCL,
			pio_2_export(22)                => HSMC2_D2_P,
			pio_2_export(23)                => HSMC2_D2_N,
			pio_2_export(24)                => HSMC2_RX0_P,
			pio_2_export(25)                => HSMC2_RX0_N,
			pio_2_export(26)                => HSMC2_RX1_P,
			pio_2_export(27)                => HSMC2_RX1_N,
			pio_2_export(28)                => HSMC2_PRSNTN,
			pio_2_export(29)                => HSMC2_SMSDA,
			pio_2_export(30)                => HSMC2_D1_P,
			pio_2_export(31)                => HSMC2_D1_N,
			pio_3_export(0)                 => HSMC2_TX0_P,
			pio_3_export(1)                 => HSMC2_TX0_N,
			pio_3_export(2)                 => HSMC2_TX1,
			pio_3_export(3)					=> B5A_TX_R1_P,
			pio_3_export(4)					=> B5A_TX_R1_N,
			pio_3_export(5)					=> B5A_TX_R3_P,
			pio_3_export(6)					=> B5A_TX_R3_N,
			pio_3_export(7)					=> B5A_TX_R5_P,
			pio_3_export(8)					=> B5A_TX_R5_N,
			pio_3_export(9)					=> B5A_RX_R2_P,
			pio_3_export(10)				=> B5A_RX_R2_N,
			pio_3_export(11)				=> B5A_RX_R4_P,
			pio_3_export(12)				=> B5A_RX_R4_N,
			pio_3_export(13)				=> B3A_RX_B7_P,
			pio_3_export(14)				=> B3A_RX_B7_N,
			pio_3_export(15)				=> B3A_RX_B5_P,
			pio_3_export(16)				=> B3A_RX_B5_N,
			pio_3_export(17)				=> B3A_RX_B3_P,
			pio_3_export(18)				=> B3A_RX_B3_N,
			pio_3_export(19)				=> B3A_RX_B1_P,
			pio_3_export(20)				=> B3A_RX_B1_N,
			pio_3_export(21)				=> B3A_TX_B8_P,
			pio_3_export(22)				=> B3A_TX_B8_N,
			pio_3_export(23)				=> B3A_TX_B6_P,
			pio_3_export(24)				=> B3A_TX_B6_N,
			pio_3_export(25)				=> B3A_TX_B4_P,
			pio_3_export(26)				=> B3A_TX_B4_N,
			pio_3_export(27)				=> B3A_TX_B2_P,
			pio_3_export(28)				=> B3A_TX_B2_N
		);
end architecture rtl;

-------------------------------------------------------------------------------
