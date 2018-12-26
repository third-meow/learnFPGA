module top (
    input CLK,
    output LED,
);

    reg [23:0] count;
    reg led_state;

    always @(posedge CLK) begin
        count <= count + 1;

        if (count == 16000000) begin    //sub-loop running once per second
            count <= 0;

            //run once a second:
            led_state = !led_state;
        end
    end

    assign LED = led_state;
endmodule
