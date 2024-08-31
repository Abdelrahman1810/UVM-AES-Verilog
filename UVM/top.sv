module top ();
import uvm_pkg::*;
`include "uvm_macros.svh"
import test_pkg::*;
import shared_pkg::*;
    // bit clk;

    // initial begin
    //     forever begin
    //         #2 clk = ~clk; // 10 ns
    //     end
    // end

    AES_intf intf();
    AES_Encrypt aes_encr(
            .in(intf.in),
            .key(intf.key),
            .out(intf.out)
    );

    
    initial begin
        uvm_config_db#(virtual AES_intf)::set(null, "uvm_test_top", "INTF", intf);
        run_test("AES_test");
    end    
endmodule
    