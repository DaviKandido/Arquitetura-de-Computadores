/*
    -identificação: 

Guia_0601 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f01a ( output s, input x, input y, input z );
    // definir dado local

     assign s = ~x&~y&z | x&y&~z | x&y&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf01a ( output s, input x, input y, input z );
    // definir dado local

  assign s = x&y | ~x&~y&z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f01b ( output s, input x, input y, input z );
    // definir dado local

     assign s = ~x&y&~z | x&y&~z | x&~y&~z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf01b ( output s, input x, input y, input z );
    // definir dado local

  assign s = ~z&(x | y) ;
endmodule 


// ----------- Expressão completa-------------- // 
module f01c ( output s, input x, input y, input z );
    // definir dado local

     assign s = ~x&~y&z | ~x&y&~z | x&y&~z | x&~y&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf01c ( output s, input x, input y, input z );
    // definir dado local

  assign s = y&~z | ~y&z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f01d ( output s, input x, input y, input z );
    // definir dado local

     assign s = ~x&~y&z | ~x&y&~z | x&~y&~z | x&~y&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf01d ( output s, input x, input y, input z );
    // definir dado local

  assign s = x&~y | ~x&~y&z | ~x&y&~z ;
endmodule 


// ----------- Expressão completa-------------- // 
module f01e ( output s, input x, input y, input z );
    // definir dado local

     assign s = ~x&~y&~z | ~x&y&z | x&y&~z | x&y&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf01e ( output s, input x, input y, input z );
    // definir dado local

  assign s = x&y | y&z | ~x&~y&~z ;
endmodule 



module test_f01;
// ------------------------- definir dados
    reg x;
    reg y;
    reg z;

 wire a, b, c, d, e;
 f01a moduloA ( a, x, y, z );
 sf01a moduloSA ( aS, x, y, z );

 f01b moduloB ( b, x, y, z );
 sf01b moduloSB ( bS, x, y, z );

 f01c moduloC ( c, x, y, z );
 sf01c moduloSC ( cS, x, y, z );

 f01d moduloD ( d, x, y, z );
 sf01d moduloSD ( dS, x, y, z );

  f01e moduloE ( e, x, y, z );
 sf01e moduloSE ( eS, x, y, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0601 - Davi Cândido - 857859");
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
    -Saídas de resultados:
Guia_0601 - Davi Cândido - 857859
Test module
   x    y    z    a    Sa   b    Sb   c    Sc   d    Sd   e    Se
   0    0    0    0    0    0    0    0    0    0    0    1    1
   0    0    1    1    1    0    0    1    1    1    1    0    0
   0    1    0    0    0    1    1    1    1    1    1    0    0
   0    1    1    0    0    0    0    0    0    0    0    1    1
   1    1    0    1    1    1    1    1    1    0    0    1    1
   1    1    1    1    1    0    0    0    0    0    0    1    1
   1    0    0    0    0    1    1    0    0    1    1    0    0
   1    0    1    0    0    0    0    1    1    1    1    0    0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0601.vvp Guia_0601.v
Para executar: vvp Guia_0601.vvp
*/

