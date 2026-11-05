`default_nettype none

module btn_debounce(
    input wire clk,
    input type_pkg::Btn_t btn_in,
    output logic led,
    output type_pkg::Btn_t btn_out
);
    
    // clock cycle @ 100MHz = 10ns so for ms 10^6 = 10ms
    localparam integer COUNTER = 1e6;
    // gets the number of bits to represent Btn
    localparam integer N = $bits(type_pkg::Btn_t);
    logic [$clog2(COUNTER)-1:0] btn_count [N] = '{default: '0};

    logic led_s;
    
    // 2 flip flop synchro
    type_pkg::Btn_t sync0, sync1;
    always_ff @(posedge clk) begin
        sync0 <= btn_in;
        sync1 <= sync0;
    end
    
    type_pkg::Btn_t btn_reg = '0;
    
    always_ff @(posedge clk) begin
        for (int i = 0; i < N; i++) begin
            if(sync1[i] != btn_reg[i]) begin
                btn_count[i] <= btn_count[i] + 1;
                led_s <= 1; 
                if(btn_count[i] == COUNTER-1) begin
                    btn_reg[i] <= sync1[i];
                    btn_count[i] <= '0;
                end
            end else begin
                btn_count[i] <= '0;
            end
        end
    end
    assign btn_out = btn_reg;
    assign led = led_s;
endmodule