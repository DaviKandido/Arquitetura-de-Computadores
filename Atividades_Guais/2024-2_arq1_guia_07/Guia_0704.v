/*
    -identificação: 

Guia_0704 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



 module f0704( output s, input a, input b, input sel_1, input sel_2 );
    
    // definir dados locais

    xor XOR1(xor1, a, b);
    and AND1(and1, xor1, sel_1, ~sel_2);

    nor NOR1(nor1, a, b);
    and AND2(and2, nor1, ~sel_1, ~sel_2);

    or OR1(or1, a, b);
    and AND3(and3, or1, ~sel_1, sel_2);

    xnor XNOR1(xnor1, a, b);
    and AND4(and4, xnor1, sel_1, sel_2);

    or OR2(s, and1, and2, and3, and4);

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg x;
    reg y;
    reg sel_1;
    reg sel_2;


    f0704 f0704 ( Resf0704, x, y, sel_1, sel_2 );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0704 - Davi Cândido de Almeida - 857859");
 
        $display("   x    y     00-NOR 01-OR 10-XOR 11-XNOR    NOR/OR/XOR/XNOR");
        // projetar testes do modulo
        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0;

        #1 $monitor("%4b %4b\t\t\t\t %4b%4b \t\t\t\t%4b", x, y, sel_1, sel_2, Resf0704);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0704_or, Resf0704_Nor);

        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1;
        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0;
        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1;

        #1 x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0;
        #1 x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1;
        #1 x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0;
        #1 x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1;

        #1 x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0;
        #1 x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1;
        #1 x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0;
        #1 x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1;

        #1 x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0;
        #1 x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1;
        #1 x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0;
        #1 x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1;


    end
endmodule // test_f7


/*
    -Saídas de resultados:

[Running] Guia_0704.v
Guia_0704 - Davi Cândido de Almeida - 857859
   x    y     00-NOR 01-OR 10-XOR 11-XNOR    NOR/OR/XOR/XNOR
   0    0				    0   0 				   1
   0    0				    0   1 				   0
   0    0				    1   0 				   0
   0    0				    1   1 				   1
   0    1				    0   0 				   0
   0    1				    0   1 				   1
   0    1				    1   0 				   1
   0    1				    1   1 				   0
   1    0				    0   0 				   0
   1    0				    0   1 				   1
   1    0				    1   0 				   1
   1    0				    1   1 				   0
   1    1				    0   0 				   0
   1    1				    0   1 				   1
   1    1				    1   0 				   0
   1    1				    1   1 				   1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0704.vvp Guia_0704.v
Para executar: vvp Guia_0704.vvp
*/

