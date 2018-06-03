-----------------------------------------------------------------------------------
-- Engineer: 	   Salaheddin Hetalani
-- Create Date:    00:13:45 06/11/2017 
-- Design Name:    Encryption/Decryption System
-- Module Name:    Decryptor - Behavioral 
-- Project Name:   EncDecSys
-- Description: 
-- Revision: 
-- Revision 0.01 - File Created
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decryptor is
port(  
--------------------------------- Inputs ------------------------------------------
	clk:            in std_logic;			 -- clock signal
	rst:            in std_logic; 			 -- reset signal
   	en:  		in std_logic;			 -- enable signal from the Encryptor
	encDout: 	in std_logic_vector(7 downto 0); -- data out from the Encryptor
	modeSyn: 	in std_logic;			 -- general mode of the system
	perBit0ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit0 of data
	perBit1ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit1 of data 
	perBit2ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit2 of data
	perBit3ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit3 of data
	perBit4ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit4 of data
	perBit5ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit5 of data
	perBit6ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit6 of data
	perBit7ModeSyn: in std_logic_vector(2 downto 0); -- permutation mode of bit7 of data
	shiftModeSyn: 	in std_logic_vector(1 downto 0); -- shift amount of the shift stage
-------------------------------- Outputs ------------------------------------------
	v:  		out std_logic;	  					 -- valid output signal of the system
	dout:  		out std_logic_vector(7 downto 0) -- decrypted output of the system
  );
end Decryptor;

architecture Behavioral of Decryptor is
-------------------------------- Constants ----------------------------------------
constant  k1: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(49), 8)); 
constant  k2: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(129), 8));
constant  k3: std_logic_vector(7 downto 0):= std_logic_vector(to_unsigned(integer(136), 8));
-------------------------------- Signals -----------------------------------------
signal currentMode: std_logic;

signal decXor: std_logic_vector(7 downto 0);
signal normalKeysMode: std_logic_vector(1 downto 0);
signal superKeysMode: std_logic_vector(2 downto 0);

signal perEnable: std_logic;
signal decPer: std_logic_vector(7 downto 0);
signal perBit0currentMode: std_logic_vector(2 downto 0);
signal perBit1currentMode: std_logic_vector(2 downto 0);
signal perBit2currentMode: std_logic_vector(2 downto 0);
signal perBit3currentMode: std_logic_vector(2 downto 0);
signal perBit4currentMode: std_logic_vector(2 downto 0);
signal perBit5currentMode: std_logic_vector(2 downto 0);
signal perBit6currentMode: std_logic_vector(2 downto 0);
signal perBit7currentMode: std_logic_vector(2 downto 0);

signal shiftEnable: std_logic;
signal decShift: std_logic_vector(7 downto 0);
signal nextShiftMode: std_logic_vector(1 downto 0);
signal currentShiftMode: std_logic_vector(1 downto 0);

