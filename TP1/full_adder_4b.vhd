-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"
-- CREATED		"Tue Apr 15 17:06:12 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY full_adder_4b IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		A0 :  IN  STD_LOGIC;
		B0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		B1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		B2 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		B3 :  IN  STD_LOGIC;
		S0 :  OUT  STD_LOGIC;
		S1 :  OUT  STD_LOGIC;
		S2 :  OUT  STD_LOGIC;
		S3 :  OUT  STD_LOGIC;
		Cout :  OUT  STD_LOGIC
	);
END full_adder_4b;

ARCHITECTURE bdf_type OF full_adder_4b IS 

COMPONENT full_adder
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Cin : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : full_adder
PORT MAP(A => A0,
		 B => B0,
		 Cin => Cin,
		 S => S0,
		 Cout => SYNTHESIZED_WIRE_0);


b2v_inst1 : full_adder
PORT MAP(A => A1,
		 B => B1,
		 Cin => SYNTHESIZED_WIRE_0,
		 S => S1,
		 Cout => SYNTHESIZED_WIRE_1);


b2v_inst2 : full_adder
PORT MAP(A => A2,
		 B => B2,
		 Cin => SYNTHESIZED_WIRE_1,
		 S => S2,
		 Cout => SYNTHESIZED_WIRE_2);


b2v_inst3 : full_adder
PORT MAP(A => A3,
		 B => B3,
		 Cin => SYNTHESIZED_WIRE_2,
		 S => S3,
		 Cout => Cout);


END bdf_type;