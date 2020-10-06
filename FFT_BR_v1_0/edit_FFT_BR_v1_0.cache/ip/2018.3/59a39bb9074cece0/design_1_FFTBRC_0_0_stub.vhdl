-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Fri Jun 12 18:23:52 2020
-- Host        : DESKTOP-05164PE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_FFTBRC_0_0_stub.vhdl
-- Design      : design_1_FFTBRC_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    control_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_awvalid : in STD_LOGIC;
    control_awready : out STD_LOGIC;
    control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_wvalid : in STD_LOGIC;
    control_wready : out STD_LOGIC;
    control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    control_bvalid : out STD_LOGIC;
    control_bready : in STD_LOGIC;
    control_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_arvalid : in STD_LOGIC;
    control_arready : out STD_LOGIC;
    control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    control_rvalid : out STD_LOGIC;
    control_rready : in STD_LOGIC;
    control_aclk : in STD_LOGIC;
    control_aresetn : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "control_awaddr[3:0],control_awprot[2:0],control_awvalid,control_awready,control_wdata[31:0],control_wstrb[3:0],control_wvalid,control_wready,control_bresp[1:0],control_bvalid,control_bready,control_araddr[3:0],control_arprot[2:0],control_arvalid,control_arready,control_rdata[31:0],control_rresp[1:0],control_rvalid,control_rready,control_aclk,control_aresetn,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn,m00_axis_tdata[31:0],m00_axis_tstrb[3:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,m00_axis_aclk,m00_axis_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "FFTBRC_v1_0,Vivado 2018.3";
begin
end;
