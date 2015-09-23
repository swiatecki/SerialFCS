library IEEE;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

entity fcs_check_serial_tb is
 -- port ( 
 --   fcs_error      : out std_logic -- indicates an error.
 -- );
end fcs_check_serial_tb;

architecture fcs_check_serial_tb_arch of fcs_check_serial_tb is

component fcs_check_serial PORT(
    clk            : in std_logic; -- system clock
    reset          : in std_logic; -- asynchronous reset
    start_of_frame : in std_logic; -- arrival of the first bit.
    end_of_frame   : in std_logic; -- arrival of the first bit in FCS.
    data_in 	 : in std_logic; -- serial input data.
    fcs_error      : out std_logic -- indicates an error.
  );
	end component;
	
signal fcs_error : std_logic;
signal reset : std_logic;
signal start_of_frame : std_logic;
signal end_of_frame : std_logic;
signal data_in : std_logic;
signal clk : std_logic := '0';
signal enable : std_logic := '0';



signal i : integer range 0 to 514; --:= 511;


--constant P : std_logic_vector(511 downto 0):= X"0010A47BEA8000123456789008004500002EB3FE000080110540C0A8002CC0A8000404000400001A2DE8000102030405060708090A0B0C0D0E0F1011E6C53DB2";

signal P : std_logic_vector(511 downto 0);
constant P1 : std_logic_vector(511 downto 0):= X"0010A47BEA8000123456789008004500002EB3FE000080110540C0A8002CC0A8000404000400001A2DE8000102030405060708090A0B0C0D0E0F1011E6C53DB2";

begin
fcs : fcs_check_serial PORT MAP (

	clk => clk,
	reset => reset,
	start_of_frame => start_of_frame,
	end_of_frame => end_of_frame,
	data_in => data_in,
	fcs_error => fcs_error

	);

clock : PROCESS

   begin
	
   wait for 10 ns; 
	clk <= not clk;

end PROCESS clock;

stimulus : PROCESS
	
   begin
	
	-- before end invertion P <= not P1(511 downto 480) & P1(479 downto 32) & not P1(31 downto 0);
	-- end inversion P <= not P1(511 downto 480) & P1(479 downto 0);
	P <= P1;

   wait for 5 ns; reset  <= '1';
   wait for 14 ns; reset  <= '0';
wait for 5 ns; enable <= '1';
	
   wait;
end PROCESS stimulus;




dataFeeder : PROCESS(clk,reset)

begin
	if reset = '1' then
		i <= 511; 
		data_in <= '0';
		start_of_frame <= '1';
		end_of_frame <= '0';
		
	else
		
		if rising_edge(clk) then
		
			if (enable = '1') then

				if i >= 0 then
	
					--if (i < 511) then
					data_in <= P(i);
					start_of_frame <= '0';
					--end if;
					
					-- Handle end of frame
					if i = 32 then
						end_of_frame <= '1';
						
					else
						end_of_frame <= '0';
					end if;
					
					if i>0 then
					i<= i-1;
					end if;
			end if;
		end if;
			
		end if;

	end if;

end PROCESS dataFeeder;


end  fcs_check_serial_tb_arch;




