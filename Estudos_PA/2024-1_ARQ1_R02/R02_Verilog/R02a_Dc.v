/*
    -identificação: 

 R02a_Dc - 30 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

 
`include "Flip_Flop_D.v" 
`include "Flip_Flop_T.v" 


module SimplificacaoDc(output Qa, input clk, input a, input b, input c, input d);

 wire QNot_a, simp;

 assign simp = ~c&d | c&~d | ~a&d | ~b&d;

 dff Flip_Flop_Dc(Qa, QNot_a, simp, clk, 1'b0, 1'b0);

endmodule

module R02a_Dc; 
 reg   clk; 
 reg a, b, c, d;
 integer m; 
 wire out;

 SimplificacaoDc Dc (out, clk, a, b, c, d); 

 initial begin 
   $display("           Simplificacao Dc:\n Time -  m -   a    b    c    d = out"); 

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
 
endmodule // R02a_Dc

/*
    -Saídas de resultados:

           Simplificacao Dc:
 Time -  m -   a    b    c    d = out
   0     0     0    0    0    0    x
   5     0     0    0    0    0    0
  10     1     0    0    0    1    0
  15     1     0    0    0    1    1
  20     2     0    0    1    0    1
  30     3     0    0    1    1    1
  40     4     0    1    0    0    1
  45     4     0    1    0    0    0
  50     5     0    1    0    1    0
  55     5     0    1    0    1    1
  60     6     0    1    1    0    1
  70     7     0    1    1    1    1
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

Para compilar: iverilog -o R02a_Dc.vvp R02a_Dc.v
Para executar: vvp R02a_Dc.vvp
*/
