`default_nettype wire


module ro_count( 
    input logic clk,
    input logic [4:0] sw,
    output integer num_ros
)


int num_ros;

always_ff @( posedge clk ) begin 
    num_ros <= sw;
end

count <= num_ros;

endmodule