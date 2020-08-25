-- new_component.vhd

-- This file was auto-generated as a prototype implementation of a module
-- created in component editor.  It ties off all outputs to ground and
-- ignores all inputs.  It needs to be edited to make it do something
-- useful.
-- 
-- This file will not be automatically regenerated.  You should check it in
-- to your version control system if you want to keep it.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity custom_component is
    port (
        reset_n                : in  std_logic                     := '0';             --   reset_sink.reset_n
        clock                  : in  std_logic                     := '0';             --   clock_sink.clk
        avalon_slave_write_n   : in  std_logic                     := '0';             -- avalon_slave.write_n
        avalon_slave_address   : in  std_logic_vector(15 downto 0) := (others => '0'); --             .address
        avalon_slave_writedata : in  std_logic_vector(15 downto 0) := (others => '0'); --             .writedata
        LEDR                   : out std_logic_vector(9 downto 0)                      --         LEDR.export
    );
end entity custom_component;

architecture rtl of custom_component is

    signal buf : std_logic_vector(avalon_slave_writedata'range);

begin
    
    process (reset_n, clock)
    begin
        if reset_n = '0' then
            buf <= (others => '0');
        elsif rising_edge(clock) then
            if avalon_slave_write_n = '0' then
                buf <= avalon_slave_writedata;
            end if;
        end if;
    end process;

    LEDR <= buf(LEDR'range);

end architecture rtl; -- of new_component
