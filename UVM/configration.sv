package config_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

// Configration class
class AES_config extends uvm_object;
    `uvm_object_utils(AES_config)    
    virtual AES_intf v_if;
    function new(string name = "AES_config");
        super.new(name);
    endfunction //new()
endclass //AES_config
endpackage