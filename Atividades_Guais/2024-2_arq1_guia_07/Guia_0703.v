/*
    -identificação: 

Guia_0703 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



 module f0703( output s, input a, input b, input sel_1, input sel_2 );
    
    // definir dados locais
     or or1(or1, a, b);
     nor nor1 (nor1, a, b);

     and and1(and1, or1, sel_1);
     and and2(and2, nor1, ~sel_1);
     and and3(and3, a, b, sel_1);
     nand nand1(nand1, a, b);

     and and4(and4, nand1, ~sel_1);

     or or2(or2, and1, and2);
     or or3(or3, and3, and4);

     and and5(and5, or2, sel_2);
     and and6(and6, or3, ~sel_2);

     or or4(s, and5, and6);
    

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg x;
    reg y;
    reg sel_1;
    reg sel_2;

    f0703 f0703 ( Resf0703, x, y, sel_1, sel_2 );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0703 - Davi Cândido de Almeida - 857859");
        $display("Test LU's module");
        $display("   x    y    sel   Result");
        // projetar testes do modulo
        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0;

        #1 $monitor("%4b %4b\t\t\t\t%4b\t\t\t\t\t\t    %4b\t\t\t\t%4b", x, y, sel_1, sel_2, Resf0703);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0703_or, Resf0703_Nor);

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

[Running] Guia_0703.v
Guia_0703 - Davi Cândido de Almeida - 857859
Test LU's module
   x    y    (0-NAND/NOR)/(1-AND/OR) (0-AND/NAND)/(1-OR/NOR)   Result
   0    0				   0					0				 1
   0    0				   0					1				 1
   0    0				   1					0				 0
   0    0				   1					1			     0
   0    1				   0					0				 1
   0    1				   0					1				 0
   0    1				   1					0				 0
   0    1				   1					1				 1
   1    0				   0					0				 1
   1    0				   0					1				 0
   1    0				   1					0				 0
   1    0				   1					1				 1
   1    1				   0					0				 0
   1    1				   0					1				 0
   1    1				   1					0				 1
   1    1				   1					1				 1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0703.vvp Guia_0703.v
Para executar: vvp Guia_0703.vvp
*/

