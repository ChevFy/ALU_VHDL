library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    port (
        clk     : in std_logic; 
        A       : in std_logic_vector(7 downto 0);
        B       : in std_logic_vector(7 downto 0);
        but_sel : in std_logic;
        led     : out std_logic_vector(1 downto 0);
        segment : out std_logic_vector(6 downto 0);
        common  : out std_logic_vector(3 downto 0)
    );
end top;

architecture Behavioral of top is
    signal sel_reg : std_logic := '0';
    signal mode    : std_logic_vector(1 downto 0);
    signal bits    : std_logic_vector(7 downto 0);
    signal seg     : std_logic_vector(6 downto 0);
    signal comm    : std_logic_vector(3 downto 0);
begin
    Umod4 : entity work.MODN
        generic map(
            max_n => 4
        )
        port map(
            clk_in  => clk,
            clk_out => sel_reg
        );

    Ucount4 : entity work.CounterN
        generic map(
            maxN    => 4,
            maxBit  => 2
        )
        port map(
            clk_in => but_sel,
            TC     => open,
            num    => mode
        );
    
    Ualu : entity work.ALU
        port map(
            A        => A,
            B        => B,
            mode     => mode,
            bits_out => bits
        );
    
    Usegment : entity work.SevenSegmentDecode
        generic map(
            num_amount => 2
        )
        port map(
            clk_in     => sel_reg,
            num_in     => bits,
            bits_out   => seg,
            common_out => comm
        );
    
    common  <= comm;
    segment <= seg;
    led     <= mode;

end Behavioral;
