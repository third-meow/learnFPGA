module top (
    input CLK,    // 16MHz clock
	input PIN_23, // echo pin
	output PIN_22, // trigger pin
	output PIN_10, // led pin
	output LED, // for debugging
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

	reg trig_status;
	reg [51:0] clk_cycles;
	reg [51:0] last_trig_clk;
	reg [51:0] uS_since_trig;
	reg [51:0] distance;

	//assign PIN_10 = (uS_since_trig < 580);
	assign PIN_22 = trig_status;


    always @(posedge CLK) begin
		clk_cycles <= clk_cycles + 1;
		
		if (clk_cycles % 16000000 == 0) begin //every half second
			trig_status <= 1; // set trig high
		end

		if (clk_cycles % 16000000 == 160) begin //10uS after setting trigger
			trig_status <= 0;
			last_trig_clk <= clk_cycles;
		end
    end

	always @(posedge PIN_23) begin
		// devide by 16 to get uS, then by 58 to get cms
		uS_since_trig <= (clk_cycles - last_trig_clk) / 16;
		if (uS_since_trig < 580) PIN_10 = 1;
		else PIN_10 = 0;
	end
    
endmodule
