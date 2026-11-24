module tb_mux_2to1;
  
  // 1. Testbench Drivers: Declare inputs as reg to drive them inside initial blocks
  reg a_reg;
  reg b_reg;
  reg sel_reg;
  
  // 2. Testbench Monitors: Declare output as wire to observe the module's output
  wire y_wire;
  
  // 3. Instantiate the 2-to-1 MUX (DUT)
  mux_2to1 uut (
    .a(a_reg),
    .b(b_reg),
    .sel(sel_reg),
    .y(y_wire)
  );
  
  // 4. Initialize the stimulus process
  initial begin
    
    // Print headers
    $display("Time   sel   a   b   | y");
    $display("-----------------------");
    
    // Use format specifiers (%-5d, %-3b, %-1b) to lock column widths
	$monitor("%-5d  %-3b   %-1b   %-1b   | %b", $time, sel_reg, a_reg, b_reg, y_wire);
    
    // Test all combinations of inputs and select lines
    a_reg = 0; b_reg = 0; sel_reg = 0; #10; // y should be 0
    a_reg = 1; b_reg = 0; sel_reg = 0; #10; // y should be 1 (a)
    a_reg = 0; b_reg = 1; sel_reg = 0; #10; // y should be 0 (a)
    a_reg = 0; b_reg = 0; sel_reg = 1; #10; // y should be 0 (b)
    a_reg = 0; b_reg = 1; sel_reg = 1; #10; // y should be 1 (b)
    a_reg = 1; b_reg = 1; sel_reg = 1; #10; // y should be 1 (b)
    
    $finish;
  end
  
endmodule
