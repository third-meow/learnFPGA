module numbers (
    input CLK,
    output LED,
);

    reg [7:0] eightbit;
    reg [15:0] sixteenbit;
    reg led_state;

    always @(posedge CLK) begin
        eightbit <= eightbit + 1;

        if (eightbit == 255) begin
            led_state = 1;
        end
    end

    assign LED = led_state;
endmodule
