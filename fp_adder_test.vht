-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "08/12/2024 17:00:12"
                                                            
-- Vhdl Test Bench template for design  :  fp_adder_test
-- 
-- Simulation tool : QuestaSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fp_adder_test_vhd_tst IS
END fp_adder_test_vhd_tst;
ARCHITECTURE fp_adder_test_arch OF fp_adder_test_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL exp_test : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL frac_test : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL dsp0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dsp1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dsp2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dsp3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL sign_test : STD_LOGIC;
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT fp_adder_test
	PORT (
	exp_test : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	frac_test : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	dsp0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	dsp1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	dsp2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	dsp3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	sign_test : OUT STD_LOGIC;
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : fp_adder_test
	PORT MAP (
-- list connections between master ports and signals
	exp_test => exp_test,
	frac_test => frac_test,
	KEY => KEY,
	dsp0 => dsp0,
	dsp1 => dsp1,
	dsp2 => dsp2,
	dsp3 => dsp3,
	sign_test => sign_test,
	SW => SW
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once
		  KEY(1) <= '1';
        SW <= "1000001100";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0011000001";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1100001110";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0010000011";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
	
        SW <= "1111001100";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0010000001";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1010001110";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1011000011";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  
		  SW <= "1001011000";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0101000001";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1001011010";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1101000011";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
	
        SW <= "1001100100";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0000000001";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1000111110";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1000000011";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  
		  SW <= "1100100000";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0101000001";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "1010010110";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
		  SW <= "0100100011";
		  KEY(0) <= '0'; wait for 50 ns;
		  KEY(0) <= '1'; wait for 50 ns;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END fp_adder_test_arch;
