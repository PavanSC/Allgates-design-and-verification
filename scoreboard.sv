class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard);

  //uvm_analysis_imp#(trans,scoreboard) mp;
  uvm_tlm_analysis_fifo #(trans) f1;

trans t1;
trans c1;
trans r1;




covergroup fcov1;
 option.per_instance = 1;

A:coverpoint c1.a;
B:coverpoint c1.b;
X:cross A,B;

endgroup

function new(string name = "scoreboard", uvm_component parent);
    super.new(name, parent);
    fcov1=new();
  endfunction

function void build_phase(uvm_phase phase);

  super.build_phase(phase);

  `uvm_info("SCOREBOARD", "This is build_phase", UVM_LOW)
  t1=trans::type_id::create("t1",this);
   r1=trans::type_id::create("r1",this);
  f1=new("f1",this);
endfunction



task run_phase(uvm_phase phase);
 `uvm_info("SCOREBOARD", "This is run_phase", UVM_LOW)
  forever begin
  f1.get(t1);
  t1.print();

  c1=t1;
  fcov1.sample();
  end
endtask


endclass







