----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--this is how entity for your test bench code has to be declared.
entity testbench2 is
end testbench2;

architecture behavior of testbench2 is
-- Style 2 Component declaration.
  component compare2
  port( num1 : in std_logic_vector(3 downto 0);    --input 1
        num2     : in  std_logic_vector(3 downto 0); --input 2
        clock    : in  std_logic;                    --input clock
        less     : out std_logic;                    -- indicates first number is small
        equal    : out std_logic;                    -- both are equal
        greater  : out std_logic;                    -- indicates first number is bigger
        less2     : out std_logic;                    -- indicates first number is small
        equal2    : out std_logic;                    -- both are equal
        greater2  : out std_logic;                    -- indicates first number is bigger       
        outclock : out std_logic
        );                     -- clock output         
  end component;
  
--signal declarations.
signal num1,num2: std_logic_vector(3 downto 0) :=(others => '0');
signal clock,less,equal,greater,less2,equal2,greater2,outclock :  std_logic:='0';
constant clk_period : time := 1 us;

begin
--entity instantiation (UUT: Unit Under Test)
--UUT : entity work.compare port map(num1,num2,less,equal,greater);

-- UUT Port mapping Style2
  UUT: compare2 port map ( num1    => num1,
                           num2    => num2,
                           clock    => clock,
                           less    => less,
                           equal   => equal,
                           greater => greater, 
                           less2    => less2,
                           equal2   => equal2,
                           greater2 => greater2,                           
                           outclock=> outclock
                           );
                           
--definition of simulation process
tb: process
begin
num1<="0111";  --num1 =7
num2<="1001"; --num2 =9
wait for 2 us;

num1<="1001";  --num1 =9
num2<="0111";   --num2 =7
wait for 2 us;

num1<="1010";  --num1 =a
num2<="1010";  --num2 =a
--more input combinations can be given here.
wait;
end process tb;



clk_process :process
   begin
        clock <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clock <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
--Alternative method for generating clock below. Fro this method you MUST initialize the signal clock, otherwise clock will be always unknown:
-- clock <= not clock after clock_period/2;

end;