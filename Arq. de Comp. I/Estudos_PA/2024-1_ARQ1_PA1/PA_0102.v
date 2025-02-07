/*
    identificação: 

PA_0102 - 26 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

 module f ( output s, input x, input y );

    wire w1, w2, w3, w4, w5;
    not NOT_1 (w1, x);
    not NOT_2 (w2, y);
    and OR__1 (w3, y, w1);
    or OR__2 (w4, w2, x);
    not NOT_3 (w5, w4);
    and AND_1 (s, w3, w5);

 endmodule // s = f (x,y)


module PA_0102;
    // define data
    reg x; // decimal
    reg y; // decimal
    wire s; // decimal

    f f01a(s, x, y);
    // actions
    initial
        begin : main
            $display ( "PA_0102 - Tests" );

            $display("   x    y    s");
            $monitor("%4b %4b %4b", x, y, s);

               x = 1'b0; y = 1'b0;
            #1 x = 1'b0; y = 1'b1;
            #1 x = 1'b1; y = 1'b0;
            #1 x = 1'b1; y = 1'b1;

        end // main
endmodule // PA_0102

/*
    -Saídas de resultados:

    PA_0102 - Tests
    x    y    s
    0    0    0
    0    1    1
    1    0    0
    1    1    0

*/

/*
    -Notas:

Para compilar: iverilog -o PA_0102.vvp PA_0102.v
Para executar: vvp PA_0102.vvp
*/

