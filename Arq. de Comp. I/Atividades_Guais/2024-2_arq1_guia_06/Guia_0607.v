/*
    -identificação: 

Guia_0607 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f07a ( output s, input X, input Y, input Z );
    // definir dado local

     assign s = ( X | ~Y | Z ) & (~X | Y | Z) & ( X | ~Y | Z ) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf07a ( output s, input X, input Y, input Z );
    // definir dado local

  assign s =  Z | (( X ~^ Y ));
endmodule 


module test_f07;
// ------------------------- definir dados
    reg x;
    reg y;
    reg z;

 wire a;
 f07a moduloA ( a, x, y, z );
 sf07a moduloSA ( aS, x, y, z );
 
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0607 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y    z    a    Sa  ");
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b", x, y, z, a, aS);
    x = 1'b0; y = 1'b0; z = 1'b0;
    #1 x = 1'b0; y = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; z = 1'b1;
 end
endmodule

/*
Guia_0607 - Davi Cândido - 857859
Test module
   x    y    z    a    Sa  
   0    0    0    1    1
   0    0    1    1    1
   0    1    0    0    0
   0    1    1    1    1
   1    1    1    1    1
   1    1    0    1    1
   1    0    0    0    0
   1    0    1    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0607.vvp Guia_0607.v
Para executar: vvp Guia_0607.vvp
*/

