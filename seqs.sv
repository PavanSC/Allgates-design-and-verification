class seqs extends uvm_sequence#(trans);
 `uvm_object_utils(seqs)

trans s1;

function new(string name="seqs");
 super.new(name);
endfunction

virtual task body();
 repeat(10) begin
  s1=trans::type_id::create("s1");
  start_item(s1);
  s1.randomize();
  finish_item(s1);
end
endtask

endclass