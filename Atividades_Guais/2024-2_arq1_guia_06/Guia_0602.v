/*
    -identificação: 

Guia_0602 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f02a ( output s, input x, input y, input z );
    // definir dado local

     assign s = (x|y|~z) &( ~x|~y|~z) & (~x|y|~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf02a ( output s, input x, input y, input z );
    // definir dado local

  assign s = (y|~z) & (~x|z) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f02b ( output s, input x, input y, input z );
    // definir dado local

     assign s = (x|y|z) & (~x|~y|z) & (x|y|z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf02b ( output s, input x, input y, input z );
    // definir dado local

  assign s = z|(y & ~x) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f02c ( output s, input x, input y, input z );
    // definir dado local

     assign s = (x|y|~z) & (x|~y|z) & (x|~y|~z) & (~x|y|~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf02c ( output s, input x, input y, input z );
    // definir dado local

  assign s = (x|~z) & (x|~y) & (y|~z) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f02d ( output s, input x, input y, input z );
    // definir dado local

     assign s = (x|y|z) & (x|~y|~z) & (~x|~y|~z) & (~x|y|z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf02d ( output s, input x, input y, input z );
    // definir dado local

  assign s = (y|z) & (~y|~z) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f02e ( output s, input x, input y, input z );
    // definir dado local

     assign s = (x|~y|z) & (x|~y|~z) & (~x|~y|z) & (~x|~y|~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf02e ( output s, input x, input y, input z );
    // definir dado local

  assign s = (x|~y) & (~x|~y) ;
endmodule 



module test_f02;
// ------------------------- definir dados
    reg x;
    reg y;
    reg z;

 wire a, b, c, d, e;
 f02a moduloA ( a, x, y, z );
 sf02a moduloSA ( aS, x, y, z );

 f02b moduloB ( b, x, y, z );
 sf02b moduloSB ( bS, x, y, z );

 f02c moduloC ( c, x, y, z );
 sf02c moduloSC ( cS, x, y, z );

 f02d moduloD ( d, x, y, z );
 sf02d moduloSD ( dS, x, y, z );

  f02e moduloE ( e, x, y, z );
 sf02e moduloSE ( eS, x, y, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0602 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se");
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b", x, y, z, a, aS, b, bS, c , cS, d, dS, e, eS);
    x = 1'b0; y = 1'b0; z = 1'b0;
    #1 x = 1'b0; y = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; z = 1'b1;
 end
endmodule

/*
Guia_0602 - Davi Cândido - 857859
Test module
   x    y    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se
   0    0    0    1    1    0    0    1    1    0    0    1    1
   0    0    1    0    0    1    1    0    0    1    1    1    1
   0    1    0    1    1    1    1    0    0    1    1    0    0
   0    1    1    1    1    1    1    0    0    0    0    0    0
   1    1    0    1    0    0    0    1    1    1    1    0    0
   1    1    1    0    1    1    1    1    1    0    0    0    0
   1    0    0    1    0    1    0    1    1    0    0    1    1
   1    0    1    0    0    1    1    0    0    1    1    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0602.vvp Guia_0602.v
Para executar: vvp Guia_0602.vvp
*/

