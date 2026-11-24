module tb_mux_2to1;
  
  // 1. Testbench Drivers: Declare inputs as reg to drive them inside initial blocks
  reg a_reg;
  reg b_reg;
  reg sel_reg;
  
  // 2. Testbench Monitors: Declare output as wire to observe the module's output
  wire y_wire;
  
  // 3. Instantiate the Device Under Test (UUT)
  mux_2to1 uut (
    .a(a_reg),
    .b(b_reg),
    .sel(sel_reg),
    .y(y_wire)
  );
  
  // 4. Initialize stimulus process
  initial begin
    // Display header for simulation log
    $display("Time\t sel\t a\t b\t | y");
    $monitor("%0t\t %b\t %b\t %b\t | %b", $time, sel, a, b, y);
    
    // Test all combinations of inputs and select lines
    a = 0; b = 0; sel = 0; #10; // y should be 0
    a = 1; b = 0; sel = 0; #10; // y should be 1 (a)
    a = 0; b = 1; sel = 0; #10; // y should be 0 (a)
    a = 0; b = 0; sel = 1; #10; // y should be 0 (b)
    a = 0; b = 1; sel = 1; #10; // y should be 1 (b)
    a = 1; b = 1; sel = 1; #10; // y should be 1 (b)
    
    $finish;
  end
  
endmodule
