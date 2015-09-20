-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

-- DATE "09/16/2015 16:20:27"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fcs_check_serial IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	start_of_frame : IN std_logic;
	end_of_frame : IN std_logic;
	data_in : IN std_logic;
	fcs_error : OUT std_logic
	);
END fcs_check_serial;

-- Design Ports Information
-- start_of_frame	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fcs_error	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_of_frame	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fcs_check_serial IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_start_of_frame : std_logic;
SIGNAL ww_end_of_frame : std_logic;
SIGNAL ww_data_in : std_logic;
SIGNAL ww_fcs_error : std_logic;
SIGNAL \start_of_frame~input_o\ : std_logic;
SIGNAL \data_in~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \R[31]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \end_of_frame~input_o\ : std_logic;
SIGNAL \end_cnt[2]~4_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \end_cnt[4]~1_combout\ : std_logic;
SIGNAL \end_cnt[0]~2_combout\ : std_logic;
SIGNAL \end_cnt[1]~3_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \end_cnt[5]~0_combout\ : std_logic;
SIGNAL \end_cnt[3]~5_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \fcs_error~0_combout\ : std_logic;
SIGNAL \fcs_error~reg0_q\ : std_logic;
SIGNAL R : std_logic_vector(31 DOWNTO 0);
SIGNAL end_cnt : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_end_of_frame~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL ALT_INV_end_cnt : std_logic_vector(5 DOWNTO 0);
SIGNAL ALT_INV_R : std_logic_vector(31 DOWNTO 31);
SIGNAL \ALT_INV_fcs_error~reg0_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_start_of_frame <= start_of_frame;
ww_end_of_frame <= end_of_frame;
ww_data_in <= data_in;
fcs_error <= ww_fcs_error;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_end_of_frame~input_o\ <= NOT \end_of_frame~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_Add0~0_combout\ <= NOT \Add0~0_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_end_cnt(1) <= NOT end_cnt(1);
ALT_INV_end_cnt(2) <= NOT end_cnt(2);
ALT_INV_end_cnt(3) <= NOT end_cnt(3);
ALT_INV_end_cnt(0) <= NOT end_cnt(0);
ALT_INV_end_cnt(4) <= NOT end_cnt(4);
ALT_INV_end_cnt(5) <= NOT end_cnt(5);
ALT_INV_R(31) <= NOT R(31);
\ALT_INV_fcs_error~reg0_q\ <= NOT \fcs_error~reg0_q\;

-- Location: IOOBUF_X89_Y35_N79
\fcs_error~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_fcs_error~reg0_q\,
	devoe => ww_devoe,
	o => ww_fcs_error);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: LABCELL_X88_Y35_N6
\R[31]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R[31]~0_combout\ = !R(31)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_R(31),
	combout => \R[31]~0_combout\);

-- Location: IOIBUF_X89_Y35_N95
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X88_Y35_N8
\R[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \R[31]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R(31));

-- Location: IOIBUF_X89_Y35_N44
\end_of_frame~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_end_of_frame,
	o => \end_of_frame~input_o\);

