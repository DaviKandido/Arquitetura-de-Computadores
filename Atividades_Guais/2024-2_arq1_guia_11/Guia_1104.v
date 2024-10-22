/*
    -identificação: 

 Guia_1104 - 11 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
 
/*

  x->0->0->0


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
   always @( x or E1) //x000 //Volta direto ao start caso não encontrado
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = id1; 
      id1: 
        if ( x ) 
         E2 = start; 
        else 
         E2 = id11; 
      id11: 
        if ( x ) 
         E2 = start; 
        else 
         E2 = id110; 
      id110: 
        if ( x ) 
         begin 
           E2 =  id1; 
           y  = `notfound; 
         end 
        else 
         begin 
           E2 =  id110; 
           y  = `found; 
         end 
      default:   // undefined state 
           E2 =  2'bxx; 
     endcase 
    end // always at signal or state changing 
 
// state variables 
   always @( posedge clk or negedge reset ) 
    begin 
     if (reset) 
      E1 = E2;    // updates current state 
     else 
      E1 = 0;     // reset 
    end // always at signal changing 
 
endmodule // mealy_1101
 
module Guia_1104; 
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

  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; //Teste de sequencia alternativa

  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0;
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0;
  #10  x = 0;
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


[Running] Guia_1104.v
Time     X   Mealy
  10     0     0
  20     1     0
  30     0     0
  40     1     0
  50     1     0
  60     0     0
  70     0     0
  80     0     1 // Sequencia x000 encontrada
  90     1     0
 100     0     0
 110     0     0
 120     0     1 // Sequencia x000 encontrada levando em conta a interseção dos anteriores
 130     1     0
 140     0     0
 150     0     0
 160     0     0
 170     0     1 // Sequencia x000 encontrada
 180     0     1 // Sequencia x000 encontrada levando em conta a interseção dos anteriores
 190     0     1 // Sequencia x000 encontrada levando em conta a interseção dos anteriores

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1104.vvp Guia_1104.v
Para executar: vvp Guia_1104.vvp
*/