begin
---------------------------------- XOR Stage -------------------------------------
xorStage: process(clk, rst)
	variable oldkeysReg : std_logic_vector(23 downto 0);
	begin
	  if rst = '0' then -- ascynchrous reset
		 perEnable 	    <= '0'; 
		 decXor    	    <= (others => '0');
		 normalKeysMode     <= "00";
		 superKeysMode      <= "000";		 
		 perBit0currentMode <= (others => '0');
		 perBit1currentMode <= (others => '0');
		 perBit2currentMode <= (others => '0');
		 perBit3currentMode <= (others => '0');
		 perBit4currentMode <= (others => '0');
		 perBit5currentMode <= (others => '0');
		 perBit6currentMode <= (others => '0');
		 perBit7currentMode <= (others => '0');
		 currentMode	    <= '0';
		 nextShiftMode      <= (others => '0'); 
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if en = '1' then
			if modeSyn = '0' then -- normal mode --
			  case normalKeysMode is
			  when "00"   =>  decXor <= encDout xor k1; 
		 	  when "01"   =>  decXor <= encDout xor k2; 		
		 	  when "10"   =>  decXor <= encDout xor k3;
		  	  when others =>  decXor <= encDout xor k1; 				
			  end case;	
			  normalKeysMode <= normalKeysMode + "01";
			  superKeysMode <= "000";
			  perEnable <= '1'; -- enabling the permutation stage
			else -- configuration mode --
			  case superKeysMode is
			  when "000"   =>  decXor <= encDout xor k1; 
		 	  when "001"   =>  decXor <= encDout xor k1; 		
		 	  when "010"   =>  decXor <= encDout xor k2;
			  when "011"   =>  decXor <= encDout xor k2; 
		 	  when "100"   =>  decXor <= encDout xor k3; 		
		 	  when "101"   =>  decXor <= encDout xor k3;
		 	  when "110"   =>  decXor <= encDout xor k1;
		  	  when others  =>  decXor <= encDout xor k1; 				
			  end case;	
			  superKeysMode <= superKeysMode + "01";
			  normalKeysMode <= "00";		
			  perBit0currentMode <= perBit0ModeSyn; -- passing values to the next stage of pipeline
			  perBit1currentMode <= perBit1ModeSyn; -- passing values to the next stage of pipeline
			  perBit2currentMode <= perBit2ModeSyn; -- passing values to the next stage of pipeline
			  perBit3currentMode <= perBit3ModeSyn; -- passing values to the next stage of pipeline
			  perBit4currentMode <= perBit4ModeSyn; -- passing values to the next stage of pipeline
			  perBit5currentMode <= perBit5ModeSyn; -- passing values to the next stage of pipeline
		     	  perBit6currentMode <= perBit6ModeSyn; -- passing values to the next stage of pipeline
			  perBit7currentMode <= perBit7ModeSyn; -- passing values to the next stage of pipeline
			  perEnable <= '1'; -- enabling the permutation stage
			end if;				
			currentMode	   <= modeSyn; -- passing values to the next stage of pipeline
			nextShiftMode  <= shiftModeSyn;   -- passing values to the next stage of pipeline
		 else 
		   	perEnable <= '0'; -- enabling the permutation stage
		 end if;
	  end if;
	end process;	
-------------------------------- Permutation Stage --------------------------------
perStage: process(clk, rst)
--	   variable decXor : std_logic_vector(7 downto 0);
	begin
	  if rst = '0' then -- ascynchrous reset
		 shiftEnable 	  <= '0';
		 decPer      	  <= (others => '0');
		 currentShiftMode <= (others => '0');
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if perEnable = '1' then
			if currentMode = '0' then -- normal mode: permute the bits of each byte 
			  decPer(0) <= decXor(1); -- according to the following pattern 
			  decPer(1) <= decXor(2); -- {1, 6, 5, 4, 8, 7, 3, 2}
			  decPer(2) <= decXor(6);
			  decPer(3) <= decXor(7);
			  decPer(4) <= decXor(3);
			  decPer(5) <= decXor(4);
			  decPer(6) <= decXor(5);
			  decPer(7) <= decXor(0);		  
			  shiftEnable <= '1';     -- enable shift stage
			else -- configuration mode: permute the bits of each byte based on the user input
			  decPer(to_integer(unsigned(perBit0currentMode))) <= decXor(0);
			  decPer(to_integer(unsigned(perBit1currentMode))) <= decXor(1);
			  decPer(to_integer(unsigned(perBit2currentMode))) <= decXor(2);
			  decPer(to_integer(unsigned(perBit3currentMode))) <= decXor(3);
			  decPer(to_integer(unsigned(perBit4currentMode))) <= decXor(4);
			  decPer(to_integer(unsigned(perBit5currentMode))) <= decXor(5);
			  decPer(to_integer(unsigned(perBit6currentMode))) <= decXor(6);
			  decPer(to_integer(unsigned(perBit7currentMode))) <= decXor(7);
			  shiftEnable <= '1';     -- enable shift stage
			end if;
			  currentShiftMode <= nextShiftMode; -- passing values to the next stage of pipeline			
		 else 
			shiftEnable <= '0';
		 end if;
	  end if;
	end process;			
