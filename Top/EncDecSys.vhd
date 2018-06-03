-----------------------------------------------------------------------------------
-- Engineer: 	   Salaheddin Hetalani
-- Create Date:    22:40:19 09/11/2017 
-- Design Name:    Encryption/Decryption System
-- Module Name:    EncDecSys - Behavioral 
-- Project Name:   EncDecSys
-- Description: 
-- Revision: 
-- Revision 0.01 - File Created
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity EncDecSys is
port(  
--------------------------------- Inputs ------------------------------------------
	clk:          in std_logic;
	rst:          in std_logic;
	en:           in std_logic;
	din:  	      in std_logic_vector(7 downto 0);
	mode:  	      in std_logic;
	shiftMode:    in std_logic_vector(1 downto 0);
	perBit0Mode:  in std_logic_vector(2 downto 0);
	perBit1Mode:  in std_logic_vector(2 downto 0);		 
	perBit2Mode:  in std_logic_vector(2 downto 0);
	perBit3Mode:  in std_logic_vector(2 downto 0);
	perBit4Mode:  in std_logic_vector(2 downto 0);
	perBit5Mode:  in std_logic_vector(2 downto 0);
	perBit6Mode:  in std_logic_vector(2 downto 0);
	perBit7Mode:  in std_logic_vector(2 downto 0);
--------------------------------- Outputs -----------------------------------------
	v:  	      out std_logic;	  
	dout:  	      out std_logic_vector(7 downto 0)
  );
end EncDecSys;

architecture Behavioral of EncDecSys is

---------------------------- Components Declaration ------------------------------
---------------------------------- Encryptor -------------------------------------
component Encryptor is
port(
----------------------------------- Inputs ---------------------------------------
   	clk:             in std_logic;
	rst:             in std_logic;
	en:              in std_logic;
 	din:             in std_logic_vector(7 downto 0);
	mode:  		 in std_logic;
	shiftMode:       in std_logic_vector(1 downto 0);
	perBit0Mode:     in std_logic_vector(2 downto 0);
	perBit1Mode:     in std_logic_vector(2 downto 0);		 
	perBit2Mode:     in std_logic_vector(2 downto 0);
	perBit3Mode:     in std_logic_vector(2 downto 0);
	perBit4Mode:     in std_logic_vector(2 downto 0);
	perBit5Mode:     in std_logic_vector(2 downto 0);
	perBit6Mode:     in std_logic_vector(2 downto 0);
	perBit7Mode:     in std_logic_vector(2 downto 0);
----------------------------------- Outputs -------------------------------------
	modeSyn:  	 out std_logic;
	shiftModeSyn:    out std_logic_vector(1 downto 0);
	perBit0ModeSyn:  out std_logic_vector(2 downto 0);
	perBit1ModeSyn:  out std_logic_vector(2 downto 0);
	perBit2ModeSyn:  out std_logic_vector(2 downto 0);
	perBit3ModeSyn:  out std_logic_vector(2 downto 0);
	perBit4ModeSyn:  out std_logic_vector(2 downto 0);
	perBit5ModeSyn:  out std_logic_vector(2 downto 0);
	perBit6ModeSyn:  out std_logic_vector(2 downto 0);
	perBit7ModeSyn:  out std_logic_vector(2 downto 0);		
	v: 	         out std_logic;	  
	encDout:         out std_logic_vector(7 downto 0)
  );
end component;
---------------------------------- Decryptor -------------------------------------
component Decryptor is
port(  
----------------------------------- Inputs ---------------------------------------
	clk:            in std_logic;
   	rst:            in std_logic;
   	en:  		in std_logic;
	encDout: 	in std_logic_vector(7 downto 0);
	modeSyn: 	in std_logic;
	perBit0ModeSyn: in std_logic_vector(2 downto 0);
	perBit1ModeSyn: in std_logic_vector(2 downto 0);
	perBit2ModeSyn: in std_logic_vector(2 downto 0);
	perBit3ModeSyn: in std_logic_vector(2 downto 0);
	perBit4ModeSyn: in std_logic_vector(2 downto 0);
	perBit5ModeSyn: in std_logic_vector(2 downto 0);
	perBit6ModeSyn: in std_logic_vector(2 downto 0);
	perBit7ModeSyn: in std_logic_vector(2 downto 0);
	shiftModeSyn: 	in std_logic_vector(1 downto 0);
----------------------------------- Outputs -------------------------------------
	v:  				 out std_logic;	  
	dout:  			 out std_logic_vector(7 downto 0)
  );
end component;
------------------------ Intermediate Signals Declaration -----------------------
signal intValid:       std_logic;
signal intData:        std_logic_vector(7 downto 0);
signal intMode:        std_logic;
signal intShiftMode:   std_logic_vector(1 downto 0);
signal intPerBit0Mode: std_logic_vector(2 downto 0);
signal intPerBit1Mode: std_logic_vector(2 downto 0);
signal intPerBit2Mode: std_logic_vector(2 downto 0);
signal intPerBit3Mode: std_logic_vector(2 downto 0);
signal intPerBit4Mode: std_logic_vector(2 downto 0);
signal intPerBit5Mode: std_logic_vector(2 downto 0);
signal intPerBit6Mode: std_logic_vector(2 downto 0);
signal intPerBit7Mode: std_logic_vector(2 downto 0);

begin
-------------------------------- Ports Mapping ----------------------------------
enc: Encryptor port map (clk, rst, en, din, mode, shiftMode, perBit0Mode, perBit1Mode, 
perBit2Mode, perBit3Mode, perBit4Mode, perBit5Mode, perBit6Mode, perBit7Mode, intMode, 
intShiftMode, intPerBit0Mode, intPerBit1Mode, intPerBit2Mode, intPerBit3Mode, 
intPerBit4Mode, intPerBit5Mode, intPerBit6Mode, intPerBit7Mode, intValid, intData);

dec: Decryptor port map (clk, rst, intValid, intData, intMode,  
intPerBit0Mode, intPerBit1Mode, intPerBit2Mode, intPerBit3Mode, intPerBit4Mode, 
intPerBit5Mode, intPerBit6Mode, intPerBit7Mode, intShiftMode, v, dout);

end Behavioral;
