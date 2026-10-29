library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8bit_tb is
end reg_8bit_tb;

architecture Behavioral of reg_8bit_tb is

    -- Component Declaration for the Unit Under Test (UUT)
	 component reg_8bit
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            write_en : in  STD_LOGIC;
            d        : in  STD_LOGIC_VECTOR (7 downto 0);
            q        : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
	 -- Inputs
    signal clk      : STD_LOGIC := '0';
    signal reset    : STD_LOGIC := '0';
    signal write_en : STD_LOGIC := '0';
    signal d        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    -- Outputs
    signal q        : STD_LOGIC_VECTOR(7 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

begin
-- Instantiate the Unit Under Test (UUT)
    uut: reg_8bit PORT MAP (
          clk => clk,
          reset => reset,
          write_en => write_en,
          d => d,
          q => q
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
        -- Reset state
        reset <= '1';
        wait for 20 ns;	
        reset <= '0';
        wait for 10 ns;

        -- Test 1: Write "10101010" to register (write_en = '1')
        write_en <= '1';
        d <= "10101010";
        wait for 20 ns;

        -- Test 2: Disable write (write_en = '0'), output q should hold previous value
        write_en <= '0';
        d <= "11110000";
        wait for 20 ns;
		  -- Test 3: Write new data "01010101" (write_en = '1')
        write_en <= '1';
        d <= "01010101";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;