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

initial begin
    switch = 16'h0000;

    C_btn = 0;
    L_btn = 0;
    D_btn = 0;
    U_btn = 0;
    R_btn = 0;

    #100;

    switch[15:11] = 5'd10;

    #100;

    C_btn = 1;
    #20;
    C_btn = 0;

    #1000;

    $finish;
end

endmodule