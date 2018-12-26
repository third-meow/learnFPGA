module top (
	input PIN_1,  // pin one
	output LED,  // onboard led
);

    always @(posedge PIN_1) LED = !LED;
endmodule
