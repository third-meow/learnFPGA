module top(
    input CLK,
    input PIN_2,
    output PIN_1
);
    
    reg [23:0] count;
    reg [23:0] freq = 440;
    reg pin_state;


    always @(posedge CLK) begin
        count <= count + 1;

        if (PIN_2) begin
            freq <= ((freq + 1) % 16000);
        end

        if (count == (16000000/freq)) begin    //slower sub-loop
            count <= 0;
            pin_state = !pin_state;
        end
    end

    assign PIN_1 = pin_state;
endmodule

