-----------------------------------------------------------------------------------
-- Engineer: 	   Salaheddin Hetalani
-- Create Date:    18:02:33 05/11/2017 
-- Design Name:    Encryption/Decryption System
-- Module Name:    Encryptor - Behavioral 
-- Project Name:   EncDecSys
-- Description: 
-- Revision: 
-- Revision 0.01 - File Created
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Encryptor is
port(  
--------------------------------- Inputs ------------------------------------------
   	clk:             in std_logic;
	rst:             in std_logic;
	en:              in std_logic;
	din:     	 in std_logic_vector(7 downto 0);
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
-------------------------------- Outputs ------------------------------------------
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
	v: 		 out std_logic;	  
	encDout: 	 out std_logic_vector(7 downto 0)
  );
end Encryptor;

architecture Behavioral of Encryptor is
-------------------------------- Constants ----------------------------------------
constant  k1: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(49), 8)); 
constant  k2: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(129), 8));
constant  k3: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(136), 8));
-------------------------------- Signals ----------------------------------------
signal nextMode:     	   std_logic;
signal currentMode: 	   std_logic;

signal encShift:           std_logic_vector(7 downto 0);
signal nextShiftMode:      std_logic_vector(1 downto 0);
signal currentShiftMode:   std_logic_vector(1 downto 0);

signal perEnable :         std_logic;
signal encPer:             std_logic_vector(7 downto 0);
signal perBit0nextMode:    std_logic_vector(2 downto 0);
signal perBit1nextMode:    std_logic_vector(2 downto 0);
signal perBit2nextMode:    std_logic_vector(2 downto 0);
signal perBit3nextMode:    std_logic_vector(2 downto 0);
signal perBit4nextMode:    std_logic_vector(2 downto 0);
signal perBit5nextMode:    std_logic_vector(2 downto 0);
signal perBit6nextMode:    std_logic_vector(2 downto 0);
signal perBit7nextMode:    std_logic_vector(2 downto 0);
signal perBit0currentMode: std_logic_vector(2 downto 0);
signal perBit1currentMode: std_logic_vector(2 downto 0);
signal perBit2currentMode: std_logic_vector(2 downto 0);
signal perBit3currentMode: std_logic_vector(2 downto 0);
signal perBit4currentMode: std_logic_vector(2 downto 0);
signal perBit5currentMode: std_logic_vector(2 downto 0);
signal perBit6currentMode: std_logic_vector(2 downto 0);
signal perBit7currentMode: std_logic_vector(2 downto 0);

signal xorEnable: 	   std_logic;
signal encXor: 		   std_logic_vector(7 downto 0);
signal normalKeysMode:     std_logic_vector(1 downto 0);
signal superKeysMode: 	   std_logic_vector(2 downto 0);


