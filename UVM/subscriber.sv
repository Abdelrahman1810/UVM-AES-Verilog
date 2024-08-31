package subscriber_pkg;
import shared_pkg::*;
import sequenceItem_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
`define create_obj(type, name) type::type_id::create(name, this);

class AES_subscriber extends uvm_component;
    `uvm_component_utils(AES_subscriber)
    uvm_analysis_imp #(AES_sequenceItem, AES_subscriber) sub_imp; // subscriber export
    AES_sequenceItem item;    

    //////////////////////////////////
    //      begin Coverage Group    //
    //////////////////////////////////

    covergroup cvr_gp;
        in_cp:  coverpoint item.in {
            bins in_range[32] = {[0:$]};
        }
        key_cp: coverpoint item.key {
            bins key_range[32] = {[0:$]};
        }
        out_cp: coverpoint item.out {
            bins out_range[32] = {[0:$]};
        }
    endgroup

    ///////////////////////////////////
    //      finish Coverage Group    //
    ///////////////////////////////////

    function new(string name = "AES_subscriber", uvm_component parent = null);
        super.new(name, parent);
        cvr_gp = new();
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sub_imp = new("sub_imp", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask


    function void write(AES_sequenceItem t);
        item = t;
        cvr_gp.sample();
    endfunction
endclass //AES_subscriber extends uvm_subscriber
endpackage