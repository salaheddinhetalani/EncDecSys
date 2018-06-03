###################################################################

# Created by write_sdc on Mon Nov 27 22:04:10 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_area 0
create_clock [get_ports clk]  -name master_clock  -period 12.5  -waveform {0 6.25}
set_clock_latency 2.5  [get_clocks master_clock]
set_clock_uncertainty 1  [get_clocks master_clock]
set_clock_transition -min -fall 0.5 [get_clocks master_clock]
set_clock_transition -min -rise 0.5 [get_clocks master_clock]
set_clock_transition -max -fall 0.5 [get_clocks master_clock]
set_clock_transition -max -rise 0.5 [get_clocks master_clock]
