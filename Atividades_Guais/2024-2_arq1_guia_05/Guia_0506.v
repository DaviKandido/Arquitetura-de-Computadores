/*
    -identificação: 

Guia_0506 - 29 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- descrever por portas-------------- // 
module f06a ( output s, input a, input b );
    // definir dado local

    xor op2 ( s, a, b );
endmodule 


// -----------descrever por expressao-------------- // 
module f06b ( output s, input a, input b );


    assign s = ~(~(a & ~(b&b)) & ~(~(a&a) & b));
endmodule


// -----------expressao original-------------- // 
module f06c ( output s, input a, input b );


    assign s = (a ^ b);
endmodule



module test_f5;
// ------------------------- definir dados
 reg x;
 reg y;
 wire a, b;
 f06a moduloA ( a, x, y );
 f06b moduloB ( b, x, y );
 f06c moduloC ( c, x, y );
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0506 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y   xor  xor  ORI"); //xor - por portas, xor - por expressão, ORI - Expressão original
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

Guia_0506 - Davi Cândido - 857859
Test module
   x    y   xor  xor  ORI
   0    0    0    0    0
   0    1    1    1    1
   1    0    1    1    1
   1    1    0    0    0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0506.vvp Guia_0506.v
Para executar: vvp Guia_0506.vvp
*/

