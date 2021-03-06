/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    input avr_tx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  reg rst;
  
  localparam SAVE_A_state = 2'd0;
  localparam SAVE_B_state = 2'd1;
  localparam COMPUTE_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = SAVE_A_state;
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_auto_test_wrong_output;
  reg [16-1:0] M_auto_test_alu_output;
  reg [5-1:0] M_auto_test_testcase;
  auto_test_2 auto_test (
    .clk(clk),
    .rst(rst),
    .alu_output(M_auto_test_alu_output),
    .testcase(M_auto_test_testcase),
    .wrong_output(M_auto_test_wrong_output)
  );
  wire [16-1:0] M_generator_a;
  wire [16-1:0] M_generator_b;
  wire [8-1:0] M_generator_alufn;
  wire [5-1:0] M_generator_testcase;
  generator_3 generator (
    .clk(clk),
    .rst(rst),
    .a(M_generator_a),
    .b(M_generator_b),
    .alufn(M_generator_alufn),
    .testcase(M_generator_testcase)
  );
  reg [15:0] M_input_a_d, M_input_a_q = 1'h0;
  reg [15:0] M_input_b_d, M_input_b_q = 1'h0;
  
  reg [19:0] M_seg_counter_d, M_seg_counter_q = 1'h0;
  
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [8-1:0] M_alu_alufn;
  alu_4 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  always @* begin
    M_state_d = M_state_q;
    M_input_b_d = M_input_b_q;
    M_seg_counter_d = M_seg_counter_q;
    M_input_a_d = M_input_a_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    if (io_dip[0+6+0-:1] == 1'h1) begin
      M_alu_alufn = io_dip[0+7-:8];
      a = 1'h0 | a;
      b = 1'h0 | b;
      M_alu_a = a;
      M_alu_b = b;
      io_led[0+7-:8] = io_dip[0+7-:8];
      io_led[8+7-:8] = M_alu_out[8+7-:8];
      io_led[16+7-:8] = M_alu_out[0+7-:8];
      
      case (M_state_q)
        SAVE_A_state: begin
          led = 8'hff;
          M_input_a_d = 16'h0000;
          M_input_b_d = 16'h0000;
          if (io_button[3+0-:1]) begin
            io_led[8+7-:8] = io_dip[8+7-:8];
            io_led[16+7-:8] = io_dip[16+7-:8];
            M_input_a_d = {io_dip[16+7-:8], io_dip[8+7-:8]};
            led = 8'hff;
            M_state_d = SAVE_B_state;
          end
        end
        SAVE_B_state: begin
          led = 8'hff;
          if (io_button[4+0-:1]) begin
            io_led[8+7-:8] = io_dip[8+7-:8];
            io_led[16+7-:8] = io_dip[16+7-:8];
            M_input_b_d = {io_dip[16+7-:8], io_dip[8+7-:8]};
            led = 8'hff;
            M_state_d = COMPUTE_state;
          end
        end
        COMPUTE_state: begin
          if (io_button[1+0-:1]) begin
            M_alu_a = M_input_a_q;
            M_alu_b = M_input_b_q;
            io_led[16+7-:8] = M_alu_out[8+7-:8];
            io_led[8+7-:8] = M_alu_out[0+7-:8];
          end else begin
            if (rst) begin
              M_state_d = SAVE_A_state;
            end
          end
        end
      endcase
    end else begin
      M_alu_alufn = io_dip[0+7-:8];
      io_led[0+7-:8] = io_dip[0+7-:8];
      io_led[8+7-:8] = io_dip[8+7-:8];
      io_led[16+7-:8] = io_dip[16+7-:8];
      M_alu_a = M_generator_a;
      M_alu_b = M_generator_b;
      M_alu_alufn = M_generator_alufn;
      if (M_auto_test_wrong_output == 1'h0) begin
        io_led[16+7-:8] = M_alu_out[8+7-:8];
        io_led[8+7-:8] = M_alu_out[0+7-:8];
      end
    end
    M_auto_test_alu_output = M_alu_out;
    M_auto_test_testcase = M_generator_testcase;
    if (io_dip[0+6+0-:1] == 1'h0 && M_auto_test_wrong_output == 1'h1) begin
      if (M_seg_counter_q < 20'h40000) begin
        io_sel = 4'hb;
        io_seg = 8'h86;
      end else begin
        if (M_seg_counter_q < 20'h80000) begin
          io_sel = 4'hd;
          io_seg = 8'hce;
        end else begin
          if (M_seg_counter_q < 20'hc0000) begin
            io_sel = 4'he;
            io_seg = 8'hce;
          end else begin
            io_sel = 4'h7;
            io_seg = 8'hff;
          end
        end
      end
    end else begin
      io_sel = 1'h0;
      io_seg = 8'hff;
    end
    M_seg_counter_d = M_seg_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_seg_counter_q <= 1'h0;
    end else begin
      M_seg_counter_q <= M_seg_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    M_state_q <= M_state_d;
    
    if (rst == 1'b1) begin
      M_input_a_q <= 1'h0;
      M_input_b_q <= 1'h0;
    end else begin
      M_input_a_q <= M_input_a_d;
      M_input_b_q <= M_input_b_d;
    end
  end
  
endmodule
