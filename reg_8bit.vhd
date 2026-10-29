library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8bit is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        write_en : in  STD_LOGIC;
        d        : in  STD_LOGIC_VECTOR (7 downto 0);
        q        : out STD_LOGIC_VECTOR (7 downto 0)
    );
end reg_8bit;
architecture Behavioral of reg_8bit is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            if write_en = '1' then
                q <= d;
            end if;
        end if;
    end process;
end Behavioral;