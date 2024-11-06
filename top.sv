module top;

 import uvm_pkg::*;
 import test_pkg::*;


bit clk;

initial begin
clk=1'b0;
 forever #5 clk=~clk;
end

intf in(clk);


allgates a1(.a(in.a),.b(in.b),.and_g(in.and_g),.or_g(in.or_g),.not_g(in.not_g),.nor_g(in.nor_g),.nand_g(in.nand_g),.xor_g(in.xor_g),.xnor_g(in.xnor_g));


initial begin
uvm_config_db#(virtual intf)::set(null,"*","intf",in);
end

initial begin
 run_test();
end

endmodule