/*
    -identificação: 

 Guia_1101 - 10 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
 
/*

  1->0->0->1


*/

// constant definitions 
`define found    1 
`define notfound 0 
 
// FSM by Mealy 
module mealy_1101 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter      // state identifiers  
   start    = 2'b00, 
   id1      = 2'b01, 
   id11    = 2'b11, 
   id110  = 2'b10; 
 
   reg [1:0] E1; // current state variables 
   reg [1:0] E2; // next state logic output 
 
// next state logic 
   always @( x or E1) //1001
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = start; 
      id1: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = id11; 
      id11: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = id110; 
      id110: 
        if ( x ) 
         begin 
           E2 =  id1; 
           y  = `found; 
         end 
        else 
         begin 
           E2 =  start; 
           y  = `notfound; 
         end 
      default:   // undefined state 
           E2 =  2'bxx; 
     endcase 
    end // always at signal or state changing 
 
// state variables 
   always @( posedge clk or negedge reset ) 
    begin 
     if ( reset != y)  //AQUI EU FAÇO A MAQUINA PARAR ASSIM QUE A SEQUENCIA É ENCONTRADA
      E1 = E2;    // updates current state 
     else 
      E1 = 0;     // reset 
    end // always at signal changing 
 
endmodule // mealy_1101
 
module Guia_1101; 
 reg   clk, reset, x; 
 wire  m1, m2; 
 
 mealy_1101  mealy1 ( m1, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Mealy" ); 
 
// initial values 
       clk   = 1; 
       reset = 0; 
       x     = 0; 
 
// input signal changing 
  #5    reset = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b", $time, x, m1 ); 
  end // always at positive edge clocking changing 
 
endmodule // Guia_1100 

/*
    -Saídas de resultados:

[Running] Guia_1101.v
Time     X   Mealy
  10     0     0
  20     0     0
  30     1     0
  40     0     0
  50     0     0
  60     1     1 // Sequencia 1001 encontrada
  70     0     0
  80     0     0
  90     1     0 // Parou de identificar a sequencia pois já foi encontrada
 100     0     0
 110     0     0
 120     0     0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1101.vvp Guia_1101.v
Para executar: vvp Guia_1101.vvp
*/
