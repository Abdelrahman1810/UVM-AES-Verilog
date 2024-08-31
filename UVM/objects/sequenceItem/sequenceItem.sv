package sequenceItem_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

class AES_sequenceItem extends uvm_sequence_item;
    `uvm_object_utils(AES_sequenceItem)
    function new(string name = "AES_sequenceItem");
        super.new(name);
    endfunction //new()

    parameter N  = 128;
    parameter Nr = 10;
    parameter Nk = 4;
    rand logic [127:0] in;
    rand logic [N-1:0] key;
         logic [127:0] out;
endclass //AES_sequenceItem extends superClass
endpackage