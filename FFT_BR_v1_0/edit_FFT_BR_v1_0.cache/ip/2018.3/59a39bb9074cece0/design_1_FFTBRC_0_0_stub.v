// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Jun 12 18:23:52 2020
// Host        : DESKTOP-05164PE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_FFTBRC_0_0_stub.v
// Design      : design_1_FFTBRC_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "FFTBRC_v1_0,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(control_awaddr, control_awprot, 
  control_awvalid, control_awready, control_wdata, control_wstrb, control_wvalid, 
  control_wready, control_bresp, control_bvalid, control_bready, control_araddr, 
  control_arprot, control_arvalid, control_arready, control_rdata, control_rresp, 
  control_rvalid, control_rready, control_aclk, control_aresetn, s00_axis_tdata, 
  s00_axis_tstrb, s00_axis_tlast, s00_axis_tvalid, s00_axis_tready, s00_axis_aclk, 
  s00_axis_aresetn, m00_axis_tdata, m00_axis_tstrb, m00_axis_tlast, m00_axis_tvalid, 
  m00_axis_tready, m00_axis_aclk, m00_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="control_awaddr[3:0],control_awprot[2:0],control_awvalid,control_awready,control_wdata[31:0],control_wstrb[3:0],control_wvalid,control_wready,control_bresp[1:0],control_bvalid,control_bready,control_araddr[3:0],control_arprot[2:0],control_arvalid,control_arready,control_rdata[31:0],control_rresp[1:0],control_rvalid,control_rready,control_aclk,control_aresetn,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn,m00_axis_tdata[31:0],m00_axis_tstrb[3:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,m00_axis_aclk,m00_axis_aresetn" */;
  input [3:0]control_awaddr;
  input [2:0]control_awprot;
  input control_awvalid;
  output control_awready;
  input [31:0]control_wdata;
  input [3:0]control_wstrb;
  input control_wvalid;
  output control_wready;
  output [1:0]control_bresp;
  output control_bvalid;
  input control_bready;
  input [3:0]control_araddr;
  input [2:0]control_arprot;
  input control_arvalid;
  output control_arready;
  output [31:0]control_rdata;
  output [1:0]control_rresp;
  output control_rvalid;
  input control_rready;
  input control_aclk;
  input control_aresetn;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axis_tstrb;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  output s00_axis_tready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  output [31:0]m00_axis_tdata;
  output [3:0]m00_axis_tstrb;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  input m00_axis_tready;
  input m00_axis_aclk;
  input m00_axis_aresetn;
endmodule
