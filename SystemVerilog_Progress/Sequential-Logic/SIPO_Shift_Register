`timescale 1ns/1ps

module tb_shift_register_sipo;
  
  // 1. Testbench driver signals
  logic 	  clk_sig;
  logic 	  serial_in_sig;
  
  // 2. Outputs monitored from the DUT
  logic [3:0] q_sig;
  
  // 3. Instantiate the SIPO Shift Register (DUT)
  shift_register_sipo uut (
    .clk(clk_sig),
    .serial_in(serial_in_sig),
    .q(q_sig)
  );
  
  // 4. Generate a 10 ns clock signal
  initial begin
    clk_sig = 0;
    forever #5 clk_sig = ~clk_sig;
  end
  
  // 5. Apply test inputs and verify shift register behavior
  initial begin
    // Initialize the serial input
    serial_in_sig = 0;
