/*
    -identificação: 

Guia_0707 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


 module f0707( output s, input a1, input b1, input c1, input a2, input b2, input c2);
    
    // definir dados locais

  and AND1(and1, ~a2, ~b2, ~c2, (a1 | b1 | c1));
  and AND2(and2, ~a2, ~b2,  c2, (a1 | b1) );
  and AND3(and3, ~a2,  b2, ~c2, ((c1 & b1) | a1));
  and AND4(and4, ~a2,  b2,  c2, a1);
  and AND5(and5,  a2, ~b2, ~c2, ((a1 & b1)|c1));
  and AND6(and6,  a2, ~b2,  c2, b1);
  and AND7(and7,  a2,  b2, ~c2, c1);

  or OR1(s, and1, and2, and3, and4, and5, and6, and7);

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg a1;
    reg b1;
    reg c1;

    reg a2;
    reg b2;
    reg c2;


    f0707 f0707 ( Resf0707, a1, b1, c1, a2, b2, c2 );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0707 - Davi Cândido de Almeida - 857859");
        $display("  Comparações: 1-maior  0-menor   ");
 
        $display("   a1  b1  c1   a2  b2  c2     Result");
        // projetar testes do modulo
        a1 = 1'b0; b1 = 1'b0; c1= 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;

        #1 $monitor("%4b%4b%4b %4b%4b%4b    %4b", a1, b1, c1, a2, b2, c2,  Resf0707);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0707_or, Resf0707_Nor);

  // Combinations with sel_3 = 0
        // sel_1 = 0, sel_2 = 0
        a1 = 1'b0; b1 = 1'b0; c1 = 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b1; c1 = 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b0; c1 = 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b1; c1 = 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b0; c1 = 1'b0; a2 = 1'b1; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b1; c1 = 1'b0; a2 = 1'b1; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b0; c1 = 1'b0; a2 = 1'b1; b2 = 1'b0; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b1; c1 = 1'b0; a2 = 1'b1; b2 = 1'b0; #1; c2 = 1'b0; #1;

        a1 = 1'b0; b1 = 1'b0; c1 = 1'b0; a2 = 1'b0; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b1; c1 = 1'b0; a2 = 1'b0; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b0; c1 = 1'b0; a2 = 1'b0; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b1; c1 = 1'b0; a2 = 1'b0; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b0; c1 = 1'b0; a2 = 1'b1; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b0; b1 = 1'b1; c1 = 1'b0; a2 = 1'b1; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b0; c1 = 1'b0; a2 = 1'b1; b2 = 1'b1; #1; c2 = 1'b0; #1;
        a1 = 1'b1; b1 = 1'b1; c1 = 1'b0; a2 = 1'b1; b2 = 1'b1; #1; c2 = 1'b0; #1;


    end
endmodule // test_f7


/*
    -Saídas de resultados:

Guia_0707 - Davi Cândido de Almeida - 857859
  Comparações: 1-maior  0-menor   
   a1  b1  c1   a2  b2  c2     Result
   0   0   0    0   0   0       0
   0   1   0    0   0   0       1
   1   0   0    0   0   0       1
   1   1   0    0   0   0       1
   0   0   0    1   0   0       0
   0   1   0    1   0   0       0
   1   0   0    1   0   0       0
   1   1   0    1   0   0       1
   0   0   0    0   1   0       0
   0   1   0    0   1   0       0
   1   0   0    0   1   0       1
   1   1   0    0   1   0       1
   0   0   0    1   1   0       0
   0   1   0    1   1   0       0
   1   0   0    1   1   0       0
   1   1   0    1   1   0       0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0707.vvp Guia_0707.v
Para executar: vvp Guia_0707.vvp
*/

