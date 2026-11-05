`default_nettype wire


module Top (
    input logic sysclk,
    input logic [15:0] sw,
    output logic [15:0] led,
    

    output logic [7:0] seg,
    output logic [3:0] an,
    output logic bp,

    input logic btnC,
    input logic btnL,
    input logic btnD,
    input logic btnU,
    input logic btnR
);



logic [4:0] ro;

logic rst;
logic [4:0] ro_amount;

type_pkg::Btn_t btn;
type_pkg::Btn_t dbtn;
type_pkg::Seg_t sseg;

logic deb_led;
logic rst_led;

assign btn.c = btnC;
assign btn.u = btnU;
assign btn.d = btnD;
assign btn.l = btnL;
assign btn.r = btnR;

assign an = sseg.an;
assign seg = sseg.seg;
assign bp = sseg.bp;

assign led[0] = rst_led;
assign led[1] = deb_led;


// First 5 switches (From L-R) control how many RO's to use
//  in binary
// left most 7 seg display shows how many RO's are in use
//


btn_debounce btn_debounce_inst(
    .clk(sysclk),
    .btn_in(btn),
    .led(led[0]),
    .btn_out(dbtn)
);

reset reset_inst(
    .clk(sysclk),
    .btn(dbtn.c),
    .led(led[0]),
    .reset(rst)
);

ro_count ro_count_inst(
    .clk(sysclk),
    .sw(sw[15:11]),
    .count(ro_amount)
);

seg_display seg_display_inst(
    .clk(sysclk),
    .ro_count(ro_amount),
    .sseg(sseg)
);

//ring_oscillator : ring_oscillator_inst (
//    .enable(0)
//    .ro_count(ro_amount),
//    .ro_sig(ro)
//);


endmodule
