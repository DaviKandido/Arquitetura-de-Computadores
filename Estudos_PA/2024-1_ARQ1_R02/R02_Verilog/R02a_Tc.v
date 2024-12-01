/*
    -identificação: 

 R02a_Tc - 30 / 11 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

 
`include "Flip_Flop_T.v" 


module SimplificacaoTc(output Qa, input clk, input a, input b, input c, input d);

 wire QNot_a, simp;

 assign simp = ~c&d | a&b&d;

 tff Flip_Flop_Tc(Qa, QNot_a, simp, clk, 1'b0, 1'b0);

endmodule

module R02a_Tc; 
 reg   clk; 
 reg a, b, c, d;
 integer m; 
 wire out;

 SimplificacaoTc tc (out, clk, a, b, c, d); 

 initial begin 
   $display("           Simplificacao tc:\n Time -  m -   a    b    c    d = out"); 

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
    #20 m = 1;  a = 0; b = 0; c = 0; d = 1;
    #20 m = 2;  a = 0; b = 0; c = 1; d = 0;
    #20 m = 3;  a = 0; b = 0; c = 1; d = 1;
    #20 m = 4;  a = 0; b = 1; c = 0; d = 0;
    #20 m = 5;  a = 0; b = 1; c = 0; d = 1;
    #20 m = 6;  a = 0; b = 1; c = 1; d = 0;
    #20 m = 7;  a = 0; b = 1; c = 1; d = 1;
    #20 m = 8;  a = 1; b = 0; c = 0; d = 0;
    #20 m = 9;  a = 1; b = 0; c = 0; d = 1;
    #20 m = 10; a = 1; b = 0; c = 1; d = 0;
    #20 m = 11; a = 1; b = 0; c = 1; d = 1;
    #20 m = 12; a = 1; b = 1; c = 0; d = 0;
    #20 m = 13; a = 1; b = 1; c = 0; d = 1;
    #20 m = 14; a = 1; b = 1; c = 1; d = 0;
    #20 m = 15; a = 1; b = 1; c = 1; d = 1;

    #10 $finish;
 end 
 
endmodule // R02a_Tc

/*
    -Saídas de resultados:


    Obs: Por algum motivo continuo com o problema do flip flop tipo T mantendo a Saida fixa em somente 0 ou somente 1

         Simplificacao tc:
 Time -  m -   a    b    c    d = out
   0     0     0    0    0    0    0
  20     1     0    0    0    1    0
  40     2     0    0    1    0    0
  60     3     0    0    1    1    0
  80     4     0    1    0    0    0
 100     5     0    1    0    1    0
 120     6     0    1    1    0    0
 140     7     0    1    1    1    0
 160     8     1    0    0    0    0
 180     9     1    0    0    1    0
 200    10     1    0    1    0    0
 220    11     1    0    1    1    0
 240    12     1    1    0    0    0
 260    13     1    1    0    1    0
 280    14     1    1    1    0    0
 300    15     1    1    1    1    0

*/

/*
    -Notas:

Para compilar: iverilog -o R02a_Tc.vvp R02a_Tc.v
Para executar: vvp R02a_Tc.vvp
*/
