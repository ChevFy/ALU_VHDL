library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity CounterN is
	generic(
		maxN		:	integer	:=	16;
		maxBit		:	integer	:=	4
	);
	port(
		clk_in :	in		std_logic;
		TC			:	out		std_logic;
		num			:	out		std_logic_vector(maxBit - 1 downto 0)
	);
end CounterN;

architecture Behavioral of CounterN is	
	signal counting	:	integer	:=	0;
begin
	process
	begin
		if(rising_edge(clk_in)) then
			if(counting = maxN - 1) then
				counting <= 0;
				TC			<=	'1';
			else
				counting	<=	counting + 1;
				TC			<=	'0';
			end if;
		end if;
		num <= std_logic_vector(to_unsigned(counting, num'length));
	end process;
end Behavioral;