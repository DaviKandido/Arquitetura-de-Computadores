/*
    -identificação: 

Guia_0604 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f04a ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (x|y|~w|z) & (x|~y|~w|~z) & (x|~y|~w|z) & (~x|~y|~w|z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf04a ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = (x|~w|z) & (x|~y|~w) & (~y|~w|z) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f04b ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (x|~y|w|z) & (x|~y|w|~z) & (~x|~y|w|~z) & (~x|~y|~w|z) & (~x|y|w|~z)  ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf04b ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = (x|~y|w) & (~y|w|~z) & (~x|w|~z) & (~x|~y|~w|z) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f04c ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (x|~y|w|z) & (x|~y|~w|~z) & (~x|~y|w|~z) & (~x|~y|~w|~z) & (~x|y|w|z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf04c ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = (x|~y|w|z) & (~y|~w|~z) & (~x|~y|~z) & (~x|y|w|z);
endmodule 


// ----------- Expressão completa-------------- // 
module f04d ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (x|y|w|~z) & (x|~y|w|~z) & (~x|~y|~w|~z) &( ~x|~y|~w|z) & (~x|y|w|~z) & (~x|y|~w|~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf04d ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = (x|w|~z) & (~x|~y|~w) & (~x|~w|~z) & (~x|y|~z);
endmodule 


// ----------- Expressão completa-------------- // 
module f04e ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (x|y|~w|z) & (x|~y|w|~z) & (x|~y|~w|~z) & (x|~y|~w|z) & (~x|~y|w|~z) & (~x|~y|~w|~z) & (~x|y|~w|~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf04e ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s =  (x|~w|z) & (~y|~z) & (~x|~w|~z) & (x|~y|~w) ;
endmodule 



module test_f04;
// ------------------------- definir dados
    reg x;
    reg y;
    reg w;
    reg z;

 wire a, b, c, d, e;
 f04a moduloA ( a, x, y, w, z );
 sf04a moduloSA ( aS, x, y, w, z );

 f04b moduloB ( b, x, y, w, z );
 sf04b moduloSB ( bS, x, y, w, z );

 f04c moduloC ( c, x, y, w, z );
 sf04c moduloSC ( cS, x, y, w, z );

 f04d moduloD ( d, x, y, w, z );
 sf04d moduloSD ( dS, x, y, w, z );

  f04e moduloE ( e, x, y, w, z );
 sf04e moduloSE ( eS, x, y, w, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0604 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y    w    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se");
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b", x, y, w, z, a, aS, b, bS, c , cS, d, dS, e, eS);
    x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;
    #1 x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b1;
    #1 x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1;
    #1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0;

 end
endmodule

/*
Guia_0604 - Davi Cândido - 857859
Test module
   x    y    w    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se
   0    0    0    0    1    1    1    1    1    1    1    1    1    1
   0    0    0    1    1    1    1    1    1    1    0    0    1    1
   0    0    1    1    1    1    1    1    1    1    1    1    1    1
   0    0    1    0    0    0    1    1    1    1    1    1    0    0
   0    1    1    0    0    0    1    1    1    1    1    1    0    0
   0    1    1    1    0    0    1    1    0    0    1    1    0    0
   0    1    0    1    1    1    0    0    1    1    0    0    0    0
   0    1    0    0    1    1    0    0    0    0    1    1    1    1
   1    1    0    0    1    1    1    1    1    1    1    1    1    1
   1    1    0    1    1    1    0    0    0    0    1    1    0    0
   1    1    1    1    1    1    1    1    0    0    0    0    0    0
   1    1    1    0    0    0    0    0    1    1    0    0    1    1
   1    0    1    0    1    1    1    1    1    1    1    1    1    1
   1    0    1    1    1    1    1    1    1    1    0    0    0    0
   1    0    0    1    1    1    0    0    1    1    0    0    1    1
   1    0    0    0    1    1    1    1    0    0    1    1    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0604.vvp Guia_0604.v
Para executar: vvp Guia_0604.vvp
*/

