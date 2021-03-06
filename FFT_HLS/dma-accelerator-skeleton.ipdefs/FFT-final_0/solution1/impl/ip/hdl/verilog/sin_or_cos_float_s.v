// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module sin_or_cos_float_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        t_in,
        do_cos,
        ap_return
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] t_in;
input   do_cos;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] ap_return;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] ref_4oPi_table_100_V_address0;
reg    ref_4oPi_table_100_V_ce0;
wire   [99:0] ref_4oPi_table_100_V_q0;
wire   [7:0] second_order_float_2_address0;
reg    second_order_float_2_ce0;
wire   [29:0] second_order_float_2_q0;
wire   [7:0] second_order_float_3_address0;
reg    second_order_float_3_ce0;
wire   [22:0] second_order_float_3_q0;
wire   [7:0] second_order_float_s_address0;
reg    second_order_float_s_ce0;
wire  signed [14:0] second_order_float_s_q0;
reg   [0:0] p_Result_21_reg_986;
wire   [7:0] tmp_V_fu_236_p4;
reg   [7:0] tmp_V_reg_992;
wire   [22:0] tmp_V_1_fu_246_p1;
reg   [22:0] tmp_V_1_reg_999;
wire   [0:0] closepath_fu_250_p2;
reg   [0:0] closepath_reg_1005;
wire   [3:0] tmp_12_fu_285_p1;
reg   [3:0] tmp_12_reg_1016;
reg   [79:0] Med_V_reg_1021;
wire    ap_CS_fsm_state2;
reg   [57:0] p_Val2_25_reg_1026;
wire    ap_CS_fsm_state3;
reg   [2:0] tmp_12_i2_reg_1032;
wire   [0:0] tmp_6_fu_348_p2;
reg   [0:0] tmp_6_reg_1037;
wire    ap_CS_fsm_state4;
wire   [2:0] p_Val2_26_fu_365_p3;
reg   [2:0] p_Val2_26_reg_1049;
wire   [28:0] Mx_V_fu_445_p4;
reg   [28:0] Mx_V_reg_1054;
wire  signed [7:0] Ex_V_fu_459_p2;
reg  signed [7:0] Ex_V_reg_1059;
wire   [0:0] tmp_fu_527_p10;
reg   [0:0] tmp_reg_1064;
wire   [21:0] B_V_fu_559_p1;
reg   [21:0] B_V_reg_1070;
reg   [14:0] B_trunc_V_reg_1075;
wire   [0:0] not_do_cos_i_fu_573_p2;
reg   [0:0] not_do_cos_i_reg_1080;
wire   [0:0] tmp_5_fu_600_p2;
reg   [0:0] tmp_5_reg_1100;
wire   [0:0] tmp_7_fu_605_p2;
reg   [0:0] tmp_7_reg_1106;
wire   [29:0] ret_V_5_fu_690_p2;
reg   [29:0] ret_V_5_reg_1114;
wire    ap_CS_fsm_state5;
wire   [0:0] cos_basis_fu_701_p3;
reg   [0:0] cos_basis_reg_1119;
wire    ap_CS_fsm_state6;
reg   [28:0] result_V_reg_1124;
wire   [8:0] ret_V_fu_749_p2;
reg   [8:0] ret_V_reg_1129;
wire    grp_scaled_fixed2ieee_fu_218_ap_start;
wire    grp_scaled_fixed2ieee_fu_218_ap_done;
wire    grp_scaled_fixed2ieee_fu_218_ap_idle;
wire    grp_scaled_fixed2ieee_fu_218_ap_ready;
wire   [31:0] grp_scaled_fixed2ieee_fu_218_ap_return;
reg    grp_scaled_fixed2ieee_fu_218_ap_start_reg;
wire    ap_CS_fsm_state7;
wire   [63:0] tmp_5_i_i_fu_280_p1;
wire   [63:0] tmp_74_i_fu_593_p1;
wire   [31:0] p_Val2_s_fu_224_p1;
wire   [7:0] expv_op_i_fu_256_p2;
wire   [7:0] addr_V_fu_262_p3;
wire   [3:0] tmp_1_fu_270_p4;
wire   [99:0] tmp_7_i_i_fu_289_p1;
wire   [99:0] r_V_9_fu_292_p2;
wire   [23:0] p_Result_22_fu_308_p3;
wire   [79:0] ret_V_8_fu_322_p0;
wire   [23:0] ret_V_8_fu_322_p1;
wire   [103:0] ret_V_8_fu_322_p2;
wire   [7:0] p_1_i_fu_353_p2;
wire   [0:0] tmp_13_fu_371_p1;
wire   [57:0] Mx_bits_V_1_fu_375_p2;
wire   [57:0] p_Val2_8_fu_380_p3;
wire   [28:0] p_Result_i_i_fu_387_p4;
wire   [29:0] p_Result_23_fu_397_p3;
reg   [29:0] p_Result_s_fu_405_p4;
wire   [31:0] p_Result_24_fu_415_p3;
reg   [31:0] val_assign_fu_423_p3;
wire   [4:0] Mx_zeros_V_fu_431_p1;
wire   [57:0] tmp_15_i_fu_435_p1;
wire   [57:0] r_V_10_fu_439_p2;
wire   [7:0] storemerge_i_fu_358_p3;
wire   [7:0] tmp_18_i_fu_455_p1;
wire  signed [8:0] sh_i_cast_fu_465_p1;
wire   [0:0] isNeg_fu_469_p3;
wire   [8:0] tmp_20_i_fu_477_p2;
wire  signed [8:0] ush_fu_483_p3;
wire  signed [28:0] sh_assign_4_i_cast_fu_495_p1;
wire   [28:0] tmp_22_i_fu_503_p2;
wire   [31:0] tmp_21_i_fu_499_p1;
wire  signed [31:0] sh_assign_4_i_cast6_fu_491_p1;
wire   [31:0] tmp_24_i_fu_509_p1;
wire   [31:0] tmp_25_i_fu_513_p2;
wire   [31:0] p_0237_0_in_i_fu_519_p3;
wire   [0:0] not_do_cos_i_fu_573_p0;
wire   [0:0] sin_basis_fu_579_p2;
wire   [6:0] p_Result_i_fu_549_p4;
wire   [7:0] p_Result_25_fu_585_p3;
wire   [29:0] r_V_11_fu_972_p2;
wire  signed [22:0] r_V_12_fu_639_p0;
wire   [21:0] r_V_12_fu_639_p1;
wire   [44:0] r_V_12_fu_639_p2;
wire   [14:0] B_squared_V_fu_613_p4;
wire  signed [29:0] r_V_13_fu_979_p2;
wire   [28:0] t1_V_fu_622_p4;
wire   [21:0] tmp_12_i_fu_645_p4;
wire  signed [29:0] lhs_V_fu_672_p1;
wire  signed [29:0] rhs_V_2_fu_676_p1;
wire   [13:0] tmp_14_i_fu_663_p4;
wire   [29:0] ret_V_9_fu_680_p2;
wire  signed [29:0] rhs_V_19_cast_fu_686_p1;
wire   [0:0] cos_basis_fu_701_p0;
wire   [0:0] tmp_s_fu_696_p2;
wire   [28:0] Mx_V_read_assign_fu_714_p3;
wire  signed [29:0] r_V_14_fu_728_p0;
wire   [28:0] r_V_14_fu_728_p1;
wire   [57:0] r_V_14_fu_728_p2;
wire   [7:0] p_Ex_V_ret_fu_707_p3;
wire  signed [8:0] rhs_V_fu_745_p1;
wire   [31:0] p_Val2_21_fu_756_p1;
wire   [3:0] p_Result_27_fu_782_p3;
wire   [0:0] tmp_2_fu_788_p18;
wire   [0:0] tmp_3_fu_826_p18;
wire   [0:0] p_cast_cast_fu_879_p0;
wire   [0:0] tmp_4_fu_864_p3;
wire   [0:0] tmp_8_fu_891_p2;
wire   [0:0] not_tmp_s_fu_886_p2;
wire   [0:0] p_Result_26_fu_760_p3;
wire   [7:0] tmp_V_2_fu_768_p4;
wire   [0:0] or_cond_fu_871_p2;
wire   [0:0] p_din_sign_V_fu_875_p2;
wire   [0:0] p_results_sign_V_ret_fu_896_p3;
wire   [7:0] p_cast_cast_fu_879_p3;
wire   [7:0] p_results_exp_V_ret_fu_904_p3;
wire   [0:0] not_or_cond_demorgan_fu_927_p2;
wire   [0:0] not_or_cond_fu_931_p2;
wire   [0:0] tmp_9_fu_945_p2;
wire   [22:0] p_results_sig_V_ret_c_fu_937_p3;
wire   [22:0] tmp_V_3_fu_778_p1;
wire   [0:0] p_Repl2_3_fu_911_p3;
wire   [7:0] ret_V_6_fu_919_p3;
wire   [22:0] ret_V_7_fu_950_p3;
wire   [31:0] p_Result_28_fu_958_p4;
wire   [14:0] r_V_11_fu_972_p0;
wire   [29:0] r_V_fu_610_p1;
wire   [14:0] r_V_11_fu_972_p1;
wire   [14:0] r_V_13_fu_979_p0;
wire   [31:0] ret_i_i_fu_968_p1;
reg   [31:0] ap_return_preg;
reg   [6:0] ap_NS_fsm;
wire   [44:0] r_V_12_fu_639_p10;
wire   [29:0] r_V_13_fu_979_p00;
wire   [57:0] r_V_14_fu_728_p10;
wire   [103:0] ret_V_8_fu_322_p00;
wire   [103:0] ret_V_8_fu_322_p10;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 grp_scaled_fixed2ieee_fu_218_ap_start_reg = 1'b0;
#0 ap_return_preg = 32'd0;
end

