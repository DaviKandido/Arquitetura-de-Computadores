/*
    -identificação: 

Guia_0507 - 29 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- descrever por portas-------------- // 
module f07a ( output s, input a, input b );
    // definir dado local
    wire not_a;
    wire not_b;

    nor op1(not_a, a, a);
    nor op2(not_b, b, b);

    xor op3 ( s, not_a, not_b );
endmodule 


// -----------descrever por expressao-------------- // 
module f07b ( output s, input a, input b );


    assign s = ~( ~(~(~(a|a) | b) | ~(a | ~(b|b))) | ~(~(~(a|a) | b) | ~(a | ~(b|b))) );
endmodule


// -----------expressao original-------------- // 
module f07c ( output s, input a, input b );


    assign s = ( ~a ^ ~b );
endmodule



module test_f5;
// ------------------------- definir dados
 reg x;
 reg y;
 wire a, b;
 f07a moduloA ( a, x, y );
 f07b moduloB ( b, x, y );
 f07c moduloC ( c, x, y );
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0507 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y   nor  nor  ORI"); //nor - por portas, nor - por expressão, ORI - Expressão original
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b", x, y, a, b, c);
    x = 1'b0; y = 1'b0;
    #1 x = 1'b0; y = 1'b1;
    #1 x = 1'b1; y = 1'b0;
    #1 x = 1'b1; y = 1'b1;
 end
endmodule

/*
    -Saídas de resultados:

Guia_0507 - Davi Cândido - 857859
Test module
   x    y   nor  nor  ORI
   0    0    0    0    0
   0    1    1    1    1
   1    0    1    1    1
   1    1    0    0    0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0507.vvp Guia_0507.v
Para executar: vvp Guia_0507.vvp
*/

