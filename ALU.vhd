library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
  port (
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    mode : in std_logic_vector(1 downto 0);
    bits_out : out std_logic_vector(7 downto 0)
    
  );
end ALU ;
    
architecture Behavioral of ALU is
	function twoCompli(num_in	:	std_logic_vector(7 downto 0)) return std_logic_vector is
		variable	num_out	:	std_logic_vector(7 downto 0);
		variable tempNum	:	signed(7 downto 0);
	begin
		tempNum	:=	(not signed(num_in)) + 1;
		num_out	:=	std_logic_vector(tempNum);
		return num_out;
	end function;
	
	signal tempA, tempB	:	signed(7 downto 0);
begin
	process(mode, A, B) 
	begin
		if(mode = "00") then 	-- Add
			bits_out	<=	std_logic_vector(signed(A) + signed(B));
		elsif(mode = "01") then	-- Sub
			bits_out	<=	std_logic_vector(signed(A) + signed(twoCompli(B)));
		elsif(mode = "10") then -- Xor
			bits_out	<=	A xor B;
		elsif(mode = "11") then -- SHL
			bits_out 	<=	A(6 downto 0) & '0';
		end if;
	end process;

end Behavioral;