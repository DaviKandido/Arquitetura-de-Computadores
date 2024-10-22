/*
    identificação: 

    R0105 - 26 / 09 / 2024
    Nome: Davi Cândido de Almeida
    Matricula: 857859
    Código de Pessoa: 1527368
*/

// NOT( NAND ( XOR(a,b), NOR(a, NOT(b) ) ) )

 module f ( output s, input a, input b );

    wire w1, w2;

    not NOT_a(not_a, a);
    not NOT_b(not_b, b);

    nor nor1(nor1, a, not_b);
    xor xor1(xor1, a, b);

    nand nand1(nand1, nor1, xor1);

    not notS (s, nand1);

 endmodule // s = f (x,y)


module R0105;
    // define data
    reg a; // decimal
    reg b; // decimal
    wire s; // decimal

    f f01a(s, a, b);
    // actions
    initial
        begin : main
            $display ( "R0105 - Tests" );

            $display("   a    b    sB");
            $monitor("%4b %4b %4b", a, b, s);

               a = 1'b0; b = 1'b0;
            #1 a = 1'b0; b = 1'b1;
            #1 a = 1'b1; b = 1'b0;
            #1 a = 1'b1; b = 1'b1;

        end // main
endmodule // R0105

/*
    -Saídas de resultados:

   R0105 - Tests
   a    b    sB
   0    0    0
   0    1    1
   1    0    0
   1    1    0


*/

/*
    -Notas:

Para compilar: iverilog -o R0105.vvp R0105.v
Para executar: vvp R0105.vvp
*/

