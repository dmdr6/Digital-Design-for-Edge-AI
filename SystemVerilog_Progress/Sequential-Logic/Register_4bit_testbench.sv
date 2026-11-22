`timescale 1ns/1ps

module tb_register_4bit;
  
  // 1. Testbench driver signals
  logic 	  clk_sig;
  logic 	  en_sig;
  logic [3:0] d_sig;
  
  // 2. Outputs monitored from the DUT
  logic [3:0] q_sig;
  
  // 3. Instantiate the 4-bit Register (DUT)
  register_4bit uut (
    .clk(clk_sig),
    .en(en_sig),
    .d(d_sig),
    .q(q_sig)
  );
  
  // 4. Generate a 10 ns clock signal
  initial begin
    clk_sig = 0;
    forever #5 clk_sig = ~clk_sig;
  end
  
  // 5. Apply test inputs and verify register behavior
  initial begin
    
    // Initialize inputs before starting the tests
    en_sig = 0;
    d_sig = 4'b0000;
    
    // Test 1: Verify that the register captures data when enabled
    #2;
    en_sig = 1;
    d_sig = 4'b1010;
    
    @(posedge clk_sig);	// Wait for rising clock edge
    #1;					// Allow time for non-blocking assignment
    if (q_sig !== 4'b1010)
      $error("Test 1 Failed: Data was not captured");
    else
      $display("Test 1 Passed: Data captured correctly!");
    
    // Test 2: Verify that the register holds its value when disabled
    en_sig = 0;
    d_sig = 4'b0101;
    
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b1010)
      $error("Test 2 Failed: Register did not hold its value");
    else
      $display("Test 2 Passed: Register held its value");
    
    // Test 3: Verify that new data can be captured
    en_sig = 1;
    d_sig = 4'b1100;
    
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b1100)
      $error("Test 3 Failed: New data was not captured!");
    else
      $display("Test 3 Passed: New data captured correctly");
    
    // Test 4: Verify that output does not change without a clock edge
    d_sig = 4'b0011;
    #2;
    if (q_sig !== 4'b1100)
      $error("Test 4 Failed: Output changed without a clock edge");
    else
      $display("Test 4 Passed: Output remained unchanged");
    
    // Test 5: Verify that disabled register ignores new input data
    en_sig = 0;
    
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b1100)
      $error("Test 5 Failed: Register did not hold its value");
    else
      $display("Test 5 Passed: Disabled register held its value");
    
    // Test 6: Verify that the register captures data after re-enabling
    en_sig = 1;
    d_sig = 4'b0110;
    
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b0110)
      $error("Test 6 Failed: Register did not capture data");
    else
      $display("Test 6 Passed: Data captured after re-enabling");
    
    // End simulation after all tests are completed
    $display("-----------------------------");
    $display("All Tests Completed");
    $display("-----------------------------");
    
    $finish;
  end
  
  // 6. Monitor signal changes throughout the simulation
  // Displays clock, enable, input data, and output data
  initial begin
    $timeformat(-9, 1, " ns", 6);
    $monitor("%t | clk=%b en=%b d=%b q=%b", $time, clk_sig, en_sig, d_sig, q_sig);
  end
  
endmodule