sin_or_cos_float_bkb #(
    .DataWidth( 100 ),
    .AddressRange( 13 ),
    .AddressWidth( 4 ))
ref_4oPi_table_100_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(ref_4oPi_table_100_V_address0),
    .ce0(ref_4oPi_table_100_V_ce0),
    .q0(ref_4oPi_table_100_V_q0)
);

sin_or_cos_float_cud #(
    .DataWidth( 30 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
second_order_float_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(second_order_float_2_address0),
    .ce0(second_order_float_2_ce0),
    .q0(second_order_float_2_q0)
);

sin_or_cos_float_dEe #(
    .DataWidth( 23 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
second_order_float_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(second_order_float_3_address0),
    .ce0(second_order_float_3_ce0),
    .q0(second_order_float_3_q0)
);

sin_or_cos_float_eOg #(
    .DataWidth( 15 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
second_order_float_s_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(second_order_float_s_address0),
    .ce0(second_order_float_s_ce0),
    .q0(second_order_float_s_q0)
);

scaled_fixed2ieee grp_scaled_fixed2ieee_fu_218(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_scaled_fixed2ieee_fu_218_ap_start),
    .ap_done(grp_scaled_fixed2ieee_fu_218_ap_done),
    .ap_idle(grp_scaled_fixed2ieee_fu_218_ap_idle),
    .ap_ready(grp_scaled_fixed2ieee_fu_218_ap_ready),
    .in_V(result_V_reg_1124),
    .prescale(ret_V_reg_1129),
    .ap_return(grp_scaled_fixed2ieee_fu_218_ap_return)
);

