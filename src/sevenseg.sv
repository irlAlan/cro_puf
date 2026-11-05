`default_nettype wire

// I want the left most display to show the amount of ROs

module seg_display (
    input logic clk,
    input logic rst,
    input logic [4:0] ro_count,
    output type_pkg::Seg_t sseg     
);


//localparam integer TH = 260_000; // 2.6ms @ 100Mhz;
integer count = 0;

// integer num_to_disp = ro_count;

always_ff @(posedge clk) begin
    if(rst == 1) begin
        count <= 0;
        sseg.an <= 4'b1111;
    end else begin
        sseg.an = 4'b1000;
        sseg.seg = ro_count;
    end
end;

endmodule