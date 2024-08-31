vlib work

vlog {michaelehab_AES-Verilog/addRoundKey.v}
vlog {michaelehab_AES-Verilog/AES.v}
vlog {michaelehab_AES-Verilog/AES_Encrypt.v}
vlog {michaelehab_AES-Verilog/decryptRound.v}
vlog {michaelehab_AES-Verilog/encryptRound.v}
vlog {michaelehab_AES-Verilog/inverseMixColumns.v}
vlog {michaelehab_AES-Verilog/inverseSbox.v}
vlog {michaelehab_AES-Verilog/inverseShiftRows.v}
vlog {michaelehab_AES-Verilog/inverseSubBytes.v}
vlog {michaelehab_AES-Verilog/keyExpansion.v}
vlog {michaelehab_AES-Verilog/mixColumns.v}
vlog {michaelehab_AES-Verilog/sbox.v}
vlog {michaelehab_AES-Verilog/shiftRows.v}
vlog {michaelehab_AES-Verilog/subBytes.v}
vlog {michaelehab_AES-Verilog/AES_Decrypt.v}
vlog {michaelehab_AES-Verilog/AES_Decrypt_tb.v}
vlog {michaelehab_AES-Verilog/AES_Encrypt_tb.v}

# ------------------------------------

vlog -coveropt 3 +cover +acc {UVM/shared_pkg.sv}
vlog -coveropt 3 +cover +acc {UVM/sequenceItem.sv}
vlog -coveropt 3 +cover +acc {UVM/main_sequence.sv}

vlog -coveropt 3 +cover +acc {UVM/AES_intf.sv}

vlog -coveropt 3 +cover +acc {UVM/configration.sv}

vlog -coveropt 3 +cover +acc {UVM/driver.sv}
vlog -coveropt 3 +cover +acc {UVM/monitor.sv}
vlog -coveropt 3 +cover +acc {UVM/sequencer.sv}

vlog -coveropt 3 +cover +acc {UVM/agent.sv}
vlog -coveropt 3 +cover +acc {UVM/scoreboard.sv}
vlog -coveropt 3 +cover +acc {UVM/subscriber.sv}

vlog -coveropt 3 +cover +acc {UVM/env.sv}

vlog -coveropt 3 +cover +acc {UVM/test.sv}
vlog -coveropt 3 +cover +acc {UVM/top.sv}

# ------------------------------------

vsim +UVM_VERBOSITY=UVM_LOW -voptargs=+acc work.top -classdebug -uvmcontrol=all -cover

add wave -position insertpoint sim:/top/intf/*
run -all
#quit -sim