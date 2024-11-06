class agt extends uvm_agent;
 `uvm_component_utils(agt)

 function new(string name="agt",uvm_component parent);
    super.new(name,parent);
  endfunction

mon monh;
drv drvh;
seqr seqrh;




function void build_phase(uvm_phase phase);
 super.build_phase(phase);
monh=mon::type_id::create("monh",this);
 drvh=drv::type_id::create("drvh",this);
 seqrh=seqr::type_id::create("seqrh",this);
 
endfunction


function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction

endclass