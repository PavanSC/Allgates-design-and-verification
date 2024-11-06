class mon extends uvm_monitor;
`uvm_component_utils(mon)

virtual interface intf vif;
uvm_analysis_port#(trans) m2s;
trans t1;

function new(string name="mon",uvm_component parent=null);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db#(virtual intf)::get(this,"","intf",vif)) 
 `uvm_fatal("CONFIG","Have u set it?")
 m2s=new("m2s",this);
 t1=trans::type_id::create("t1",this);
endfunction


task run_phase(uvm_phase phase);
 forever begin
 collect_data();
end
endtask


task collect_data();
  t1=trans::type_id::create("x1",this);
 @(posedge vif.clk);
    #1;
    t1.a      = vif.a;
    t1.b      = vif.b;
    t1.and_g   = vif.and_g;
    t1.or_g   = vif.or_g;
    t1.not_g = vif.not_g;
   t1.xor_g  = vif.xor_g;
    t1.xnor_g = vif.xnor_g;
    t1.nand_g  = vif.nand_g;
    t1.nor_g   = vif.nor_g;

   m2s.write(t1);
endtask

endclass