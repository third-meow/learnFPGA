module simpler_light_toggle (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //register to store led state (eg 0 or 1 {0 = off, 1 = on})
    reg led_state;

    //runs every clock cycle
    always @(posedge PIN_1) led_state = !led_state;

    //send led the led_state register
    assign LED = led_state;

endmodule