FFT_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
FFT_mux_83_1_1_1_U3(
    .din0(1'd0),
    .din1(1'd1),
    .din2(1'd1),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd1),
    .din6(1'd1),
    .din7(1'd0),
    .din8(p_Val2_26_fu_365_p3),
    .dout(tmp_fu_527_p10)
);

FFT_mux_164_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 1 ),
    .din9_WIDTH( 1 ),
    .din10_WIDTH( 1 ),
    .din11_WIDTH( 1 ),
    .din12_WIDTH( 1 ),
    .din13_WIDTH( 1 ),
    .din14_WIDTH( 1 ),
    .din15_WIDTH( 1 ),
    .din16_WIDTH( 4 ),
    .dout_WIDTH( 1 ))
FFT_mux_164_1_1_1_U4(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd1),
    .din4(1'd1),
    .din5(1'd1),
    .din6(1'd1),
    .din7(1'd0),
    .din8(1'd0),
    .din9(1'd1),
    .din10(1'd1),
    .din11(1'd1),
    .din12(1'd1),
    .din13(1'd0),
    .din14(1'd0),
    .din15(1'd0),
    .din16(p_Result_27_fu_782_p3),
    .dout(tmp_2_fu_788_p18)
);

FFT_mux_164_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 1 ),
    .din9_WIDTH( 1 ),
    .din10_WIDTH( 1 ),
    .din11_WIDTH( 1 ),
    .din12_WIDTH( 1 ),
    .din13_WIDTH( 1 ),
    .din14_WIDTH( 1 ),
    .din15_WIDTH( 1 ),
    .din16_WIDTH( 4 ),
    .dout_WIDTH( 1 ))
FFT_mux_164_1_1_1_U5(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd1),
    .din3(1'd0),
    .din4(1'd1),
    .din5(1'd1),
    .din6(1'd0),
    .din7(1'd1),
    .din8(1'd1),
    .din9(1'd0),
    .din10(1'd1),
    .din11(1'd1),
    .din12(1'd0),
    .din13(1'd1),
    .din14(1'd0),
    .din15(1'd0),
    .din16(p_Result_27_fu_782_p3),
    .dout(tmp_3_fu_826_p18)
);

FFT_mul_mul_15ns_fYi #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
FFT_mul_mul_15ns_fYi_U6(
    .din0(r_V_11_fu_972_p0),
    .din1(r_V_11_fu_972_p1),
    .dout(r_V_11_fu_972_p2)
);

FFT_mul_mul_15ns_g8j #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
FFT_mul_mul_15ns_g8j_U7(
    .din0(r_V_13_fu_979_p0),
    .din1(second_order_float_s_q0),
    .dout(r_V_13_fu_979_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 32'd0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state7) & (grp_scaled_fixed2ieee_fu_218_ap_done == 1'b1))) begin
            ap_return_preg <= ret_i_i_fu_968_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_scaled_fixed2ieee_fu_218_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_scaled_fixed2ieee_fu_218_ap_start_reg <= 1'b1;
        end else if ((grp_scaled_fixed2ieee_fu_218_ap_ready == 1'b1)) begin
            grp_scaled_fixed2ieee_fu_218_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        B_V_reg_1070 <= B_V_fu_559_p1;
        B_trunc_V_reg_1075 <= {{p_0237_0_in_i_fu_519_p3[21:7]}};
        Ex_V_reg_1059 <= Ex_V_fu_459_p2;
        Mx_V_reg_1054 <= {{r_V_10_fu_439_p2[57:29]}};
        not_do_cos_i_reg_1080 <= not_do_cos_i_fu_573_p2;
        p_Val2_26_reg_1049 <= p_Val2_26_fu_365_p3;
        tmp_5_reg_1100 <= tmp_5_fu_600_p2;
        tmp_7_reg_1106 <= tmp_7_fu_605_p2;
        tmp_reg_1064 <= tmp_fu_527_p10;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        Med_V_reg_1021 <= {{r_V_9_fu_292_p2[99:20]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        closepath_reg_1005 <= closepath_fu_250_p2;
        p_Result_21_reg_986 <= p_Val2_s_fu_224_p1[32'd31];
        tmp_12_reg_1016 <= tmp_12_fu_285_p1;
        tmp_V_1_reg_999 <= tmp_V_1_fu_246_p1;
        tmp_V_reg_992 <= {{p_Val2_s_fu_224_p1[30:23]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        cos_basis_reg_1119 <= cos_basis_fu_701_p3;
        result_V_reg_1124 <= {{r_V_14_fu_728_p2[57:29]}};
        ret_V_reg_1129 <= ret_V_fu_749_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        p_Val2_25_reg_1026 <= {{ret_V_8_fu_322_p2[76:19]}};
        tmp_6_reg_1037 <= tmp_6_fu_348_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ret_V_5_reg_1114 <= ret_V_5_fu_690_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((closepath_reg_1005 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        tmp_12_i2_reg_1032 <= {{ret_V_8_fu_322_p2[79:77]}};
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state7) & (grp_scaled_fixed2ieee_fu_218_ap_done == 1'b1)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_scaled_fixed2ieee_fu_218_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_scaled_fixed2ieee_fu_218_ap_done == 1'b1))) begin
        ap_return = ret_i_i_fu_968_p1;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        ref_4oPi_table_100_V_ce0 = 1'b1;
    end else begin
        ref_4oPi_table_100_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        second_order_float_2_ce0 = 1'b1;
    end else begin
        second_order_float_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        second_order_float_3_ce0 = 1'b1;
    end else begin
        second_order_float_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        second_order_float_s_ce0 = 1'b1;
    end else begin
        second_order_float_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_scaled_fixed2ieee_fu_218_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign B_V_fu_559_p1 = p_0237_0_in_i_fu_519_p3[21:0];

assign B_squared_V_fu_613_p4 = {{r_V_11_fu_972_p2[29:15]}};

assign Ex_V_fu_459_p2 = (storemerge_i_fu_358_p3 - tmp_18_i_fu_455_p1);

assign Mx_V_fu_445_p4 = {{r_V_10_fu_439_p2[57:29]}};

assign Mx_V_read_assign_fu_714_p3 = ((cos_basis_fu_701_p3[0:0] === 1'b1) ? 29'd536870911 : Mx_V_reg_1054);

assign Mx_bits_V_1_fu_375_p2 = (58'd0 - p_Val2_25_reg_1026);

assign Mx_zeros_V_fu_431_p1 = val_assign_fu_423_p3[4:0];

assign addr_V_fu_262_p3 = ((closepath_fu_250_p2[0:0] === 1'b1) ? 8'd63 : expv_op_i_fu_256_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign closepath_fu_250_p2 = ((tmp_V_fu_236_p4 < 8'd126) ? 1'b1 : 1'b0);

assign cos_basis_fu_701_p0 = do_cos;

assign cos_basis_fu_701_p3 = ((cos_basis_fu_701_p0[0:0] === 1'b1) ? tmp_s_fu_696_p2 : tmp_reg_1064);

assign expv_op_i_fu_256_p2 = ($signed(8'd194) + $signed(tmp_V_fu_236_p4));

assign grp_scaled_fixed2ieee_fu_218_ap_start = grp_scaled_fixed2ieee_fu_218_ap_start_reg;

assign isNeg_fu_469_p3 = Ex_V_fu_459_p2[32'd7];

assign lhs_V_fu_672_p1 = $signed(t1_V_fu_622_p4);

assign not_do_cos_i_fu_573_p0 = do_cos;

assign not_do_cos_i_fu_573_p2 = (not_do_cos_i_fu_573_p0 ^ 1'd1);

assign not_or_cond_demorgan_fu_927_p2 = (tmp_6_reg_1037 & tmp_5_reg_1100);

assign not_or_cond_fu_931_p2 = (not_or_cond_demorgan_fu_927_p2 ^ 1'd1);

assign not_tmp_s_fu_886_p2 = (tmp_7_reg_1106 ^ 1'd1);

assign or_cond_fu_871_p2 = (tmp_6_reg_1037 & tmp_5_reg_1100);

assign p_0237_0_in_i_fu_519_p3 = ((isNeg_fu_469_p3[0:0] === 1'b1) ? tmp_24_i_fu_509_p1 : tmp_25_i_fu_513_p2);

assign p_1_i_fu_353_p2 = ($signed(8'd131) + $signed(tmp_V_reg_992));

assign p_Ex_V_ret_fu_707_p3 = ((cos_basis_fu_701_p3[0:0] === 1'b1) ? 8'd0 : Ex_V_reg_1059);

assign p_Repl2_3_fu_911_p3 = ((or_cond_fu_871_p2[0:0] === 1'b1) ? p_din_sign_V_fu_875_p2 : p_results_sign_V_ret_fu_896_p3);

assign p_Result_22_fu_308_p3 = {{1'd1}, {tmp_V_1_reg_999}};

assign p_Result_23_fu_397_p3 = {{p_Result_i_i_fu_387_p4}, {1'd1}};

assign p_Result_24_fu_415_p3 = {{2'd3}, {p_Result_s_fu_405_p4}};

assign p_Result_25_fu_585_p3 = {{sin_basis_fu_579_p2}, {p_Result_i_fu_549_p4}};

assign p_Result_26_fu_760_p3 = p_Val2_21_fu_756_p1[32'd31];

assign p_Result_27_fu_782_p3 = {{p_Result_21_reg_986}, {p_Val2_26_reg_1049}};

assign p_Result_28_fu_958_p4 = {{{p_Repl2_3_fu_911_p3}, {ret_V_6_fu_919_p3}}, {ret_V_7_fu_950_p3}};

assign p_Result_i_fu_549_p4 = {{p_0237_0_in_i_fu_519_p3[28:22]}};

assign p_Result_i_i_fu_387_p4 = {{p_Val2_8_fu_380_p3[57:29]}};

integer ap_tvar_int_0;

always @ (p_Result_23_fu_397_p3) begin
    for (ap_tvar_int_0 = 30 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 29 - 0) begin
            p_Result_s_fu_405_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_s_fu_405_p4[ap_tvar_int_0] = p_Result_23_fu_397_p3[29 - ap_tvar_int_0];
        end
    end
end

assign p_Val2_21_fu_756_p1 = grp_scaled_fixed2ieee_fu_218_ap_return;

assign p_Val2_26_fu_365_p3 = ((closepath_reg_1005[0:0] === 1'b1) ? 3'd0 : tmp_12_i2_reg_1032);

assign p_Val2_8_fu_380_p3 = ((tmp_13_fu_371_p1[0:0] === 1'b1) ? Mx_bits_V_1_fu_375_p2 : p_Val2_25_reg_1026);

assign p_Val2_s_fu_224_p1 = t_in;

assign p_cast_cast_fu_879_p0 = do_cos;

assign p_cast_cast_fu_879_p3 = ((p_cast_cast_fu_879_p0[0:0] === 1'b1) ? 8'd127 : 8'd0);

assign p_din_sign_V_fu_875_p2 = (p_Result_21_reg_986 & not_do_cos_i_reg_1080);

assign p_results_exp_V_ret_fu_904_p3 = ((tmp_7_reg_1106[0:0] === 1'b1) ? 8'd255 : tmp_V_2_fu_768_p4);

assign p_results_sig_V_ret_c_fu_937_p3 = ((not_or_cond_fu_931_p2[0:0] === 1'b1) ? 23'd8388607 : 23'd0);

assign p_results_sign_V_ret_fu_896_p3 = ((tmp_8_fu_891_p2[0:0] === 1'b1) ? not_tmp_s_fu_886_p2 : p_Result_26_fu_760_p3);

assign r_V_10_fu_439_p2 = p_Val2_8_fu_380_p3 << tmp_15_i_fu_435_p1;

assign r_V_11_fu_972_p0 = r_V_fu_610_p1;

assign r_V_11_fu_972_p1 = r_V_fu_610_p1;

assign r_V_12_fu_639_p0 = second_order_float_3_q0;

assign r_V_12_fu_639_p1 = r_V_12_fu_639_p10;

assign r_V_12_fu_639_p10 = B_V_reg_1070;

assign r_V_12_fu_639_p2 = ($signed(r_V_12_fu_639_p0) * $signed({{1'b0}, {r_V_12_fu_639_p1}}));

assign r_V_13_fu_979_p0 = r_V_13_fu_979_p00;

assign r_V_13_fu_979_p00 = B_squared_V_fu_613_p4;

assign r_V_14_fu_728_p0 = ret_V_5_reg_1114;

assign r_V_14_fu_728_p1 = r_V_14_fu_728_p10;

assign r_V_14_fu_728_p10 = Mx_V_read_assign_fu_714_p3;

assign r_V_14_fu_728_p2 = ($signed(r_V_14_fu_728_p0) * $signed({{1'b0}, {r_V_14_fu_728_p1}}));

assign r_V_9_fu_292_p2 = ref_4oPi_table_100_V_q0 << tmp_7_i_i_fu_289_p1;

assign r_V_fu_610_p1 = B_trunc_V_reg_1075;

assign ref_4oPi_table_100_V_address0 = tmp_5_i_i_fu_280_p1;

assign ret_V_5_fu_690_p2 = ($signed(ret_V_9_fu_680_p2) + $signed(rhs_V_19_cast_fu_686_p1));

assign ret_V_6_fu_919_p3 = ((or_cond_fu_871_p2[0:0] === 1'b1) ? p_cast_cast_fu_879_p3 : p_results_exp_V_ret_fu_904_p3);

assign ret_V_7_fu_950_p3 = ((tmp_9_fu_945_p2[0:0] === 1'b1) ? p_results_sig_V_ret_c_fu_937_p3 : tmp_V_3_fu_778_p1);

assign ret_V_8_fu_322_p0 = ret_V_8_fu_322_p00;

assign ret_V_8_fu_322_p00 = Med_V_reg_1021;

assign ret_V_8_fu_322_p1 = ret_V_8_fu_322_p10;

assign ret_V_8_fu_322_p10 = p_Result_22_fu_308_p3;

assign ret_V_8_fu_322_p2 = (ret_V_8_fu_322_p0 * ret_V_8_fu_322_p1);

assign ret_V_9_fu_680_p2 = ($signed(lhs_V_fu_672_p1) + $signed(rhs_V_2_fu_676_p1));

assign ret_V_fu_749_p2 = ($signed(9'd0) - $signed(rhs_V_fu_745_p1));

assign ret_i_i_fu_968_p1 = p_Result_28_fu_958_p4;

assign rhs_V_19_cast_fu_686_p1 = $signed(tmp_14_i_fu_663_p4);

assign rhs_V_2_fu_676_p1 = $signed(tmp_12_i_fu_645_p4);

assign rhs_V_fu_745_p1 = $signed(p_Ex_V_ret_fu_707_p3);

assign second_order_float_2_address0 = tmp_74_i_fu_593_p1;

assign second_order_float_3_address0 = tmp_74_i_fu_593_p1;

assign second_order_float_s_address0 = tmp_74_i_fu_593_p1;

assign sh_assign_4_i_cast6_fu_491_p1 = ush_fu_483_p3;

assign sh_assign_4_i_cast_fu_495_p1 = ush_fu_483_p3;

assign sh_i_cast_fu_465_p1 = Ex_V_fu_459_p2;

assign sin_basis_fu_579_p2 = (tmp_fu_527_p10 ^ not_do_cos_i_fu_573_p2);

assign storemerge_i_fu_358_p3 = ((closepath_reg_1005[0:0] === 1'b1) ? p_1_i_fu_353_p2 : 8'd0);

assign t1_V_fu_622_p4 = {{second_order_float_2_q0[29:1]}};

assign tmp_12_fu_285_p1 = addr_V_fu_262_p3[3:0];

assign tmp_12_i_fu_645_p4 = {{r_V_12_fu_639_p2[44:23]}};

assign tmp_13_fu_371_p1 = p_Val2_26_fu_365_p3[0:0];

assign tmp_14_i_fu_663_p4 = {{r_V_13_fu_979_p2[29:16]}};

assign tmp_15_i_fu_435_p1 = Mx_zeros_V_fu_431_p1;

assign tmp_18_i_fu_455_p1 = Mx_zeros_V_fu_431_p1;

assign tmp_1_fu_270_p4 = {{addr_V_fu_262_p3[7:4]}};

assign tmp_20_i_fu_477_p2 = ($signed(9'd0) - $signed(sh_i_cast_fu_465_p1));

assign tmp_21_i_fu_499_p1 = Mx_V_fu_445_p4;

assign tmp_22_i_fu_503_p2 = Mx_V_fu_445_p4 >> sh_assign_4_i_cast_fu_495_p1;

assign tmp_24_i_fu_509_p1 = tmp_22_i_fu_503_p2;

assign tmp_25_i_fu_513_p2 = tmp_21_i_fu_499_p1 << sh_assign_4_i_cast6_fu_491_p1;

assign tmp_4_fu_864_p3 = ((cos_basis_reg_1119[0:0] === 1'b1) ? tmp_2_fu_788_p18 : tmp_3_fu_826_p18);

assign tmp_5_fu_600_p2 = ((tmp_V_reg_992 == 8'd0) ? 1'b1 : 1'b0);

assign tmp_5_i_i_fu_280_p1 = tmp_1_fu_270_p4;

assign tmp_6_fu_348_p2 = ((tmp_V_1_reg_999 == 23'd0) ? 1'b1 : 1'b0);

assign tmp_74_i_fu_593_p1 = p_Result_25_fu_585_p3;

assign tmp_7_fu_605_p2 = ((tmp_V_reg_992 == 8'd255) ? 1'b1 : 1'b0);

assign tmp_7_i_i_fu_289_p1 = tmp_12_reg_1016;

assign tmp_8_fu_891_p2 = (tmp_7_reg_1106 | tmp_4_fu_864_p3);

assign tmp_9_fu_945_p2 = (tmp_7_reg_1106 | or_cond_fu_871_p2);

assign tmp_V_1_fu_246_p1 = p_Val2_s_fu_224_p1[22:0];

assign tmp_V_2_fu_768_p4 = {{p_Val2_21_fu_756_p1[30:23]}};

assign tmp_V_3_fu_778_p1 = p_Val2_21_fu_756_p1[22:0];

assign tmp_V_fu_236_p4 = {{p_Val2_s_fu_224_p1[30:23]}};

assign tmp_s_fu_696_p2 = (tmp_reg_1064 ^ 1'd1);

assign ush_fu_483_p3 = ((isNeg_fu_469_p3[0:0] === 1'b1) ? tmp_20_i_fu_477_p2 : sh_i_cast_fu_465_p1);


always @ (p_Result_24_fu_415_p3) begin
    if (p_Result_24_fu_415_p3[0] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd0;
    end else if (p_Result_24_fu_415_p3[1] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd1;
    end else if (p_Result_24_fu_415_p3[2] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd2;
    end else if (p_Result_24_fu_415_p3[3] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd3;
    end else if (p_Result_24_fu_415_p3[4] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd4;
    end else if (p_Result_24_fu_415_p3[5] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd5;
    end else if (p_Result_24_fu_415_p3[6] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd6;
    end else if (p_Result_24_fu_415_p3[7] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd7;
    end else if (p_Result_24_fu_415_p3[8] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd8;
    end else if (p_Result_24_fu_415_p3[9] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd9;
    end else if (p_Result_24_fu_415_p3[10] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd10;
    end else if (p_Result_24_fu_415_p3[11] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd11;
    end else if (p_Result_24_fu_415_p3[12] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd12;
    end else if (p_Result_24_fu_415_p3[13] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd13;
    end else if (p_Result_24_fu_415_p3[14] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd14;
    end else if (p_Result_24_fu_415_p3[15] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd15;
    end else if (p_Result_24_fu_415_p3[16] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd16;
    end else if (p_Result_24_fu_415_p3[17] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd17;
    end else if (p_Result_24_fu_415_p3[18] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd18;
    end else if (p_Result_24_fu_415_p3[19] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd19;
    end else if (p_Result_24_fu_415_p3[20] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd20;
    end else if (p_Result_24_fu_415_p3[21] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd21;
    end else if (p_Result_24_fu_415_p3[22] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd22;
    end else if (p_Result_24_fu_415_p3[23] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd23;
    end else if (p_Result_24_fu_415_p3[24] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd24;
    end else if (p_Result_24_fu_415_p3[25] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd25;
    end else if (p_Result_24_fu_415_p3[26] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd26;
    end else if (p_Result_24_fu_415_p3[27] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd27;
    end else if (p_Result_24_fu_415_p3[28] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd28;
    end else if (p_Result_24_fu_415_p3[29] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd29;
    end else if (p_Result_24_fu_415_p3[30] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd30;
    end else if (p_Result_24_fu_415_p3[31] == 1'b1) begin
        val_assign_fu_423_p3 = 32'd31;
    end else begin
        val_assign_fu_423_p3 = 32'd32;
    end
end

endmodule //sin_or_cos_float_s
