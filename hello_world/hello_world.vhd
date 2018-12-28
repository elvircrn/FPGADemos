library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity hello_world is 
  port(  clk:  in std_logic;
         reset:  in std_logic;
         enable:  in std_logic;
         count:  out std_logic_vector(3 downto 0)
       );
end hello_world;

architecture behav of hello_world is         
  signal pre_count: std_logic_vector(3 downto 0);
  signal clk_count: std_logic_vector(22 downto 0);
begin
  process(clk, enable, reset)
  begin
    if reset = '0' then
      pre_count <= "0000";
      clk_count <= (others => '0');
    elsif (clk='1' and clk'event) then
      clk_count <= clk_count + 1;
      if clk_count = "0" then
        pre_count <= pre_count + "1";
      end if;
    end if;
  end process;  
  count <= not pre_count;
end behav;
