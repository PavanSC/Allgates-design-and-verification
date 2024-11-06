class env extends uvm_env;
 `uvm_component_utils(env)

 function new(string name="env",uvm_component parent);
    super.new(name,parent);
  endfunction

agt agth;
scoreboard sbh;

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agth    = agt::type_id::create("agth",this);
    sbh = scoreboard::type_id::create("sbh",this);
  endfunction

function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 agth.monh.m2s.connect(sbh.f1.analysis_export);
endfunction

endclass
