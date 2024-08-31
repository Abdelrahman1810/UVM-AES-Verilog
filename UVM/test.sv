package test_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import env_pkg::*;
import main_seq_pkg::*;
import config_pkg::*;

class AES_test extends uvm_test;
    `uvm_component_utils(AES_test)
    function new(string name = "AES_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    AES_config cfg;
    main_sequence main_seq;
    Env env;

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg = AES_config::type_id::create("cfg", this);
    main_seq = main_sequence::type_id::create("main_seq", this);
    env = Env::type_id::create("env", this);

    if (!uvm_config_db#(virtual AES_intf)::get(this, "", "INTF", cfg.v_if))
        `uvm_fatal(get_full_name(), "Unable to get AES config");

    uvm_config_db#(AES_config)::set(this, "env", "ENV", cfg);
    endfunction

    task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);

    `uvm_info(get_full_name(), "rais objection", UVM_LOW)

    main_seq.start(env.agt.sqr);
    
    `uvm_info(get_full_name(), "drop objection", UVM_LOW)
    
    phase.drop_objection(this);
    endtask
endclass //AES_test extends uvm_test
endpackage