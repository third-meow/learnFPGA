module top(
    input CLK,
    output PIN_1,
    output PIN_2
);
    
    reg [23:0] count;
    reg pin_state;

    always @(posedge CLK) begin
        count <= count + 1;
        if (count == 160000) begin    //slower sub-loop
            count <= 0;

            pin_state = !pin_state;

        end
    end

    assign PIN_1 = pin_state;
    assign PIN_2 = !pin_state;
endmodule

