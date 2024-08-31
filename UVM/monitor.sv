package monitor_pkg;
import uvm_pkg::*;
import sequenceItem_pkg::*;
`include "uvm_macros.svh"

// monitor class
class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
    uvm_analysis_port #(AES_sequenceItem) mon_port;
    AES_sequenceItem item;
    virtual AES_intf v_if;

    function new(string name = "monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_port = new("mon_port", this);

        if (!uvm_config_db#(virtual AES_intf)::get(this, "", "MONITOR", v_if))
            `uvm_fatal(get_full_name(), "Unable to get AES config");
    endfunction

    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      forever begin
        item = AES_sequenceItem::type_id::create("item");
        // assigned inputs to monitor
            #4;
            item.in  = v_if.in ;
            item.key = v_if.key;
            item.out = v_if.out;
        mon_port.write(item); // that's mean that monitor will send the data
      end
    endtask //run_pha
endclass //monitor extends uvm_monitor #(AES_sequenceItem)
endpackage