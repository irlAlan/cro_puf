`timescale 1ns/1ps
`default_nettype none


module reset(
    input wire clk,
    input wire btn,
    output wire led,
    output wire reset
);

logic reset_n;
logic led_n;

always @(posedge clk) begin
   led_n   <= ~btn;
   reset_n <= ~btn; 
end

assign led = led_n;
assign reset = reset_n;

endmodule