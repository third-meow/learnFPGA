module top (
    input CLK,    // 16MHz clock
	input PIN_23, // echo pin
	output PIN_22, // trigger pin
	output PIN_10, // led pin
    output LED,   // User LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

	reg trig_status
	reg [31:0] clk_cycles;
	reg [31:0] last_trig_clk;
	reg [31:0] distance;

	assign PIN_10 = (distance > 15);
	assign 


    always @(posedge CLK) begin
		clk_cycles <= clk_cycles + 1;
		
		if (clk_cycles % 8000000 == 0) begin //every half second
			trig_status = 1; // set trig high
		end

		if (clk_cycles % 8000000 == 160) begin //10uS after setting trigger
			trig_status = 0;
			last_trig_clk = clk_cycles;
		end
    end

	always @(posedge PIN_23) begin
		distance = (clk_cycles - last_trig_clk)
    
endmodule
