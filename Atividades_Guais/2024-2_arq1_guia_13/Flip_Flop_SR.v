/*
    -identificação: 

Flip_Flop_SR - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/    


module srff ( output q, output qnot, 
 input    s, input  r, input clk, 
 input preset, input clear ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
  if ( clear )        begin q <= 0; qnot <= 1; end 
  else 
    if ( preset )    begin q <= 1; qnot <= 0; end 
    else 
      if ( s & ~r )   begin q <= 1; qnot <= 0; end 
      else 
        if ( ~s & r ) begin q <= 0; qnot <= 1; end 
        else 
          if ( s & r ) 
           begin   q <= 0; qnot <= 0;   end // arbitrary 
end 
 
endmodule // srff


