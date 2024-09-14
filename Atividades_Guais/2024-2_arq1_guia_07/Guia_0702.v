/*
    -identificação: 

Guia_0702 - 12 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



// f7_gate
// -------------------------
module f0702_OR ( output s, input a, input b, input select );
    // descrever por portas

    wire orAB;

    or or1(orAB, a, b);
    and AND2(s, orAB, ~select);

endmodule // f7


// -------------------------
// multiplexer
// -------------------------
module f0702_NOR( output s, input a, input b, input select );
    
    // definir dados locais
    wire norAB;

    nor nor1(norAB, a, b);
    and AND2(s, norAB, select);

    

 endmodule // mux


 module f0702_OReNOR( output s, input a, input b, input select );
    
    // definir dados locais
   wire norAB;
    wire resulNOR;

    nor nor1(norAB, a, b);
    and AND2(resulNOR, norAB, select);

    wire orAB;
    wire resulOR;

    or or1(orAB, a, b);
    and AND3(resulOR, orAB, ~select);

    or Resl(s, resulNOR, resulOR);
    

 endmodule // mux
    
 module test_f7;

    // ------------------------- definir dados
    reg x;
    reg y;
    reg sel;

    //f0702_OR f0702_OR ( Resf0702_or, x, y, sel );
    //f0702_NOR f0702_NOR ( Resf0702_Nor, x, y, sel );
    f0702_OReNOR f0702_OReNOR ( Resf0702_OReNor, x, y, sel );

    // ------------------------- parte principal
    initial
    begin : main
        $display("Guia_0701 - Davi Cândido de Almeida - 857859");
        $display("Test LU's module");
        $display("   x    y    s     OR/NOR");
        // projetar testes do modulo
        #1 x = 1'b0; y = 1'b0; sel = 1'b0;

        #1 $monitor("%4b %4b %4b  %4b", x, y, sel, Resf0702_OReNor);
        //#1 $monitor("%4b %4b %4b  %4b %4b", x, y, sel, Resf0702_or, Resf0702_Nor);

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
   x    y    s     OR   NOR
   0    0    0     0    0
   0    1    0     1    0
   1    1    0     1    0
   0    0    1     0    1
   0    1    1     0    0
   1    1    1     0    0

Guia_0701 - Davi Cândido de Almeida - 857859
Test LU's module
   x    y    s     OR/NOR
   0    0    0     0
   0    1    0     1
   1    1    0     1
   0    0    1     1
   0    1    1     0
   1    1    1     0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0701.vvp Guia_0701.v
Para executar: vvp Guia_0701.vvp
*/

