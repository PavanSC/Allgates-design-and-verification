class base_test extends uvm_test;

`uvm_component_utils(base_test)

env envh;
seqs s1;

function new(string name="base_test",uvm_component parent=null);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
envh=env::type_id::create("envh",this);
endfunction


task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s1=seqs::type_id::create("s1",this);
  s1.start(envh.agth.seqrh);
#10;
  phase.drop_objection(this);
endtask

endclass