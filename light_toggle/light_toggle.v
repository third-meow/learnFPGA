module light_toggle (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;


    // pin one's current and last state
    reg button_state;
    reg button_prev_state;

    //register to store led state (eg 0 or 1 {0 = off, 1 = on})
    reg led_state;

    //runs every clock cycle
    always @(posedge CLK) begin
        //get button state
        button_state = PIN_1;

        //if button has just been presssed
        if (button_state && !button_prev_state) begin
            led_state = !led_state;
        end

        //set prev button state
        button_prev_state = button_state;
    end

    //send led the led_state register
    assign LED = led_state;

endmodule
