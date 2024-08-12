-- Listing 3.20
-- Example 0 0001 10000010 - 0,26
--        +0 0000 10000010 - 0,13
--        =0 0001 11000011 - 0,39
-- Display should result in 0C31
-- Example 1 1001 10000011 - -67,072
--        +0 1010 10000110 - 137.216
--        =0 1001 10001010 - 70,656
-- Display should result in 08A9
-- 7seg starts on the second element
-- May want to check the dot thingy
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fp_adder_test is
   port(
      MAX10_CLK1_50: in std_logic;
      SW: in std_logic_vector(9 downto 0);
      KEY: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0);
		frac_oute: out std_logic_vector(7 downto 0);
		expo_oute: out std_logic_vector(3 downto 0);
		sigue_oute: out std_logic;
		oy_mate: out std_logic;
		lede0, lede1, lede2, lede3: out std_logic_vector(7 downto 0);
		HEX5, HEX4, HEX3, HEX2: out std_logic_vector(7 downto 0)
   );
end fp_adder_test;

architecture arch of fp_adder_test is
   -- May want to set default values
   signal sign1, sign2: std_logic;
   signal exp1, exp2: std_logic_vector(3 downto 0);
   signal frac1, frac2: std_logic_vector(7 downto 0);
   signal sign_out: std_logic;
   signal exp_out: std_logic_vector(3 downto 0);
   signal frac_out: std_logic_vector(7 downto 0);
   signal led3, led2, led1, led0:
             std_logic_vector(7 downto 0);
begin
   -- set up the fp adder input signals, use first button to set the values
	-- last two switches function as selectors
   process (KEY)
   begin
      if (rising_edge(KEY(0))) then
         case SW(1 downto 0) is
            when "00" =>
               frac1 <= SW(9 downto 2);
					oy_mate <= '1';
            when "01" =>
               sign1 <= SW(9);
               exp1 <= SW(8 downto 5);
            when "10" =>
               frac2 <= SW(9 downto 2);
            when others =>
               sign2 <= SW(9);
               exp2 <= SW(8 downto 5);
         end case;
      end if;
   end process;

   -- instantiate fp adder
   fp_add_unit: entity work.fp_adder
      port map(
         sign1=>sign1, sign2=>sign2, exp1=>exp1, exp2=>exp2,
         frac1=>frac1, frac2=>frac2,
         sign_out=>sign_out, exp_out=>exp_out,
         frac_out=>frac_out
      );
		
	-- AI ai AIAI
	expo_oute <= exp_out;
	frac_oute <= frac_out;
	sigue_oute <= sign_out;

   -- instantiate three instances of hex decoders
   -- exponent
   sseg_unit_0: entity work.hex_to_sseg
      port map(hex=>exp_out, dp=>'0', sseg=>led0);
   -- 4 LSBs of fraction
   sseg_unit_1: entity work.hex_to_sseg
      port map(hex=>frac_out(3 downto 0),
               dp=>'1', sseg=>led1);
   -- 4 MSBs of fraction
   sseg_unit_2: entity work.hex_to_sseg
      port map(hex=>frac_out(7 downto 4),
               dp=>'0', sseg=>led2);
   -- sign
   led3 <= "11111110" when sign_out='1' else -- middle bar
           "11111111";                       -- blank
   
	-- Ui ui ui
	lede0 <= led0(7 downto 0);
	lede1 <= led1(7 downto 0);
	lede2 <= led2(7 downto 0);
	lede3 <= led3(7 downto 0);
	
	-- Dirty hack
	HEX5 <= led3(7 downto 0);
	HEX4 <= led2(7 downto 0);
	HEX3 <= led1(7 downto 0);
	HEX2 <= led0(7 downto 0);
	
   -- instantiate 7-seg LED display time-multiplexing module
   disp_unit: entity work.disp_mux
      port map(
         clk=>MAX10_CLK1_50, reset=>'0',
         in0=>led0, in1=>led1, in2=>led2, in3=>led3,
         an=>an, sseg=>sseg
      );
end arch;
