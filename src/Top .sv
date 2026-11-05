`default_nettype wire


module Top (
    input logic sysclk,
    input logic [15:0] sw,
    output logic [15:0] led,
    

    output logic [7:0] seg,
    output logic [3:0] an,
    output logic bp,

    output logic btnC,
    output logic btnL,
    output logic btnD,
    output logic btnU,
    output logic btnR
);



logic [4:0] ro;

logic rst;
integer ro_amount = 1;

type_pkg::Btn_t btn;
type_pkg::Btn_t dbtn;
type_pkg::Seg_t sseg;

assign btn.c = btnC;
assign btn.u = btnU;
assign btn.d = btnD;
assign btn.l = btnL;
assign btn.r = btnR;

assign sseg.an = an;
assign sseg.seg = seg;
assign sseg.bp = bp;


// First 5 switches (From L-R) control how many RO's to use
//  in binary
// left most 7 seg display shows how many RO's are in use
//


btn_debounce : btn_debounce_inst (
    .clk(sysclk),
    .in_btn(btn),
    .led(led[0]),
    .deb_btn(dbtn)
);

reset : reset_inst (
    .clk(sysclk),
    .btn(dbtn.c),
    .led(led[0]),
    .reset(rst)
);

ro_count : ro_count_inst(
    .clk(sysclk),
    .sw(sw[15:11]),
    .count(ro_amount)
);

seg_display : seg_display_inst (
    .clk(sysclk),
    .ro_count(ro_count),
    .sseg(sseg)
);

//ring_oscillator : ring_oscillator_inst (
//    .enable(0)
//    .ro_count(ro_amount),
//    .ro_sig(ro)
//);

endmodule
