/*
    -identificação: 

Guia_0701 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



// f7_gate
// -------------------------
module f7 ( output s, input a, input b, input select );
    // descrever por portas

    wire andAB;

    and AND1(andAB, a, b);
    and AND2(s, andAB, ~select);

endmodule // f7


// -------------------------
// multiplexer
// -------------------------
module mux( output s, input a, input b, input select );
    
    // definir dados locais
    wire nandAB;

    nand NAND1(nandAB, a, b);
    and AND2(s, nandAB, select);
    

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg x;
    reg y;
    reg sel;
    wire Resf7;
    wire ResfMux;
    f7 modulo ( Resf7, x, y, sel );
    mux MUX1 ( ResfMux, x, y, sel );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0701 - Davi Cândido de Almeida - 857859");
        $display("Test LU's module");
        $display("   x    y    s    nand and");
        // projetar testes do modulo
        #1 x = 1'b0; y = 1'b0; sel = 1'b0;

        #1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, ResfMux, Resf7);
        #1 x = 1'b0; y = 1'b1; sel = 1'b0;
        #1 x = 1'b1; y = 1'b1; sel = 1'b0;

        #1 x = 1'b0; y = 1'b0; sel = 1'b1;
        #1 x = 1'b0; y = 1'b1; sel = 1'b1;
        #1 x = 1'b1; y = 1'b1; sel = 1'b1;

    end
endmodule // test_f7


/*
    -Saídas de resultados:

Guia_0701 - Davi Cândido de Almeida - 857859
Test LU's module
   x    y    s    nand and
   0    0    0     0    0
   0    1    0     0    0
   1    1    0     0    1
   0    0    1     1    0
   0    1    1     1    0
   1    1    1     0    0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0701.vvp Guia_0701.v
Para executar: vvp Guia_0701.vvp
*/

