`timescale 1ns / 1ps

module test;

// Declare signals to drive the DUT
reg clock, reset, mode;
reg button1, button2, button3, button4;
wire [7:0] led;

// Instantiate the votingMachine module
votingMachine uut (
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .led(led)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Test sequence
initial begin
    reset = 1;
    mode = 0;
    button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #100;
    
    reset = 0;
    mode = 0;
    button1 = 1; #10;
    button1 = 0; #5;
    
    button1 = 1; #10;
    button1 = 0; #200;
    
    button2 = 1; #10;
    button2 = 0; #200;
    
    button2 = 1; button3 = 1; #10;
    button2 = 0; button3 = 0; #200;
    
    mode = 1;
    button1 = 1; button2 = 1; #10;
    button1 = 0; button2 = 0; #200;
    
    button3 = 1; #10;
    button3 = 0; #200;
    
    button1 = 1; button3 = 1; #10;
    button1 = 0; button3 = 0; #200;
end

// Waveform dumping for simulation
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
end

endmodule
