/*
    -identificação: 

Guia_0505 - 29 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- descrever por portas-------------- // 
module f05a ( output s, input a, input b );
    // definir dado local

    xnor op2 ( s, a, b );
endmodule 


// -----------descrever por expressao-------------- // 
module f05b ( output s, input a, input b );


    assign s = ~(~(a | ~(b|b)) | ~(~(a|a) | b));
endmodule


// -----------expressao original-------------- // 
module f05c ( output s, input a, input b );


    assign s = ~(a ^ b);
endmodule



module test_f5;
// ------------------------- definir dados
 reg x;
 reg y;
 wire a, b;
 f05a moduloA ( a, x, y );
 f05b moduloB ( b, x, y );
 f05c moduloC ( c, x, y );
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0505 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y   xnor xnor ORI"); //xnor - por portas, xnor - por expressão, ORI - Expressão original
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

Guia_0505 - Davi Cândido - 857859
Test module
   x    y   xnor xnor ORI
   0    0    1    1    1
   0    1    0    0    0
   1    0    0    0    0
   1    1    1    1    1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0505.vvp Guia_0505.v
Para executar: vvp Guia_0505.vvp
*/

