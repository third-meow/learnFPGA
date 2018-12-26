module top (
	input CLK,   // 16MHz clock
	input PIN_1,  // pin one
	output LED,  // onboard led
	output USBPU // usb pullup resistor
);

    //disable usb
    assign USBPU = 0;

    //register to store led state (eg 0 or 1 {0 = off, 1 = on})
    reg led_state;

    //slow loop counter
    reg [23:0] count;

    //runs every clock cycle
    always @(posedge CLK) begin
        count <= count + 1;
        if (count == (16000000 / 4)) begin
            count <= 0;

            //runs every 250ms

            //if button is pressed
            if (PIN_1) begin
                led_state = !led_state;
            end

        end
    end

    //send led the led_state register
    assign LED = led_state;

endmodule
