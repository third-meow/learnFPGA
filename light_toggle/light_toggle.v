module lighttoggle (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;

    //register to count clock cycles after button press
    reg [30:0] debouce_count;
    //register to store led state (eg 0 or 1 {0 = off, 1 = on})
    reg led_state;

    //runs every clock cycle
    always @(posedge CLK) begin
        if (debouce_count == 0) begin
            if (PIN_1) begin //if button pressed, toggle led state
                led_state = !led_state;
                debouce_count <= 30;
            end
        end else begin
            debouce_count <= debounce_count - 1;
        end
    end

    //send led the led_state register
    assign LED = led_state;

endmodule
