module top (
    input CLK,    // 16MHz clock
	input PIN_1, // button pin
	output PIN_10, //
	output PIN_11, // / LED pins
	output PIN_12, //
	output PIN_13, //
	output LED,
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

	function ms_to_clockcycles;
		input ms;
		ms_to_clockcycles = ms * 16000;
	endfunction

	// led states (one longer than needed, for rollover)
	reg[4:0] led_states = 5'b00001;
	reg [7:0] i;
	// cycle period is the number of clock cycles between led shifts
	//reg [31:0] cycle_period = ms_to_clockcycles(1000);
	reg [31:0] cycle_period = 16000000;
	
	reg [31:0] clk_count;
	reg button_flag;


	// assign led pins to led reg
	assign PIN_10 = led_states[0];
	assign PIN_11 = led_states[1];
	assign PIN_12 = led_states[2];
	assign PIN_13 = led_states[3];

	assign LED = PIN_1;

    always @(posedge CLK) begin
		clk_count = clk_count + 1;
		if (PIN_1) button_flag = 1;
		if (clk_count >= cycle_period) begin
			clk_count = 0;

			for (i = 4; i >= 1; i = i - 1) begin
				led_states[i] = led_states[i-1];
			end
			led_states[0] = button_flag;
			button_flag = 0;

		end
    end
endmodule
