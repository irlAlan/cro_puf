module top (
    input  logic clk,
    input  logic rst,
    output logic led
);

logic [23:0] counter;

always_ff @(posedge clk) begin
    if (rst) begin
        counter <= '0;
        led     <= 1'b0;
    end
    else begin
        counter <= counter + 1'b1;
        led     <= counter[23];
    end
end

endmodule