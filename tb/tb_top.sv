`timescale 1ns/1ps

module tb_top;

logic clk;
logic rst;
logic led;

top dut (
    .clk(clk),
    .rst(rst),
    .led(led)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #5000;

    $finish;
end

endmodule