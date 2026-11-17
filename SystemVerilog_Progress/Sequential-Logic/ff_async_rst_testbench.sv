// Self-checking testbench for D Flip-Flop with asynchronous reset
module tb_ff_async_rst;
  
  // 1.Testbench signals
  logic clk;
  logic rst_n;
  logic d;
  logic q;
  
  // 2. Instantiate the Design Under Test (DUT)
  ff_async_rst dut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .q(q)
  );
