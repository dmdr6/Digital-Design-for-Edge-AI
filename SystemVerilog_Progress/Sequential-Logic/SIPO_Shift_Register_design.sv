`timescale 1ns/1ps

module sipo_shift_register (
  input logic 		 clk,			// Clock signal
  input logic 		 serial_in,		// 1-bit serial data input
  output logic [3:0] q				// 4-bit parallel data output
);
  
  // Executes on every rising edge of the clock
  always_ff @(posedge clk) begin
    
    // Shift existing bits right and insert new bit at q[3]
    q <= {serial_in, q[3:1]};
    
  end
  
endmodule
