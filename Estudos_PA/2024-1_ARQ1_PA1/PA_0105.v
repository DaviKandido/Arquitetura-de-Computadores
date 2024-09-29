/*
    identificação: 

    PA_0105 - 26 / 09 / 2024
    Nome: Davi Cândido de Almeida
    Matricula: 857859
    Código de Pessoa: 1527368
*/

//NAND (XOR (a, b), NOR (NOT(a),NOT (b)))
 module f ( output s, input a, input b );

    wire w1, w2;

    not NOT_a(not_a, a);
    not NOT_b(not_b, b);
    
    xor XOR1 (w1, a, b);
    nor NOR1 (w2, not_a, not_b);

    nand NAND1 (s, w1, w2);

 endmodule // s = f (x,y)


module PA_0105;
    // define data
    reg a; // decimal
    reg b; // decimal
    wire s; // decimal

    f f01a(s, a, b);
    // actions
    initial
        begin : main
            $display ( "PA_0105 - Tests" );

            $display("   a    b    s");
            $monitor("%4b %4b %4b", a, b, s);

               a = 1'b0; b = 1'b0;
            #1 a = 1'b0; b = 1'b1;
            #1 a = 1'b1; b = 1'b0;
            #1 a = 1'b1; b = 1'b1;

        end // main
endmodule // PA_0105

/*
    -Saídas de resultados:

    PA_0105 - Tests
    a    b    s
    0    0    1
    0    1    1
    1    0    1
    1    1    1


    //O resultado final será sempre 1 pq nunca será possivel ter uma XOR e uma NOR com ambos resultados
    //igual a 1 para satisfazer a condição necessário para a nand resultar em 0


*/

/*
    -Notas:

Para compilar: iverilog -o PA_0105.vvp PA_0105.v
Para executar: vvp PA_0105.vvp
*/

