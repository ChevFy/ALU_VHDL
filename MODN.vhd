library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MODN is
    generic (
        max_n : integer := 10
    );
    port (
        clk_in : in std_logic;
        clk_out : out std_logic
    );
end MODN;


architecture Behavioral of MODN is
    signal count : integer := 0;
    signal clk_reg : std_logic := '0';
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if count = (max_n - 1) then
                count <= 0;
                clk_reg <= not clk_reg;  -- toggle output
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;
end Behavioral;
