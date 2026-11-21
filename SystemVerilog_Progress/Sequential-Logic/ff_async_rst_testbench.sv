`timescale 1ns/1ps

module tb_ff_async_rst;
  
  // Testbench driver signals
  logic clk_sig;
  logic rst_n_sig;
  logic d_sig;
  logic q_sig;
  
  // Instantiate the Flip-Flop with Asynchronous Reset (DUT)
  ff_async_rst uut (
    .clk(clk_sig),
    .rst_n(rst_n_sig),
    .d(d_sig),
    .q(q_sig)
  );
  
  // Clock generation: 10 ns period
  initial begin
    clk_sig = 0;
    forever #5 clk_sig = ~clk_sig;
  end
  
  // Test sequence
  initial begin
    
    // Initialize inputs
    rst_n_sig = 1;
    d_sig = 0;
    
    // Test 1: Asynchronous reset
    #2;
    rst_n_sig = 0;
    #1;
    
    if (q_sig !== 0)
      $error("Test 1 Failed: Reset did not clear q");
    else
      $display("Test 1 Passed: Asynchronous reset");
    
    // Release reset
    #2;
    rst_n_sig = 1;
    
    // Test 2: Capture data = 1
    d_sig = 1;
    @(posedge clk_sig);
    #1;
    
    if (q_sig !== 1)
      $error("Test 2 Failed: q did not capture 1");
    else
      $display("Test 2 Passed: Captured 1");
    
    // Test 3: Hold output between clock edges
    d_sig = 0;
    #2;
    
    if (q_sig !== 1)
      $error("Test 3 Failed: q changed without clock");
    else
      $display("Test 3 Passed: Output holds value");
    
    // Test 4: Capture data = 0
    @(posedge clk_sig);
    #1;
    
    if (q_sig !== 0)
      $error("Test 4 Failed: q did not capture 0");
    else
      $display("Test 4 Passed: Captured 0");
    
    // Test 5: Reset asynchronously while q = 0
    d_sig = 1;
    @(posedge clk_sig);
    #1;
    
    if (q_sig !== 1)
      $error("Test 5 Setup Failed");
    
    #2;
    rst_n_sig = 0;
    #1;
    
    if (q_sig !== 0)
      $error("Test 5 Failed: Asynchronous reset failed");
    else
      $display("Test 5 Passed: Reset overrides clock");
    
    $display("--------------------------------------");
    $display("Simulation Complete");
    
    $finish;
  end
  
endmodule
