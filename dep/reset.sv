`timescale 1ns/1ps
`default_nettype none


module reset(
    input wire clk,
    input wire btn,
    output wire led,
    output wire reset
);


always @(posedge clk) begin
   led   <= ~btn;
   reset <= ~btn; 
end


endmodule