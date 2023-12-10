# Clock(3.3V)_______________________________________________________________
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports Clock_50MHz]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports o_LED1]
#set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports o_LED1]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports o_LED2]
#set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports i_Key]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports o_Serial_TX ]

#create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports Clock_100MHz]