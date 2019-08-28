LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SwapTest IS
END SwapTest;
 
ARCHITECTURE behavior OF SwapTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Swap
    PORT(
         X_IN : IN  std_logic_vector(7 downto 0);
         Y_IN : IN  std_logic_vector(7 downto 0);
         SW : IN  std_logic;
         X_OUT : OUT  std_logic_vector(7 downto 0);
         Y_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X_IN : std_logic_vector(7 downto 0) := "01010101";
   signal Y_IN : std_logic_vector(7 downto 0) := "10101010";
   signal SW : std_logic := '1';

 	--Outputs
   signal X_OUT : std_logic_vector(7 downto 0);
   signal Y_OUT : std_logic_vector(7 downto 0);
	signal clock : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Swap PORT MAP (
          X_IN => X_IN,
          Y_IN => Y_IN,
          SW => SW,
          X_OUT => X_OUT,
          Y_OUT => Y_OUT
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
