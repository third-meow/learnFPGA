module top (
    input CLK,    // 16MHz clock
    output LED,   // User LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // blink circuit:

    // register driver
    reg [25:0] blink_counter;

    // wire driver
    // led pattern
    wire [21:0] blink_pattern = 22'b00000011110000101;

    always @(posedge CLK) begin
        // increment blink_counter
        blink_counter <= blink_counter + 1;
    end
    
    // light up the LED according to the pattern
    assign LED = blink_pattern[blink_counter[25:21]];
endmodule
