/*
    -identificação: 

Guia_0603 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f03a ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = ~x&~y&~w&z | ~x&~y&w&~z | ~x&y&~w&z | x&y&~w&~z | x&y&~w&z | x&~y&~w&~z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf03a ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = ~x&~w&z|  y&~w&z  | x&~w&~z | ~x&~y&w&~z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f03b ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = ~x&~y&~w&~z | ~x&~y&~w&z | ~x&~y&w&z | ~x&y&~w&z | ~x&y&w&z | x&y&~w&z | x&y&w&z  ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf03b ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = ~x&~y&~w | y&z | ~x&~y&z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f03c ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = ~x&~y&~w&~z | ~x&~y&~w&z | ~x&~y&w&~z | ~x&y&w&z | ~x&y&w&~z | x&y&w&z | x&y&w&~z | x&~y&w&~z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf03c ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = ~x&~y&~w | ~x&~y&~z | y&w | x&w&~z;
endmodule 


// ----------- Expressão completa-------------- // 
module f03d ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = ~x&~y&w&~z | ~x&y&~w&~z | ~x&y&w&z | ~x&y&w&~z | x&y&~w&z | x&y&w&~z | x&~y&w&~z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf03d ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = w&~z | ~x&y&w | ~x&y&~z | x&y&~w&z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f03e ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = ~x&~y&~w&~z | x&y&w&~z | x&y&~w&~z | x&~y&~w&~z | ~x&~y&w&~z | x&~y&~w&~z | x&~y&~w&z | x&~y&w&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf03e ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = ~y&~w | ~y&w&z | x&~w&z | ~x&w&z ;
endmodule 



module test_f03;
// ------------------------- definir dados
    reg x;
    reg y;
    reg w;
    reg z;

 wire a, b, c, d, e;
 f03a moduloA ( a, x, y, w, z );
 sf03a moduloSA ( aS, x, y, w, z );

 f03b moduloB ( b, x, y, w, z );
 sf03b moduloSB ( bS, x, y, w, z );

 f03c moduloC ( c, x, y, w, z );
 sf03c moduloSC ( cS, x, y, w, z );

 f03d moduloD ( d, x, y, w, z );
 sf03d moduloSD ( dS, x, y, w, z );

  f03e moduloE ( e, x, y, w, z );
 sf03e moduloSE ( eS, x, y, w, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0603 - Davi Cândido - 857859");
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
Guia_0603 - Davi Cândido - 857859
Test module
   x    y    w    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se
   0    0    0    0    0    0    1    1    1    1    0    0    1    1
   0    0    0    1    1    1    1    1    1    1    0    0    0    1
   0    0    1    1    0    0    1    1    0    0    0    0    0    1
   0    0    1    0    1    1    0    0    1    1    1    1    1    0
   0    1    1    0    0    0    0    0    1    1    1    1    0    0
   0    1    1    1    0    0    1    1    1    1    1    1    0    1
   0    1    0    1    1    1    1    1    0    0    0    0    0    0
   0    1    0    0    0    0    0    0    0    0    1    1    0    0
   1    1    0    0    1    1    0    0    0    0    0    0    1    0
   1    1    0    1    1    1    1    1    0    0    1    1    0    1
   1    1    1    1    0    0    1    1    1    1    0    0    0    0
   1    1    1    0    0    0    0    0    1    1    1    1    1    0
   1    0    1    0    0    0    0    0    1    1    1    1    0    0
   1    0    1    1    0    0    0    0    0    0    0    0    1    1
   1    0    0    1    0    0    0    0    0    0    0    0    1    1
   1    0    0    0    1    1    0    0    0    0    0    0    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0603.vvp Guia_0603.v
Para executar: vvp Guia_0603.vvp
*/

