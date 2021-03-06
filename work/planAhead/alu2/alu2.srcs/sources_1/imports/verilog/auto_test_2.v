/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module auto_test_2 (
    input clk,
    input rst,
    input [15:0] alu_output,
    input [4:0] testcase,
    output reg [0:0] wrong_output
  );
  
  
  
  always @* begin
    
    case (testcase)
      1'h1: begin
        if (alu_output != 3'h6) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      2'h2: begin
        if (alu_output != 3'h4) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      2'h3: begin
        if (alu_output != 2'h2) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      3'h4: begin
        if (alu_output != 16'hfffe) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      3'h5: begin
        if (alu_output != 4'h8) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      3'h6: begin
        if (alu_output != 4'hd) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      3'h7: begin
        if (alu_output != 1'h1) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'h8: begin
        if (alu_output != 1'h0) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'h9: begin
        if (alu_output != 1'h1) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'ha: begin
        if (alu_output != 1'h0) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'hb: begin
        if (alu_output != 1'h1) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'hc: begin
        if (alu_output != 1'h0) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'hd: begin
        if (alu_output != 1'h0) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'he: begin
        if (alu_output != 3'h6) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      4'hf: begin
        if (alu_output != 3'h6) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h10: begin
        if (alu_output != 3'h2) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h11: begin
        if (alu_output != 8'he0) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h12: begin
        if (alu_output != 3'h1) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h13: begin
        if (alu_output != 1'h1) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h14: begin
        if (alu_output != 3'h5) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h15: begin
        if (alu_output != 16'hfff8) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      5'h16: begin
        if (alu_output != 16'hfffa) begin
          wrong_output = 1'h1;
        end else begin
          wrong_output = 1'h0;
        end
      end
      default: begin
        wrong_output = 1'h0;
      end
    endcase
  end
endmodule
