/*
    -identificação: 

 Guia_1103 - 11 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
 
/*

  1->0->0->1


*/
// constant definition 
`define found      1 
`define notfound 0 
 
// FSM by Moore 
module  moore_1101 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter        // state identifiers 
   start     = 3'b000, 
   id1       = 3'b001, 
   id11     = 3'b011, 
   id110   = 3'b010, 
   id1101 = 3'b110;  //  signal found 
 
   reg [2:0] E1; // current state variables 
   reg [2:0] E2; // next state logic output 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     case( E1 ) 
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
         E2 = id1101; 
        else 
         E2 = start; 
      id1101: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = id11; 
     default:   // undefined state 
         E2 = 3'bxxx; 
     endcase 
    end // always at signal or state changing 
 
// state variables 
   always @( posedge clk or negedge reset ) 
    begin 
     if ( reset ) 
      E1 = E2;    // updates current state 
     else 
      E1 = 0;     // reset 
    end // always at signal changing 
 
// output logic 
   always @( E1 ) 
    begin 
     y = E1[2];   // first bit of state value (MOORE indicator) 
    end // always at state changing 
 
endmodule // moore_1101
 
module Guia_1103; 
 reg   clk, reset, x; 
 wire  m1, m2; 
 
 moore_1101  moore1 ( m1, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Moore" ); 
 
// initial values 
       clk   = 1; 
       reset = 0; 
       x     = 0; 
 
// input signal changing 
  #5    reset = 1; 

  #10  x = 1;   //10010010001001 
  #10  x = 0; 
  #10  x = 0; 

  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0; 

  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0;
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 0; 
  #10  x = 1; 
 
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

[Running] Guia_1103.v
Time     X   Moore
  10     0     0
  20     1     0
  30     0     0
  40     0     0
  50     1     0
  60     0     1  // Sequencia 1001 encontrada
  70     0     0
  80     1     0
  90     0     1  // Sequencia 1001 encontrada levando em conta a interseção dos anteriores
 100     0     0
 110     0     0
 120     1     0
 130     0     0
 140     0     0
 150     1     0
 160     1     1 // Sequencia 1001 encontrada
 170     1     0

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1103.vvp Guia_1103.v
Para executar: vvp Guia_1103.vvp
*/
