package driver_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

import sequenceItem_pkg::*;

class driver extends uvm_driver #(AES_sequenceItem);
    `uvm_component_utils(driver)
    function new(string name = "driver", uvm_component parent = null);
    super.new(name, parent);
    endfunction

    virtual AES_intf v_if;
    AES_sequenceItem item;

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual AES_intf)::get(this, "", "DRIVER", v_if))
            `uvm_fatal(get_full_name(), "Unable to get AES config");
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            item = AES_sequenceItem::type_id::create("item");
            seq_item_port.get_next_item(item);
            v_if.in    = item.in;
            v_if.key = item.key;
            #4;
            // @(negedge v_if.clk);
            item.out = v_if.out;
            seq_item_port.item_done();
        end
    endtask
endclass //driver extends superClass
endpackage