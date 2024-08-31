package scoreboard_pkg;
import agent_pkg::*;
import shared_pkg::*;
import sequenceItem_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
`define create_obj(type, name) type::type_id::create(name, this);

class AES_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(AES_scoreboard)
    uvm_analysis_imp #(AES_sequenceItem, AES_scoreboard) scb_imp; // scoreboard export
    // uvm_tlm_analysis_fifo #(AES_sequenceItem) sb_fifo; // scoreboard fifo
    AES_sequenceItem item;
    // refrence output
    int key_file;
    int output_file;
    int result;
    int status;
    string ref_out;
    string dut_out;
    
    // error and correct counter
    int correct_counter = 0;
    int error_counter = 0;

    function new(string name = "AES_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        scb_imp = new("scb_imp", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask

    function void write(AES_sequenceItem t);
        item = t;
        Checking_task(item); 
    endfunction

    task Checking_task(AES_sequenceItem chk_item);
        key_file = $fopen("key.txt", "w");
        if (key_file == 0) begin
            $display("Error: key file.");
        end 

        $fwrite(key_file, "%h\n%h",chk_item.in,chk_item.key);
        $fclose(key_file);

        $system("py -3.7-64 model.py");

        output_file = $fopen("output.txt", "r");

        if (output_file) begin
            while (!$feof(output_file)) begin
                $fgets(ref_out, output_file);
            end
        end        
        $fclose(output_file);

        dut_out = $sformatf("%h", chk_item.out);

        if (dut_out == ref_out) begin
            correct_counter++;
        end else begin
            error_counter++;
        end

    endtask

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("report_phase", "------------------------------------------", UVM_LOW)
        `uvm_info("report_phase", $sformatf("----- Total correct transaction: %0d ", correct_counter), UVM_LOW)
        `uvm_info("report_phase", "------------------------------------------", UVM_LOW)
        `uvm_info("report_phase", "------------------------------------------", UVM_LOW)
        `uvm_info("report_phase", $sformatf("----- Total faild transaction: %0d ", error_counter), UVM_LOW)
        `uvm_info("report_phase", "------------------------------------------", UVM_LOW)
    endfunction
endclass
endpackage