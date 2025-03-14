/*
    -identificação: 

 Guia_1101 - 10 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
 
`include "mealy_1101.v" 
`include "moore_1101.v" 
 
module Guia_1101; 
 reg   clk, reset, x; 
 wire  m1, m2; 
 
 mealy_1101  mealy1 ( m1, x, clk, reset ); 
 moore_1101 moore1 ( m2, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Mealy Moore" ); 
 
// initial values 
       clk    = 1; 
       reset = 0; 
       x       = 0; 
 
// input signal changing 
  #5    reset = 1; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #20  x = 0; 
  #10  x = 1; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b %5b", $time, x, m1, m2 ); 
  end // always at positive edge clocking changing 
 
endmodule // Guia_1100 

/*
    -Saídas de resultados:

[Running] Moore_1101.v
[Running] Guia_1100.v
Time     X   Mealy Moore
  10     0     0     0
  20     1     0     0
  30     0     0     0
  40     1     0     0
  50     1     0     0
  60     0     0     0
  70     1     1     0
  80     1     0     1
  90     0     0     0
 100     1     1     0
 110     1     0     1
 120     1     0     0
*/

/*
    -Notas:

Para compilar: iverilog -o moore_1101.vvp moore_1101.v
Para executar: vvp moore_1101.vvp
*/
