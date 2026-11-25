`timescale 1ns/1ps

module register_4bit (
  input logic 		 clk,	// Clock signal
  input logic 		 en,	// Enable signal
  input logic [3:0]  d,		// 4-bit data input
  output logic [3:0] q		// 4-bit data output
);
  
  // Executes on every rising edge of the clock
  always_ff @(posedge clk) begin
    
    // If enable is HIGH, store the input data
    if (en)
      q <= d;
    
    // If enable is LOW, q keeps its previous value
  end
  
endmodule
