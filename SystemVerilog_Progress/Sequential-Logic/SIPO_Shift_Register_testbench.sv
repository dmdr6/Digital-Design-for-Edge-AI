`timescale 1ns/1ps

module tb_sipo_shift_register;
  
  // 1. Testbench driver signals
  logic 	  clk_sig;
  logic 	  serial_in_sig;
  
  // 2. Outputs monitored from the DUT
  logic [3:0] q_sig;
  
  // 3. Instantiate the SIPO Shift Register (DUT)
  sipo_shift_register uut (
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
    
    // Shift in four zeros to initialize the register
    repeat (4) begin
      @(posedge clk_sig);
      #1;
    end
    
    if (q_sig !== 4'b0000)
      $error("Initialization Failed: Register was not cleared");
    else
      $display("Initialization Passed: Register = 0000");
    
    // Test 1: Shift in the first serial bit (1)
    @(negedge clk_sig);
    serial_in_sig = 1;
    @(posedge clk_sig);		// Wait for rising clock edge
    #1;						// Allow time for non-blocking assignment
    if (q_sig !== 4'b1000)
      $error("Test 1 Failed: First bit was not shifted in correctly");
    else
      $display("Test 1 Passed: Register = %b", q_sig);
    
    // Test 2: Shift in the second serial bit (0)
    @(negedge clk_sig);
    serial_in_sig = 0;
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b0100)
      $error("Test 2 Failed: Second shift was not shifted correctly");
    else
      $display("Test 2 Passed: Register = %b", q_sig);
    
    // Test 3: Shift in the third serial bit (1)
    @(negedge clk_sig);
    serial_in_sig = 1;
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b1010)
      $error("Test 3 Failed: Third bit was not shifted correctly");
    else
      $display("Test 3 Passed: Register = %b", q_sig);
    
    // Test 4: Shift in the fourth serial bit (1)
    @(negedge clk_sig);
    serial_in_sig = 1;
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b1101)
      $error("Test 4 Failed: Fourth bit was not shifted correctly");
    else
      $display("Test 4 Passed: Parallel word = %b", q_sig);
    
    // Test 5: Verify that output does not change without a clock edge
    @(negedge clk_sig);
    serial_in_sig = 0;
    #2;
    if (q_sig !== 4'b1101)
      $error("Test 5 Failed: Output changed without a clock edge");
    else
      $display("Test 5 Passed: Output remained unchanged");
    
    // Test 6: Verify that another bit shifts the register correctly
    @(posedge clk_sig);
    #1;
    if (q_sig !== 4'b0110)
      $error("Test 6 Failed: Continued shifting was incorrect");
    else
      $display("Test 6 Passed: Register = %b", q_sig);
    
    // End simulation after all tests are completed
    $display("-----------------------------");
    $display("All Tests Completed");
    $display("-----------------------------");
    
    $finish;

  end
  
  // 6. Monitor signal changes throughout the simulation
  // Display clock, serial input, and parallel output
  initial begin
    $timeformat(-9, 1, " ns", 6);
    $monitor("%t | clk=%b serial_in=%b q=%b", $time, clk_sig, serial_in_sig, q_sig);
  end
  
endmodule
    
