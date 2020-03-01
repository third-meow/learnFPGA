module top (
	input CLK,
	input PIN_1,  // button pin
	output PIN_13, // external led
	output LED  // onboard led
);

	reg [60:0] clk_time;
	reg [30:0] last_switch_time;
	reg led_state;


	always @(posedge PIN_1) begin
		if (clk_time - last_switch_time > 4000000) begin
			led_state = !led_state;
			last_switch_time = clk_time;
		end
	end

	always @(posedge CLK) begin
		clk_time <= clk_time + 1;
	end

	assign LED = led_state;
	assign PIN_13 = led_state;
endmodule
