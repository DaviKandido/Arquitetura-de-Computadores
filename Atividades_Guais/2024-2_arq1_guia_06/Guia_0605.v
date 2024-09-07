/*
    -identificação: 

Guia_0605 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f05a ( output s, input x, input y, input z );
    // definir dado local

     assign s = x&y&~z | x&~y&~z | x&~y&z ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf05a ( output s, input x, input y, input z );
    // definir dado local

  assign s =  x & (~z | ~y);
endmodule 


module test_f05;
// ------------------------- definir dados
    reg x;
    reg y;
    reg z;

 wire a;
 f05a moduloA ( a, x, y, z );
 sf05a moduloSA ( aS, x, y, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0605 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y    z    a    Sa  ");
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b", x, y, z, a, aS);
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
Guia_0605 - Davi Cândido - 857859
Test module
   x    y    z    a    Sa  
   0    0    0    0    0
   0    0    1    0    0
   0    1    0    0    0
   0    1    1    0    0
   1    1    0    1    1
   1    1    1    0    0
   1    0    0    1    1
   1    0    1    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0605.vvp Guia_0605.v
Para executar: vvp Guia_0605.vvp
*/

