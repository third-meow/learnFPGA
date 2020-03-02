module top (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output PIN_13, // external led
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;

    //send led the led_state register
    assign LED = PIN_1;
    assign PIN_13 = PIN_1;

endmodule
