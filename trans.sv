class trans extends uvm_sequence_item;
 `uvm_object_utils(trans)

rand logic a;
rand logic b;

  logic and_g;
  logic or_g;
  logic not_g;
  logic xor_g;
  logic xnor_g;
  logic nand_g;
  logic nor_g;


function new(string name="trans");
 super.new(name);
endfunction


function void do_print(uvm_printer printer);
 super.do_print(printer);
 printer.print_field("a",this.a, 1, UVM_BIN);
 printer.print_field("b",this.b, 1, UVM_BIN);
printer.print_field("AND",this.and_g, 1, UVM_BIN);
printer.print_field("OR",this.or_g, 1, UVM_BIN);
printer.print_field("NOT",this.not_g, 1, UVM_BIN);
printer.print_field("XOR",this.xor_g, 1, UVM_BIN);
printer.print_field("XNOR",this.xnor_g, 1, UVM_BIN);
printer.print_field("NAND",this.nand_g, 1, UVM_BIN);
printer.print_field("NOR",this.nor_g, 1, UVM_BIN);
endfunction

endclass
