module allgates(a,b,and_g,or_g,not_g,nor_g,nand_g,xor_g,xnor_g);
  input a,b;
  output and_g,or_g,not_g,nor_g,nand_g,xor_g,xnor_g;
  
  assign and_g = a&b;
  assign or_g  = a|b;
  assign not_g = ~a ;
  assign nor_g = ~(a|b);
  assign nand_g= ~(a&b);
  assign xor_g = (a^b);
  assign xnor_g= ~(a^b);

endmodule