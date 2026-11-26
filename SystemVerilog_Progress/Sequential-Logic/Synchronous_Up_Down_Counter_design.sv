`timescale 1ns/1ps

module counter_4bit (
  input logic 		 clk,		// Clock signal
  input logic 		 rst,		// Synchronous active-HIGH reset 
  input logic		 en,		// Count enable signal
  input logic 		 up_down,	// 1 = Count up, 0 = Count down
  output logic [3:0] q			// 4-bit counter output
);
  
  // Executes on every rising edge of the clock
  always_ff @(posedge clk) begin
    
    // If reset is HIGH, clear the counter
    if (rst)
      q <= 4'b0000;
    
    // If reset is LOW and enable is HIGH, update the counter
    else if (en) begin
      
      // If up_down is HIGH, increment the counter
      if (up_down)
        q <= q + 4'd1;
      
      // If up_down is LOW, decrement the counter
      else
        q <= q - 4'd1;
      
    end
    
    // If enable is LOW, q keeps its previous value
  end
  
endmodule
