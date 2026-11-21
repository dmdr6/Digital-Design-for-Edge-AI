`timescale 1ns/1ps

module register_4bit (
  input logic		clk,
  input logic		en,
  input logic [3:0] d,
  output logic		q
);
  
  always_ff @(posedge clk) begin
    if (en)
      q <= d;
  end
  
endmodule
