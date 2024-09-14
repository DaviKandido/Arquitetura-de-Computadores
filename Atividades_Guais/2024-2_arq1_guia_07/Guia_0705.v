/*
    -identificação: 

Guia_0705 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



 module f0705( output s, input a, input b, input sel_1, input sel_2, input sel_3 );
    
    // definir dados locais

    not not1(not1, b);
    and AND1(Res1, not1, ~sel_1, ~sel_2, ~sel_3);

    and and11(and11, a, b);
    and AND2(Res2, and11, ~sel_1, ~sel_2, sel_3);

    nand nand1(nand1, a, b);
    and AND3(Res3, nand1, ~sel_1, sel_2, ~sel_3);

    or or1(or1, a, b);
    and AND4(Res4, or1, ~sel_1, sel_2, sel_3);

    nor nor1(nor1, a, b);
    and AND5(Res5, nor1, sel_1, ~sel_2, ~sel_3);

    xor xor1(xor1, a, b);
    and AND6(Res6, xor1, sel_1, ~sel_2, sel_3);

    xnor xnor1(xnor1, a, b);
    and AND7(Res7, xnor1, sel_1, sel_2, sel_3);


    or OR2(s, Res1, Res2, Res3, Res4, Res5, Res6, Res7);

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg x;
    reg y;
    reg sel_1;
    reg sel_2;
    reg sel_3;


    f0705 f0705 ( Resf0705, x, y, sel_1, sel_2, sel_3 );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0705 - Davi Cândido de Almeida - 857859");
        $display("000-NOT 001-AND 010-NAND 011-OR 100-NOR 101-XOR 111-XNOR   ");
 
        $display("   x    y   \t\t  s  \t\t    Result");
        // projetar testes do modulo
        #1 x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0;

        #1 $monitor("%4b %4b\t %4b%4b%4b \t\t%4b", x, y, sel_1, sel_2, sel_3, Resf0705);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0705_or, Resf0705_Nor);

  // Combinations with sel_3 = 0
        // sel_1 = 0, sel_2 = 0
        x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b0; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b0; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b0; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b0; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b0; #1;

        // Combinations with sel_3 = 1
        // sel_1 = 0, sel_2 = 0
        x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b0; sel_3 = 1'b1; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b0; sel_2 = 1'b1; sel_3 = 1'b1; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b0; sel_3 = 1'b1; #1;

        x = 1'b0; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b0; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b0; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b1; #1;
        x = 1'b1; y = 1'b1; sel_1 = 1'b1; sel_2 = 1'b1; sel_3 = 1'b1; #1;


    end
endmodule // test_f7


/*
    -Saídas de resultados:

Guia_0705 - Davi Cândido de Almeida - 857859
000-NOT 001-AND 010-NAND 011-OR 100-NOR 101-XOR 111-XNOR   
   x    y   	    s  		     Result
   0    0	    0   0   0 		   1
   0    1	    0   0   0 		   0
   1    0	    0   0   0 		   1
   1    1	    0   0   0 		   0
   0    0	    0   1   0 		   1
   0    1	    0   1   0 		   1
   1    0	    0   1   0 		   1
   1    1	    0   1   0 		   0
   0    0	    1   0   0 		   1
   0    1	    1   0   0 		   0
   1    0	    1   0   0 		   0
   1    1	    1   0   0 		   0
   0    0	    1   1   0 		   0
   0    1	    1   1   0 		   0
   1    0	    1   1   0 		   0
   1    1	    1   1   0 		   0
   0    0	    0   0   1 		   0
   0    1	    0   0   1 		   0
   1    0	    0   0   1 		   0
   1    1	    0   0   1 		   1
   0    0	    0   1   1 		   0
   0    1	    0   1   1 		   1
   1    0	    0   1   1 		   1
   1    1	    0   1   1 		   1
   0    0	    1   0   1 		   0
   0    1	    1   0   1 		   1
   1    0	    1   0   1 		   1
   1    1	    1   0   1 		   0
   0    0	    1   1   1 		   1
   0    1	    1   1   1 		   0
   1    0	    1   1   1 		   0
   1    1	    1   1   1 		   1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0705.vvp Guia_0705.v
Para executar: vvp Guia_0705.vvp
*/