begin
-------------------------------- Shift Stage -------------------------------------
-------------- shift amount could vary from 1 to 4 based on user input -----------
-------------- 00 > shift right by 1 ----- 01 > shift right by 2 -----------------
-------------- 10 > shift right by 3 ----- 11 > shift right by 4 -----------------
shiftStage: process(clk, rst)
	begin
	  if rst = '0' then -- ascynchrous reset
		 perEnable 	 <= '0';
		 encShift 	 <= (others => '0');
		 nextMode        <= '0';        
		 nextShiftMode   <= (others => '0');
		 perBit0nextMode <= (others => '0');
		 perBit1nextMode <= (others => '0');
		 perBit2nextMode <= (others => '0');
		 perBit3nextMode <= (others => '0');
		 perBit4nextMode <= (others => '0');
		 perBit5nextMode <= (others => '0');
		 perBit6nextMode <= (others => '0');
		 perBit7nextMode <= (others => '0');
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if en = '1' then 
			if din <= "01111010" and din >= "01100001" then -- ASCII lower case letter
				case din is
				when "01110111" => if    shiftMode = "00" then encShift <= "01111000";-- w > x 
										 elsif shiftMode = "01" then encShift <= "01111001";-- w > y
										 elsif shiftMode = "10" then encShift <= "01111010";-- w > z
										 else  encShift <= "01100001"; -- w > a
										 end if;
				when "01111000" => if    shiftMode = "00" then encShift <= "01111001";-- x > y
										 elsif shiftMode = "01" then encShift <= "01111010";-- x > z
										 elsif shiftMode = "10" then encShift <= "01100001";-- x > a
										 else  encShift <= "01100010"; -- x > b
										 end if;
				when "01111001" => if    shiftMode = "00" then encShift <= "01111010";-- y > z
										 elsif shiftMode = "01" then encShift <= "01100001";-- y > a
										 elsif shiftMode = "10" then encShift <= "01100010";-- y > b
										 else  encShift <= "01100011"; -- y > c
										 end if;
				when "01111010" => if    shiftMode = "00" then encShift <= "01100001";-- z > a
										 elsif shiftMode = "01" then encShift <= "01100010";-- z > b
										 elsif shiftMode = "10" then encShift <= "01100011";-- z > c
										 else  encShift <= "01100100"; -- z > d
										 end if;
				when others     => encShift <= din + shiftMode + "01"; -- shift right by shift amount
				perEnable <= '1';	 -- enalbe permutation stage		
				end case;
			elsif din <= "01011010" and din >= "01000001" then -- ASCII upper case letter
				case din is 
				when "01010111" => if    shiftMode = "00" then encShift <= "01011000";-- W > X
										 elsif shiftMode = "01" then encShift <= "01011001";-- W > Y
										 elsif shiftMode = "10" then encShift <= "01011010";-- W > Z
										 else  encShift <= "01000001"; -- W > A
										 end if;
				when "01011000" => if    shiftMode = "00" then encShift <= "01011001";-- X > Y
										 elsif shiftMode = "01" then encShift <= "01011010";-- X > Z
										 elsif shiftMode = "10" then encShift <= "01000001";-- X > A
										 else  encShift <= "01000010"; -- X > B
										 end if;
				when "01011001" => if    shiftMode = "00" then encShift <= "01011010";-- Y > Z
										 elsif shiftMode = "01" then encShift <= "01000001";-- Y > A
										 elsif shiftMode = "10" then encShift <= "01000010";-- Y > B
										 else  encShift <= "01000011"; -- Y > C
										 end if;
				when "01011010" => if    shiftMode = "00" then encShift <= "01000001";-- Z > A
										 elsif shiftMode = "01" then encShift <= "01000010";-- Z > B
										 elsif shiftMode = "10" then encShift <= "01000011";-- Z > C
										 else  encShift <= "01000100"; -- Z > D
										 end if;
				when others     => encShift <= din + shiftMode + "01"; -- shift right by shift amount
				end case;	
				perEnable <= '1';	 -- enalbe permutation stage				
			else
			  	encShift  <= din;   -- other ASCII leters - don't shift
			  	perEnable <= '1';   -- enalbe permutation stage
			end if;
			nextMode        <= mode;        -- passing values to the next stage of pipeline
			nextShiftMode   <= shiftMode;   -- passing values to the next stage of pipeline
			perBit0nextMode <= perBit0Mode; -- passing values to the next stage of pipeline
			perBit1nextMode <= perBit1Mode; -- passing values to the next stage of pipeline
			perBit2nextMode <= perBit2Mode; -- passing values to the next stage of pipeline
			perBit3nextMode <= perBit3Mode; -- passing values to the next stage of pipeline
			perBit4nextMode <= perBit4Mode; -- passing values to the next stage of pipeline
			perBit5nextMode <= perBit5Mode; -- passing values to the next stage of pipeline
			perBit6nextMode <= perBit6Mode; -- passing values to the next stage of pipeline
			perBit7nextMode <= perBit7Mode; -- passing values to the next stage of pipeline
		 else 
			perEnable  <= '0';
		 end if;
	  end if;
   end process;	
-------------------------------- Permutation Stage --------------------------------
perStage: process(clk, rst)
--      variable encPer : std_logic_vector(7 downto 0);
	begin
	  if rst = '0' then -- ascynchrous reset
		 xorEnable          <= '0';
		 encPer     	    <= (others => '0');
		 perBit0currentMode <= (others => '0');
		 perBit1currentMode <= (others => '0');
		 perBit2currentMode <= (others => '0');
		 perBit3currentMode <= (others => '0');
		 perBit4currentMode <= (others => '0');
		 perBit5currentMode <= (others => '0');
		 perBit6currentMode <= (others => '0');
		 perBit7currentMode <= (others => '0'); 
		 currentMode        <= '0';
		 currentShiftMode   <= (others => '0');
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if perEnable = '1' then 
			if nextMode = '0' then      -- normal mode: permute the bits of each byte
			  encPer(0) <= encShift(7); -- according to the following pattern
			  encPer(1) <= encShift(0); -- {4, 3, 7, 6, 5, 2, 1, 8}
			  encPer(2) <= encShift(1);
			  encPer(3) <= encShift(4);
			  encPer(4) <= encShift(5);
			  encPer(5) <= encShift(6);
			  encPer(6) <= encShift(2);
			  encPer(7) <= encShift(3);	  
			  xorEnable <= '1'; -- enable XOR stage			  
			else -- configuration mode: permute the bits of each byte based on the user input
			  encPer(0) <= encShift(to_integer(unsigned(perBit0nextMode)));
			  encPer(1) <= encShift(to_integer(unsigned(perBit1nextMode)));
			  encPer(2) <= encShift(to_integer(unsigned(perBit2nextMode)));
			  encPer(3) <= encShift(to_integer(unsigned(perBit3nextMode)));
			  encPer(4) <= encShift(to_integer(unsigned(perBit4nextMode)));
			  encPer(5) <= encShift(to_integer(unsigned(perBit5nextMode)));
			  encPer(6) <= encShift(to_integer(unsigned(perBit6nextMode)));
			  encPer(7) <= encShift(to_integer(unsigned(perBit7nextMode)));	
			  perBit0currentMode <= perBit0nextMode; -- passing values to the next stage of pipeline
			  perBit1currentMode <= perBit1nextMode; -- passing values to the next stage of pipeline
			  perBit2currentMode <= perBit2nextMode; -- passing values to the next stage of pipeline
			  perBit3currentMode <= perBit3nextMode; -- passing values to the next stage of pipeline
			  perBit4currentMode <= perBit4nextMode; -- passing values to the next stage of pipeline
			  perBit5currentMode <= perBit5nextMode; -- passing values to the next stage of pipeline
			  perBit6currentMode <= perBit6nextMode; -- passing values to the next stage of pipeline
			  perBit7currentMode <= perBit7nextMode; -- passing values to the next stage of pipeline			  
			  xorEnable <= '1'; -- enable XOR stage				
			end if;
			currentMode      <= nextMode; -- passing values to the next stage of pipeline
			currentShiftMode <= nextShiftMode; -- passing values to the next stage of pipeline
		 else 
			xorEnable <= '0';		  
		 end if;		  
	  end if;
   end process;
	
