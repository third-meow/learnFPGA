module lightswitch (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;

    //send led the led_state register
    assign LED = PIN_1;

endmodule
