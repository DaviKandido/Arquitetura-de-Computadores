/*
    -identificação: 

Guia_0706 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



 module f0706( output s, input a1, input b1, input c1, input a2, input b2, input c2);
    
    // definir dados locais

    xnor XNOR1(xnor1, a1, a2);
    xnor XNOR2(xnor2, b1, b2);
    xnor XNOR3(xnor3, c1, c2);

    and AND(s, xnor1, xnor2, xnor3);

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg a1;
    reg b1;
    reg c1;

    reg a2;
    reg b2;
    reg c2;



    f0706 f0706 ( Resf0706, a1, b1, c1, a2, b2, c2 );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0706 - Davi Cândido de Almeida - 857859");
        $display("  Comparações: 1-igual  0-diferente   ");
 
        $display("   a1  b1  c1   a2  b2  c2     Result");
        // projetar testes do modulo
        a1 = 1'b0; b1 = 1'b0; c1= 1'b0; a2 = 1'b0; b2 = 1'b0; #1; c2 = 1'b0; #1;

        #1 $monitor("%4b%4b%4b %4b%4b%4b    %4b", a1, b1, c1, a2, b2, c2,  Resf0706);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0706_or, Resf0706_Nor);

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

Guia_0706 - Davi Cândido de Almeida - 857859
  Comparações: 1-igual  0-diferente   
   a1  b1  c1   a2  b2  c2     Result
   0   0   0    0   0   0       1
   0   1   0    0   0   0       0
   1   0   0    0   0   0       0
   1   1   0    0   0   0       0
   0   0   0    1   0   0       0
   0   1   0    1   0   0       0
   1   0   0    1   0   0       1
   1   1   0    1   0   0       0
   0   0   0    0   1   0       0
   0   1   0    0   1   0       1
   1   0   0    0   1   0       0
   1   1   0    0   1   0       0
   0   0   0    1   1   0       0
   0   1   0    1   1   0       0
   1   0   0    1   1   0       0
   1   1   0    1   1   0       1
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0706.vvp Guia_0706.v
Para executar: vvp Guia_0706.vvp
*/