xorStage: process(clk, rst) 
	begin
	  if rst = '0' then -- ascynchrous reset
		 v 		<= '0';
		 encXor  	<= (others => '0');
		 normalKeysMode <= "00";
		 superKeysMode  <= "000";		 
		 perBit0ModeSyn <= (others => '0');
		 perBit1ModeSyn <= (others => '0');
		 perBit2ModeSyn <= (others => '0');
		 perBit3ModeSyn <= (others => '0');		 
		 perBit4ModeSyn <= (others => '0');		
		 perBit5ModeSyn <= (others => '0');
		 perBit6ModeSyn <= (others => '0');	
		 perBit7ModeSyn <= (others => '0');			
		 ModeSyn 	<= '0';	
		 shiftModeSyn   <= (others => '0');			 
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if xorEnable = '1' then 
			if currentMode = '0' then -- normal mode --
			  case normalKeysMode is
			  when "00"   =>  encXor <= encPer xor k1; 
		 	  when "01"   =>  encXor <= encPer xor k2; 		
		 	  when "10"   =>  encXor <= encPer xor k3;
		  	  when others =>  encXor <= encPer xor k1; 				
			  end case;	
			  normalKeysMode <= normalKeysMode + "01";
			  superKeysMode <= "000";
			  v <= '1'; -- set signal v to declare that the output signal is valid
			else -- configuration mode --
			  case superKeysMode is
			  when "000"   =>  encXor <= encPer xor k1; 
		 	  when "001"   =>  encXor <= encPer xor k1; 		
		 	  when "010"   =>  encXor <= encPer xor k2;
			  when "011"   =>  encXor <= encPer xor k2; 
		 	  when "100"   =>  encXor <= encPer xor k3; 		
		 	  when "101"   =>  encXor <= encPer xor k3;
		 	  when "110"   =>  encXor <= encPer xor k1;
		  	  when others  =>  encXor <= encPer xor k1; 				
			  end case;	
			  superKeysMode  <= superKeysMode + "01";
			  normalKeysMode <= "00";
		     	  perBit0ModeSyn <= perBit0currentMode; -- syncronize values with decryptor
		     	  perBit1ModeSyn <= perBit1currentMode; -- syncronize values with decryptor
		     	  perBit2ModeSyn <= perBit2currentMode; -- syncronize values with decryptor
		     	  perBit3ModeSyn <= perBit3currentMode; -- syncronize values with decryptor
		     	  perBit4ModeSyn <= perBit4currentMode; -- syncronize values with decryptor
		     	  perBit5ModeSyn <= perBit5currentMode; -- syncronize values with decryptor
		     	  perBit6ModeSyn <= perBit6currentMode; -- syncronize values with decryptor
		     	  perBit7ModeSyn <= perBit7currentMode; -- syncronize values with decryptor
			  v              <= '1'; -- set signal v to declare that the output signal is valid
			end if;
			modeSyn        <= currentMode; -- syncronize values with decryptor
		 	shiftModeSyn   <= currentShiftMode; -- syncronize values with decryptor
		 else 
			v <= '0';
		 end if;		  
	  end if;
   end process;		  	  
	
encDout <= encXor; -- encrypted output of the encryptor

end Behavioral;
