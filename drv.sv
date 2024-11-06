class drv extends uvm_driver#(trans);
`uvm_component_utils(drv)

virtual intf in;
//uvm_analysis_port#(trans) d2s;

function new(string name="drv",uvm_component parent= null);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
if(!uvm_config_db#(virtual intf)::get(this,"","intf",in))
 `uvm_fatal("CONFIG","Have u set it?")
//d2s=new("d2s",this);
endfunction


task run_phase(uvm_phase phase);
 //super.run_phase(phase);
 trans req;
 //req=trans::type_id::create("req",this);
 in.a=0;
 in.b=0;
 
 forever begin
 seq_item_port.get_next_item(req);
 drive_to_dut(req);
// d2s.write(req);
 seq_item_port.item_done();
end
endtask

task drive_to_dut(trans xtn);
 @(posedge in.clk);
 in.a=xtn.a;
 in.b=xtn.b;
endtask

endclass
 