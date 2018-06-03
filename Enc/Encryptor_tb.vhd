-----------------------------------------------------------------------------------
-- Engineer: 	   Salaheddin Hetalani
-- Create Date:    15:12:23 25/11/2017
-- Design Name:    Encryption/Decryption System
-- Module Name:    Encryptor_tb.vhd
-- Project Name:   EncDecSys
-- Description: 
-- Revision: 
-- Revision 0.01 - File Created
-----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Encryptor_tb IS
END Encryptor_tb;
 
ARCHITECTURE behavior OF Encryptor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encryptor
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         mode : IN  std_logic;
         shiftMode : IN  std_logic_vector(1 downto 0);
         perBit0Mode : IN  std_logic_vector(2 downto 0);
         perBit1Mode : IN  std_logic_vector(2 downto 0);
         perBit2Mode : IN  std_logic_vector(2 downto 0);
         perBit3Mode : IN  std_logic_vector(2 downto 0);
         perBit4Mode : IN  std_logic_vector(2 downto 0);
         perBit5Mode : IN  std_logic_vector(2 downto 0);
         perBit6Mode : IN  std_logic_vector(2 downto 0);
         perBit7Mode : IN  std_logic_vector(2 downto 0);
         modeSyn : OUT  std_logic;
         shiftModeSyn : OUT  std_logic_vector(1 downto 0);
         perBit0ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit1ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit2ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit3ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit4ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit5ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit6ModeSyn : OUT  std_logic_vector(2 downto 0);
         perBit7ModeSyn : OUT  std_logic_vector(2 downto 0);
         v : OUT  std_logic;
         encDout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal mode : std_logic := '0';
   signal shiftMode : std_logic_vector(1 downto 0) := (others => '0');
   signal perBit0Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit1Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit2Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit3Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit4Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit5Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit6Mode : std_logic_vector(2 downto 0) := (others => '0');
   signal perBit7Mode : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal modeSyn : std_logic;
   signal shiftModeSyn : std_logic_vector(1 downto 0);
   signal perBit0ModeSyn : std_logic_vector(2 downto 0);
   signal perBit1ModeSyn : std_logic_vector(2 downto 0);
   signal perBit2ModeSyn : std_logic_vector(2 downto 0);
   signal perBit3ModeSyn : std_logic_vector(2 downto 0);
   signal perBit4ModeSyn : std_logic_vector(2 downto 0);
   signal perBit5ModeSyn : std_logic_vector(2 downto 0);
   signal perBit6ModeSyn : std_logic_vector(2 downto 0);
   signal perBit7ModeSyn : std_logic_vector(2 downto 0);
   signal v : std_logic;
   signal encDout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encryptor PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          din => din,
          mode => mode,
          shiftMode => shiftMode,
          perBit0Mode => perBit0Mode,
          perBit1Mode => perBit1Mode,
          perBit2Mode => perBit2Mode,
          perBit3Mode => perBit3Mode,
          perBit4Mode => perBit4Mode,
          perBit5Mode => perBit5Mode,
          perBit6Mode => perBit6Mode,
          perBit7Mode => perBit7Mode,
          modeSyn => modeSyn,
          shiftModeSyn => shiftModeSyn,
          perBit0ModeSyn => perBit0ModeSyn,
          perBit1ModeSyn => perBit1ModeSyn,
          perBit2ModeSyn => perBit2ModeSyn,
          perBit3ModeSyn => perBit3ModeSyn,
          perBit4ModeSyn => perBit4ModeSyn,
          perBit5ModeSyn => perBit5ModeSyn,
          perBit6ModeSyn => perBit6ModeSyn,
          perBit7ModeSyn => perBit7ModeSyn,
          v => v,
          encDout => encDout
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
      -- hold reset state for 100 ns.
      wait for clk_period/2; rst  <= '0';
		wait for clk_period;

      -- insert stimulus here 
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; din <= "01000001"; 
		shiftMode <= "11"; mode <= '0';
      wait until falling_edge(clk); din <= "01000101"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "010"; perBit2Mode <= "001"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "110"; 
		perBit6Mode <= "000"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01111010"; 
		shiftMode <= "01"; mode <= '1';
		perBit0Mode <= "000"; perBit1Mode <= "111"; perBit2Mode <= "001"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "110"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";		
      wait until falling_edge(clk); din <= "01011010"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "011"; 
		perBit6Mode <= "010"; perBit7Mode <= "001";
      wait until falling_edge(clk); din <= "01111000"; 
		shiftMode <= "11"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01011001"; 
		shiftMode <= "00"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";		
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01100110"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "00110111"; 
		shiftMode <= "00"; mode <= '1';
		perBit0Mode <= "000"; perBit1Mode <= "111"; perBit2Mode <= "001"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "110"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01001100"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01110001"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "00"; mode <= '1';
		perBit0Mode <= "000"; perBit1Mode <= "111"; perBit2Mode <= "001"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "110"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01101111"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); rst  <= '0'; en <= '0';
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; din <= "01111101"; 
		shiftMode <= "00"; mode <= '0';
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); en <= '0';
      wait until falling_edge(clk); en <= '1'; din <= "01100110"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "00110111"; 
		shiftMode <= "11"; mode <= '0';
      wait until falling_edge(clk); din <= "01001100"; 
		shiftMode <= "00"; mode <= '0';
      wait until falling_edge(clk); din <= "01110001"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "001"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "110"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01011111"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011110"; 
		shiftMode <= "00"; mode <= '1';
		perBit0Mode <= "101"; perBit1Mode <= "000"; perBit2Mode <= "010"; 
		perBit3Mode <= "100"; perBit4Mode <= "111"; perBit5Mode <= "110"; 
		perBit6Mode <= "001"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); din <= "01010010"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011110"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011110"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); din <= "01011110"; 
		shiftMode <= "10"; mode <= '0';
      wait until falling_edge(clk); rst  <= '0'; en <= '0';
      wait until falling_edge(clk); rst  <= '1'; en <= '1'; din <= "01111101"; 
		shiftMode <= "00"; mode <= '0';
      wait until falling_edge(clk); din <= "01011000"; 
		shiftMode <= "10"; mode <= '1';
		perBit0Mode <= "111"; perBit1Mode <= "000"; perBit2Mode <= "110"; 
		perBit3Mode <= "100"; perBit4Mode <= "101"; perBit5Mode <= "001"; 
		perBit6Mode <= "010"; perBit7Mode <= "011";
      wait until falling_edge(clk); en <= '0';
      wait;
   end process;

END;