-------------------------------- Shift Stage -------------------------------------
shiftStage: process(clk, rst)
--      variable decShift : std_logic_vector(7 downto 0):= (others => '0');
	begin
	  if rst = '0' then -- ascynchrous reset
		 v <= '0';
		 decShift <= (others => '0');
	  elsif (clk='1' and clk'event) then -- rising edge of the clock
		 if shiftEnable = '1' then 				
			if decPer <= "01111010" and decPer >= "01100001" then -- ASCII lower case letter 
				case currentShiftMode is -- shift amount could vary from 1 to 4 based on user input
				when "00"   => if	decPer = "01100001" then decShift <= "01111010"; -- a > z
									elsif decPer = "01111010" then decShift <= "01111001"; -- z > y
									elsif decPer = "01111001" then decShift <= "01111000"; -- y > x
									elsif decPer = "01111000" then decShift <= "01110111"; -- x > w
									else  decShift <= decPer - "00000001"; -- shift left by 1
									end if;
				when "01"   => if 	decPer = "01100010" then decShift <= "01111010"; -- b > z
									elsif decPer = "01100001" then decShift <= "01111001"; -- a > y
									elsif decPer = "01111010" then decShift <= "01111000"; -- z > x
									elsif decPer = "01111001" then decShift <= "01110111"; -- y > w
									else 	decShift <= decPer - "00000010"; -- shift left by 2
									end if;
				when "10"   => if 	decPer = "01100011" then decShift <= "01111010"; -- c > z
									elsif decPer = "01100010" then decShift <= "01111001"; -- b > y
									elsif decPer = "01100001" then decShift <= "01111000"; -- a > x
									elsif decPer = "01111010" then decShift <= "01110111"; -- z > w
									else 	decShift <= decPer - "00000011"; -- shift left by 3
									end if;
				when others => if 	decPer = "01100100" then decShift <= "01111010"; -- d > z
									elsif decPer = "01100011" then decShift <= "01111001"; -- c > y
									elsif decPer = "01100010" then decShift <= "01111000"; -- b > x
									elsif decPer = "01100001" then decShift <= "01110111"; -- a > w
									else 	decShift <= decPer - "00000100"; -- shift left by 4
									end if;					
				end case;
				v <= '1';      -- set signal v to declare that the output signal is valid
			elsif decPer <= "01011010" and decPer >= "01000001" then -- ASCII upper case letter
				case currentShiftMode is -- shift amount could vary from 1 to 4 based on user input
				when "00"   => if	decPer = "01000001" then decShift <= "01011010"; -- A > Z
									elsif decPer = "01011010" then decShift <= "01011001"; -- Z > Y
									elsif decPer = "01011001" then decShift <= "01011000"; -- Y > X
									elsif decPer = "01011000" then decShift <= "01010111"; -- X > W
									else  decShift <= decPer - "00000001"; -- shift left by 1
									end if;
				when "01"   => if	decPer = "01000010" then decShift <= "01011010"; -- B > Z
									elsif decPer = "01000001" then decShift <= "01011001"; -- A > Y
									elsif decPer = "01011010" then decShift <= "01011000"; -- Z > X
									elsif decPer = "01011001" then decShift <= "01010111"; -- Y > W
									else  decShift <= decPer - "00000010"; -- shift left by 2
									end if;
				when "10"   => if    	decPer = "01000011" then decShift <= "01011010"; -- C > Z
									elsif decPer = "01000010" then decShift <= "01011001"; -- B > Y
									elsif decPer = "01000001" then decShift <= "01011000"; -- A > X
									elsif decPer = "01011010" then decShift <= "01010111"; -- Z > W
									else  decShift <= decPer - "00000011"; -- shift left by 3
									end if;
				when others => if  	decPer = "01000100" then decShift <= "01011010"; -- D > Z
									elsif decPer = "01000011" then decShift <= "01011001"; -- C > Y
									elsif decPer = "01000010" then decShift <= "01011000"; -- B > X
									elsif decPer = "01000001" then decShift <= "01010111"; -- A > W
									else  decShift <= decPer - "00000100"; -- shift left by 4
								 	end if;
				
				end case;	
				v <= '1';	 -- set signal v to declare that the output signal is valid		
			else
				decShift <= decPer; -- other ASCII leters - don't shift
				v <= '1';    -- set signal v to declare that the output signal is valid
			end if;
		 else 
			v <= '0';
		 end if;
	  end if;
   end process;	
		
dout <= decShift; -- decrypted output of the system

end Behavioral;
