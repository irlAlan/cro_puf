`timescale 1ns/1ps

module tb_top;

logic clk;
logic rst;
logic [15:0] led;
logic bp;

logic C_btn;
logic L_btn;
logic D_btn;
logic U_btn;
logic R_btn;

logic [15:0] switch;
logic [7:0] segm;
logic [3:0] anode;

Top dut (
    .sysclk(clk),
    .sw(switch),
    .led(led),

    .seg(segm),
    .an(anode),
    .bp(bp),

    .btnC(C_btn),
    .btnL(L_btn),
    .btnD(D_btn),
    .btnU(U_btn),
    .btnR(R_btn)
);

initial clk = 0;

always #5 clk = ~clk;

endmodule