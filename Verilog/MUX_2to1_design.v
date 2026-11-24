// 2-to-1 Multiplexer
module mux_2to1 (
  input wire a,
  input wire b,
  input wire sel,
  output reg y
);
  
  // Using always @(*) and an if/else statement (combinational logic)
  always @(*) begin
    if (sel) begin
      y = b;
    end else begin
      y = a;
    end
  end
  
endmodule
