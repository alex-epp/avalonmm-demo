library ieee;
use ieee.std_logic_1164.all;


entity avalonmm_demo is
port (
    clock               : in std_logic;

    LEDR                : out std_logic_vector(9 downto 0);

    HPS_DDR3_ADDR       : out std_logic_vector(14 downto 0);
    HPS_DDR3_BA         : out std_logic_vector(2 downto 0);
    HPS_DDR3_CK_P       : out std_logic;
    HPS_DDR3_CK_N       : out std_logic;
    HPS_DDR3_CKE        : out std_logic;
    HPS_DDR3_CS_N       : out std_logic;
    HPS_DDR3_RAS_N      : out std_logic;
    HPS_DDR3_CAS_N      : out std_logic;
    HPS_DDR3_WE_N       : out std_logic;
    HPS_DDR3_RESET_N    : out std_logic;
    HPS_DDR3_DQ         : inout std_logic_vector(31 downto 0) := (others => 'X');
    HPS_DDR3_DQS_P      : inout std_logic_vector(3 downto 0) := (others => 'X');
    HPS_DDR3_DQS_N      : inout std_logic_vector(3 downto 0) := (others => 'X');
    HPS_DDR3_ODT        : out std_logic;
    HPS_DDR3_DM         : out std_logic_vector(3 downto 0);
    HPS_DDR3_RZQ        : in std_logic := 'X'
);
end entity avalonmm_demo;


architecture rtl of avalonmm_demo is

    component interconnect is
        port (
            clk_clk            : in    std_logic                     := 'X';             -- clk
            ledr_export        : out   std_logic_vector(9 downto 0);                     -- export
            reset_reset_n      : in    std_logic                     := 'X';             -- reset_n
            memory_mem_a       : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck      : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n    : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke     : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n    : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n   : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n   : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n    : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n   : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt     : out   std_logic;                                        -- mem_odt
            memory_mem_dm      : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin   : in    std_logic                     := 'X'              -- oct_rzqin
        );
    end component interconnect;

begin

    u0 : component interconnect
        port map (
            clk_clk            => clock,            --    clk.clk
            ledr_export        => LEDR,             --   ledr.export
            memory_mem_a       => HPS_DDR3_ADDR,    -- memory.mem_a
            memory_mem_ba      => HPS_DDR3_BA,      --       .mem_ba
            memory_mem_ck      => HPS_DDR3_CK_P,    --       .mem_ck
            memory_mem_ck_n    => HPS_DDR3_CK_N,    --       .mem_ck_n
            memory_mem_cke     => HPS_DDR3_CKE,     --       .mem_cke
            memory_mem_cs_n    => HPS_DDR3_CS_N,    --       .mem_cs_n
            memory_mem_ras_n   => HPS_DDR3_RAS_N,   --       .mem_ras_n
            memory_mem_cas_n   => HPS_DDR3_CAS_N,   --       .mem_cas_n
            memory_mem_we_n    => HPS_DDR3_WE_N,    --       .mem_we_n
            memory_mem_reset_n => HPS_DDR3_RESET_N, --       .mem_reset_n
            memory_mem_dq      => HPS_DDR3_DQ,      --       .mem_dq
            memory_mem_dqs     => HPS_DDR3_DQS_P,   --       .mem_dqs
            memory_mem_dqs_n   => HPS_DDR3_DQS_N,   --       .mem_dqs_n
            memory_mem_odt     => HPS_DDR3_ODT,     --       .mem_odt
            memory_mem_dm      => HPS_DDR3_DM,      --       .mem_dm
            memory_oct_rzqin   => HPS_DDR3_RZQ,     --       .oct_rzqin
            reset_reset_n      => '1'               --  reset.reset_n
        );



end architecture rtl;