-- Location: LABCELL_X88_Y35_N33
\end_cnt[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[2]~4_combout\ = ( end_cnt(2) & ( end_cnt(1) & ( (!end_cnt(5) & ((!end_cnt(0)))) # (end_cnt(5) & (!\end_of_frame~input_o\)) ) ) ) # ( !end_cnt(2) & ( end_cnt(1) & ( (!end_cnt(5) & end_cnt(0)) ) ) ) # ( end_cnt(2) & ( !end_cnt(1) & ( 
-- (!\end_of_frame~input_o\) # (!end_cnt(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011101110111000001100000011001110001011100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_end_of_frame~input_o\,
	datab => ALT_INV_end_cnt(5),
	datac => ALT_INV_end_cnt(0),
	datae => ALT_INV_end_cnt(2),
	dataf => ALT_INV_end_cnt(1),
	combout => \end_cnt[2]~4_combout\);

-- Location: FF_X88_Y35_N35
\end_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[2]~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(2));

-- Location: LABCELL_X88_Y35_N24
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !end_cnt(3) & ( !end_cnt(2) & ( !end_cnt(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_end_cnt(1),
	datae => ALT_INV_end_cnt(3),
	dataf => ALT_INV_end_cnt(2),
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X88_Y35_N36
\end_cnt[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[4]~1_combout\ = ( end_cnt(4) & ( \Add0~0_combout\ & ( (!\end_of_frame~input_o\ & end_cnt(5)) ) ) ) # ( !end_cnt(4) & ( \Add0~0_combout\ & ( !end_cnt(5) $ (((!end_cnt(0) & \Equal0~1_combout\))) ) ) ) # ( end_cnt(4) & ( !\Add0~0_combout\ & ( 
-- (!\end_of_frame~input_o\) # (!end_cnt(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111010101011110011000011000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_end_of_frame~input_o\,
	datab => ALT_INV_end_cnt(0),
	datac => \ALT_INV_Equal0~1_combout\,
	datad => ALT_INV_end_cnt(5),
	datae => ALT_INV_end_cnt(4),
	dataf => \ALT_INV_Add0~0_combout\,
	combout => \end_cnt[4]~1_combout\);

-- Location: FF_X88_Y35_N38
\end_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[4]~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(4));

-- Location: LABCELL_X88_Y35_N9
\end_cnt[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[0]~2_combout\ = ( \Equal0~1_combout\ & ( (!end_cnt(0) & ((!end_cnt(4) $ (!end_cnt(5))) # (\end_of_frame~input_o\))) # (end_cnt(0) & (end_cnt(4) & ((end_cnt(5))))) ) ) # ( !\Equal0~1_combout\ & ( (!end_cnt(5) & ((!end_cnt(0)))) # (end_cnt(5) & 
-- ((end_cnt(0)) # (\end_of_frame~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001100001111111100110000111101111011000001010111101100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_end_cnt(4),
	datab => \ALT_INV_end_of_frame~input_o\,
	datac => ALT_INV_end_cnt(5),
	datad => ALT_INV_end_cnt(0),
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \end_cnt[0]~2_combout\);

-- Location: FF_X88_Y35_N11
\end_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[0]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(0));

-- Location: LABCELL_X88_Y35_N54
\end_cnt[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[1]~3_combout\ = ( end_cnt(1) & ( end_cnt(5) & ( !\end_of_frame~input_o\ ) ) ) # ( end_cnt(1) & ( !end_cnt(5) & ( !end_cnt(0) ) ) ) # ( !end_cnt(1) & ( !end_cnt(5) & ( end_cnt(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111110000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_end_of_frame~input_o\,
	datad => ALT_INV_end_cnt(0),
	datae => ALT_INV_end_cnt(1),
	dataf => ALT_INV_end_cnt(5),
	combout => \end_cnt[1]~3_combout\);

-- Location: FF_X88_Y35_N56
\end_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[1]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(1));

-- Location: LABCELL_X88_Y35_N48
\Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = ( end_cnt(0) & ( (end_cnt(1) & (end_cnt(2) & end_cnt(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_end_cnt(1),
	datac => ALT_INV_end_cnt(2),
	datad => ALT_INV_end_cnt(3),
	dataf => ALT_INV_end_cnt(0),
	combout => \Add0~0_combout\);

-- Location: LABCELL_X88_Y35_N12
\end_cnt[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[5]~0_combout\ = ( end_cnt(5) & ( \Equal0~1_combout\ & ( (!end_cnt(4) & ((!end_cnt(0)))) # (end_cnt(4) & (!\end_of_frame~input_o\)) ) ) ) # ( !end_cnt(5) & ( \Equal0~1_combout\ & ( (\Add0~0_combout\ & end_cnt(4)) ) ) ) # ( end_cnt(5) & ( 
-- !\Equal0~1_combout\ & ( !\end_of_frame~input_o\ ) ) ) # ( !end_cnt(5) & ( !\Equal0~1_combout\ & ( (\Add0~0_combout\ & end_cnt(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101110011001100110000000101000001011111110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~0_combout\,
	datab => \ALT_INV_end_of_frame~input_o\,
	datac => ALT_INV_end_cnt(4),
	datad => ALT_INV_end_cnt(0),
	datae => ALT_INV_end_cnt(5),
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \end_cnt[5]~0_combout\);

-- Location: FF_X88_Y35_N14
\end_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[5]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(5));

-- Location: LABCELL_X88_Y35_N0
\end_cnt[3]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \end_cnt[3]~5_combout\ = ( end_cnt(3) & ( end_cnt(1) & ( (!end_cnt(5) & (((!end_cnt(2)) # (!end_cnt(0))))) # (end_cnt(5) & (!\end_of_frame~input_o\)) ) ) ) # ( !end_cnt(3) & ( end_cnt(1) & ( (!end_cnt(5) & (end_cnt(2) & end_cnt(0))) ) ) ) # ( end_cnt(3) & 
-- ( !end_cnt(1) & ( (!\end_of_frame~input_o\) # (!end_cnt(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011101110111000000000000011001110111011100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_end_of_frame~input_o\,
	datab => ALT_INV_end_cnt(5),
	datac => ALT_INV_end_cnt(2),
	datad => ALT_INV_end_cnt(0),
	datae => ALT_INV_end_cnt(3),
	dataf => ALT_INV_end_cnt(1),
	combout => \end_cnt[3]~5_combout\);

-- Location: FF_X88_Y35_N2
\end_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \end_cnt[3]~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => end_cnt(3));

-- Location: LABCELL_X88_Y35_N18
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !end_cnt(1) & ( !end_cnt(2) & ( (!end_cnt(3) & (end_cnt(0) & (!end_cnt(4) & end_cnt(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_end_cnt(3),
	datab => ALT_INV_end_cnt(0),
	datac => ALT_INV_end_cnt(4),
	datad => ALT_INV_end_cnt(5),
	datae => ALT_INV_end_cnt(1),
	dataf => ALT_INV_end_cnt(2),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X88_Y35_N51
\fcs_error~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fcs_error~0_combout\ = ( \Equal0~0_combout\ & ( (!R(31)) # (\fcs_error~reg0_q\) ) ) # ( !\Equal0~0_combout\ & ( \fcs_error~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_R(31),
	datad => \ALT_INV_fcs_error~reg0_q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \fcs_error~0_combout\);

-- Location: FF_X88_Y35_N52
\fcs_error~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \fcs_error~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fcs_error~reg0_q\);

-- Location: IOIBUF_X70_Y81_N18
\start_of_frame~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start_of_frame,
	o => \start_of_frame~input_o\);

-- Location: IOIBUF_X66_Y81_N41
\data_in~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in,
	o => \data_in~input_o\);

-- Location: MLABCELL_X3_Y1_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


