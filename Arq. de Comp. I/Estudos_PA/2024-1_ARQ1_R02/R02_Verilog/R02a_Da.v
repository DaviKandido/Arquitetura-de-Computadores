/*
    -identificação: 

 R02a_Da - 30 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

 
`include "Flip_Flop_D.v" 
`include "Flip_Flop_T.v" 


module SimplificacaoDa(output Qa, input clk, input a, input b, input c, input d);

 wire QNot_a, simp;

 assign simp = ~a & b & c & d | a & ~c & d | a & ~b & c | a & c & ~d;

 dff Flip_Flop_Da(Qa, QNot_a, simp, clk, 1'b0, 1'b0);

endmodule

module R02a_Da; 
 reg   clk; 
 reg a, b, c, d;
 integer m; 
 wire out;

 SimplificacaoDa Da (out, clk, a, b, c, d); 

 initial begin 
   $display("           Simplificacao Da:\n Time -  m -   a    b    c    d = out"); 

 end 
 
 // Geração do clock
 initial begin
    clk = 0;
    forever #5 clk = ~clk;
 end

 // Estímulos de teste
 initial begin
    $monitor("%4d  %4d  %4b %4b %4b %4b %4b", $time, m, a, b, c, d, out);

        m = 0;  a = 0; b = 0; c = 0; d = 0;
    #10 m = 1;  a = 0; b = 0; c = 0; d = 1;
    #10 m = 2;  a = 0; b = 0; c = 1; d = 0;
    #10 m = 3;  a = 0; b = 0; c = 1; d = 1;
    #10 m = 4;  a = 0; b = 1; c = 0; d = 0;
    #10 m = 5;  a = 0; b = 1; c = 0; d = 1;
    #10 m = 6;  a = 0; b = 1; c = 1; d = 0;
    #10 m = 7;  a = 0; b = 1; c = 1; d = 1;
    #10 m = 8;  a = 1; b = 0; c = 0; d = 0;
    #10 m = 9;  a = 1; b = 0; c = 0; d = 1;
    #10 m = 10; a = 1; b = 0; c = 1; d = 0;
    #10 m = 11; a = 1; b = 0; c = 1; d = 1;
    #10 m = 12; a = 1; b = 1; c = 0; d = 0;
    #10 m = 13; a = 1; b = 1; c = 0; d = 1;
    #10 m = 14; a = 1; b = 1; c = 1; d = 0;
    #10 m = 15; a = 1; b = 1; c = 1; d = 1;

    #10 $finish;
 end 
 
endmodule // R02a_Da

/*
    -Saídas de resultados:

               Simplificacao Da:
 Time -  m -   a    b    c    d = out
   0     0     0    0    0    0    x
   5     0     0    0    0    0    0
  10     1     0    0    0    1    0
  20     2     0    0    1    0    0
  30     3     0    0    1    1    0
  40     4     0    1    0    0    0
  50     5     0    1    0    1    0
  60     6     0    1    1    0    0
  70     7     0    1    1    1    0
  75     7     0    1    1    1    1
  80     8     1    0    0    0    1
  85     8     1    0    0    0    0
  90     9     1    0    0    1    0
  95     9     1    0    0    1    1
 100    10     1    0    1    0    1
 110    11     1    0    1    1    1
 120    12     1    1    0    0    1
 125    12     1    1    0    0    0
 130    13     1    1    0    1    0
 135    13     1    1    0    1    1
 140    14     1    1    1    0    1
 150    15     1    1    1    1    1
 155    15     1    1    1    1    0

*/

/*
    -Notas:

Para compilar: iverilog -o R02a_Da.vvp R02a_Da.v
Para executar: vvp R02a_Da.vvp
*/
