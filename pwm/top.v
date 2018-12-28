module top (
    input CLK,
    input PIN_1,
    input PIN_2,
    output PIN_3,
    output LED
);

    reg [7:0] dc;
    reg [7:0] count;
    reg [23:0] slow_loop_count;

    always @(posedge CLK) begin
        if (count < 100) count <= count + 1;
        else count <= 0; 

        slow_loop_count <= slow_loop_count + 1;
        if (slow_loop_count == (16000000 / 4)) begin    //sub-loop running every 250ms
            slow_loop_count <= 0;

            if (PIN_1 && !PIN_2) dc = 20;
            else if (PIN_1 && PIN_2) dc = 50;
            else if (!PIN_1 && PIN_2) dc = 80;
            else dc = 0;

        end
    end

    assign LED = (count < dc) ? 1 : 0;
    assign PIN_3 = (count < dc) ? 1 : 0;
endmodule
