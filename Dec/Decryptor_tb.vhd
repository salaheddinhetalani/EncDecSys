-----------------------------------------------------------------------------------
-- Engineer: 	   Salaheddin Hetalani
-- Create Date:    19:32:57 25/11/2017 
-- Design Name:    Encryption/Decryption System
-- Module Name:    Decryptor_tb.vhd
-- Project Name:   EncDecSys
-- Description: 
-- Revision: 
-- Revision 0.01 - File Created
-----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY Decryptor_tb IS
END Decryptor_tb;
 
ARCHITECTURE behavior OF Decryptor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decryptor
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         encDout : IN  std_logic_vector(7 downto 0);
         modeSyn : IN  std_logic;
         perBit0ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit1ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit2ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit3ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit4ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit5ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit6ModeSyn : IN  std_logic_vector(2 downto 0);
         perBit7ModeSyn : IN  std_logic_vector(2 downto 0);
         shiftModeSyn: IN  std_logic_vector(1 downto 0);
         v : OUT  std_logic;
         dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal encDout : std_logic_vector(7 downto 0) := (others => '0');
   signal modeSyn : std_logic := '0';
   signal perBit0ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit1ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit2ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit3ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit4ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit5ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit6ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit7ModeSyn : std_logic_vector(2 downto 0) := (others => '0');
   signal shiftModeSyn : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal v : std_logic;
   signal dout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 9 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decryptor PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          encDout => encDout,
          modeSyn => modeSyn,
          perBit0ModeSyn => perBit0ModeSyn,
          perBit1ModeSyn => perBit1ModeSyn,
          perBit2ModeSyn => perBit2ModeSyn,
          perBit3ModeSyn => perBit3ModeSyn,
          perBit4ModeSyn => perBit4ModeSyn,
          perBit5ModeSyn => perBit5ModeSyn,
          perBit6ModeSyn => perBit6ModeSyn,
          perBit7ModeSyn => perBit7ModeSyn,
          shiftModeSyn => shiftModeSyn,
          v => v,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process 
	begin
      
      wait for clk_period/2; rst  <= '0';
	 wait for clk_period;

      -- insert stimulus here 
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; encDout <= "01000001"; 
		shiftModeSyn <= "11"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01000101"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "010"; perBit2ModeSyn <= "001"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "000"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01111010"; 
		shiftModeSyn <= "01"; modeSyn <= '1';
		perBit0ModeSyn <= "000"; perBit1ModeSyn <= "111"; perBit2ModeSyn <= "001"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";		
      wait until falling_edge(clk); encDout <= "01011010"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "011"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "001";
      wait until falling_edge(clk); encDout <= "01111000"; 
		shiftModeSyn <= "11"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01011001"; 
		shiftModeSyn <= "00"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";		
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01100110"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "00110111"; 
		shiftModeSyn <= "00"; modeSyn <= '1';
		perBit0ModeSyn <= "000"; perBit1ModeSyn <= "111"; perBit2ModeSyn <= "001"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01001100"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01110001"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "00"; modeSyn <= '1';
		perBit0ModeSyn <= "000"; perBit1ModeSyn <= "111"; perBit2ModeSyn <= "001"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01101111"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); rst  <= '0'; en <= '0';
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; encDout <= "01111101"; 
		shiftModeSyn <= "00"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); en <= '0';
      wait until falling_edge(clk); en <= '1'; encDout <= "01100110"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "00110111"; 
		shiftModeSyn <= "11"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01001100"; 
		shiftModeSyn <= "00"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01110001"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "001"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01011111"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011110"; 
		shiftModeSyn <= "00"; modeSyn <= '1';
		perBit0ModeSyn <= "101"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "010"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "111"; perBit5ModeSyn <= "110"; 
		perBit6ModeSyn <= "001"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); encDout <= "01010010"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011110"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011110"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011110"; 
		shiftModeSyn <= "10"; modeSyn <= '0';
      wait until falling_edge(clk); rst  <= '0'; en <= '0';
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; encDout <= "01111101"; 
		shiftModeSyn <= "00"; modeSyn <= '0';
      wait until falling_edge(clk); encDout <= "01011000"; 
		shiftModeSyn <= "10"; modeSyn <= '1';
		perBit0ModeSyn <= "111"; perBit1ModeSyn <= "000"; perBit2ModeSyn <= "110"; 
		perBit3ModeSyn <= "100"; perBit4ModeSyn <= "101"; perBit5ModeSyn <= "001"; 
		perBit6ModeSyn <= "010"; perBit7ModeSyn <= "011";
      wait until falling_edge(clk); en <= '0';
      wait;
   end process;

END;
