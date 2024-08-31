package main_seq_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import sequenceItem_pkg::*;
import shared_pkg::*;
class main_sequence extends uvm_sequence #(AES_sequenceItem);
    `uvm_object_utils(main_sequence)
    function new(string name = "main_sequence");
        super.new(name);
    endfunction //new()

    AES_sequenceItem item;

    task body();
        repeat(LOOP) begin
            item = AES_sequenceItem::type_id::create("item");
            start_item(item);
            assert (item.randomize());
            finish_item(item);
        end
    endtask

endclass //main_sequence extends superClass
endpackage