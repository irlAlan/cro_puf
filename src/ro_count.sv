`default_nettype wire


module ro_count( 
    input logic clk,
    input logic [4:0] sw,
    output logic [4:0] count
);

always_ff @( posedge clk ) begin 
    count <= sw;
end


endmodule