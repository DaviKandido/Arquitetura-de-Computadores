/*
    identificação: 

R0103 - 15 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// a.) (~a|b) & (b|~c)
// b.) (x'.y)'.(x'.y')'

 module f_a ( output s, input a, b, c );

   assign s = (~a|b) & (b|~c);
 endmodule // s = f (x,y)

  module f_b ( output s, input x, input y );

   assign s = ~(~x&y) & ~(~x&~y);

 endmodule // s = f (x,y)


module R0103;
    // define data
    reg x; // decimal
    reg y; // decimal
    reg z; // decimal
    wire sA; // decimal
    wire sB; // decimal

    f_a f01a(sA, x, y, z);
    f_b f01b(sB, x, y);
    // actions
    initial
        begin : main
            $display ( "R0103 - Tests" );

            $display("   x    y    z ");
            $display("   a    b    c    sA   sB");
            $monitor("%4b %4b %4b %4b %4b", x, y, z, sA, sB);

               x = 1'b0; y = 1'b0; z = 1'b0;
            #1 x = 1'b0; y = 1'b0; z = 1'b1;
            #1 x = 1'b0; y = 1'b1; z = 1'b0;
            #1 x = 1'b0; y = 1'b1; z = 1'b1;
            #1 x = 1'b1; y = 1'b0; z = 1'b0;
            #1 x = 1'b1; y = 1'b1; z = 1'b0;
            #1 x = 1'b1; y = 1'b1; z = 1'b1;

        end // main
endmodule // R0103

/*
    -Saídas de resultados:

R0103 - Tests
   x    y    z 
   a    b    c    sA   sB
   0    0    0    1    0
   0    0    1    0    0
   0    1    0    1    0
   0    1    1    1    0
   1    0    0    0    1
   1    1    0    1    1
   1    1    1    1    1

*/

/*
    -Notas:

Para compilar: iverilog -o R0103.vvp R0103.v
Para executar: vvp R0103.vvp
*/

