
--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--entity declaration with port definitions
entity compare2 is
    port( num1 : in std_logic_vector(3 downto 0);    --input 1
        num2     : in  std_logic_vector(3 downto 0); --input 2
        clock    : in  std_logic;                    --input clock
        less     : out std_logic;                    -- indicates first number is small
        equal    : out std_logic;                    -- both are equal
        greater  : out std_logic;                    -- indicates first number is bigger
        less2    : out std_logic;                    -- indicates first number is small
        equal2   : out std_logic;                    -- both are equal
        greater2 : out std_logic;                    -- indicates first number is bigger       
        outclock : out std_logic                     -- clock output           
    );
end compare2;

--architecture of entity
architecture Behavioral of compare2 is

begin

    cloking : process (clock)
        variable clocking : std_logic := '0';
    begin
        if rising_edge(clock) then
            clocking := not clocking;
        end if;
        outclock <= clocking;
    end process;
    comparison : process(num1,num2)
    begin                      -- process starts with a 'begin' statement
        if (num1 > num2 ) then --checking whether num1 is greater than num2
            less    <= '0';
            equal   <= '0';
            greater <= '1';
        elsif (num1 < num2) then --checking whether num1 is less than num2
            less    <= '1';
            equal   <= '0';
            greater <= '0';
        else --checking whether num1 is equal to num2
            less    <= '0';
            equal   <= '1';
            greater <= '0';
        end if;
    end process; -- process ends with a 'end process' statement

    comparison2 : process(num1,num2,clock)
        variable temp_less    : std_logic := '0';
        variable temp_equal   : std_logic := '0';
        variable temp_greater : std_logic := '0';
    begin
        if rising_edge(clock) then -- process starts with a 'begin' statement
            if (num1 > num2 ) then --checking whether num1 is greater than num2
                temp_less    := '0';
                temp_equal   := '0';
                temp_greater := '1';
            elsif (num1 < num2) then --checking whether num1 is less than num2
                temp_less    := '1';
                temp_equal   := '0';
                temp_greater := '0';
            else --checking whether num1 is equal to num2
                temp_less    := '0';
                temp_equal   := '1';
                temp_greater := '0';
            end if;
        end if;
        less2    <= temp_less;
        equal2   <= temp_equal;
        greater2 <= temp_greater;
    end process; -- process ends with a 'end process' statement
end Behavioral;