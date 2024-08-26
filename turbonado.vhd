library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fp_adder_test is
   port(
      SW: in std_logic_vector(9 downto 0);
      KEY: in std_logic_vector(1 downto 0);
		frac_test: out std_logic_vector(7 downto 0);
		exp_test: out std_logic_vector(3 downto 0);
		sign_test: out std_logic;
		dsp0, dsp1, dsp2, dsp3: out std_logic_vector(7 downto 0);
		HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(7 downto 0)
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
		
   exp_test <= exp_out;
   frac_test <= frac_out;
   sign_test <= sign_out;

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
   led3 <= "10111111" when sign_out='1' else -- middle bar
           "11111111";                       -- blank
   
	dsp0 <= led0(7 downto 0);
	dsp1 <= led1(7 downto 0);
	dsp2 <= led2(7 downto 0);
	dsp3 <= led3(7 downto 0);
	
	HEX5 <= led3(7 downto 0);
	HEX4 <= led2(7 downto 0);
	HEX3 <= led1(7 downto 0);
	HEX2 <= led0(7 downto 0);
	HEX1 <= "11111111";
	HEX0 <= "11111111";
	
end arch;
