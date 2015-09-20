onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fcs_check_serial_tb/fcs_error
add wave -noupdate /fcs_check_serial_tb/start_of_frame
add wave -noupdate /fcs_check_serial_tb/end_of_frame
add wave -noupdate /fcs_check_serial_tb/data_in
add wave -noupdate /fcs_check_serial_tb/clk
add wave -noupdate /fcs_check_serial_tb/i
add wave -noupdate /fcs_check_serial_tb/P
add wave -noupdate /fcs_check_serial_tb/P1
add wave -noupdate /fcs_check_serial_tb/fcs/data_in
add wave -noupdate /fcs_check_serial_tb/fcs/fcs_error
add wave -noupdate /fcs_check_serial_tb/fcs/G
add wave -noupdate /fcs_check_serial_tb/fcs/R(31)
add wave -noupdate -radix hexadecimal /fcs_check_serial_tb/fcs/R
add wave -noupdate /fcs_check_serial_tb/fcs/data_in_1
add wave -noupdate /fcs_check_serial_tb/fcs/end_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20055 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 274
configure wave -valuecolwidth 263
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {61524 ps}
