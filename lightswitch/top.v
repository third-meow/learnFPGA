module top (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;

    //regiter to store led state (eg 0 or 1 {0 = off, 1 = on})
    reg led_state;

    //runs every clock cycle
    always @(posedge CLK) begin
        if (PIN_1) begin //if button pressed, set led on
            led_state <= 1;
        end else begin //else set led off
            led_state <= 0;
        end
    end

    //send led the led_state register
    assign LED = led_state;

endmodule
