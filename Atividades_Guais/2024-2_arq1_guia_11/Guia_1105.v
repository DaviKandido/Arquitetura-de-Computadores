/*
    -identificação: 

 Guia_1105 - 11 / 10 / 2024

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
   start   = 3'b000, 
   id1     = 3'b001, 
   id11    = 3'b011, 
   id110   = 3'b010, 
   id1101  = 3'b110, 
   id1111  = 3'b111;
 
   reg [2:0] E1; // current state variables 
   reg [2:0] E2; // next state logic output 
 
// next state logic 
   always @( x or E1) //x000 //Volta direto ao start caso não encontrado
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = id110; 
        else 
         E2 = id1; 
      id1: 
        if ( x ) 
         E2 = id11; 
        else 
         E2 = start; 
      id11: 
        if ( x ) 
         begin 
           E2 =  id1101; 
           y  = `notfound; 
         end 
        else 
         begin 
           E2 =  id1111; 
           y  = `found; 
         end 
      id110: 
        if ( x ) 
         E2 = id1101; 
        else 
         E2 = start; 
      id1101: 
        if ( x ) 
         E2 = id110; 
        else 
         E2 = id1111; 
      id1111: 
        if ( x ) 
         begin 
           E2 =  id11; 
           y  = `found; 
         end 
        else 
         begin 
           E2 =  id1; 
           y  = `notfound; 
         end 
      default:   // undefined state 
           E2 =  3'bxxx; 
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
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0;
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

[Running] Guia_1105.v
Time     X   Mealy
  10     0     0
  20     1     0
  30     0     1 // Sequencia 010 encontrada
  40     1     1 // Sequencia 101 encontrada levando em conta a interseção
  50     1     0 
  60     0     0
  70     1     1 // Sequencia 101 encontrada
  80     0     1 // Sequencia 010 encontrada levando em conta a interseção
  90     1     1 // Sequencia 101 encontrada levando em conta a interseção
 100     0     1 // Sequencia 010 encontrada levando em conta a interseção
 110     0     0
 120     0     0
 130     0     0
 140     1     0
 150     0     1 // Sequencia 010 encontrada
 160     0     0
 170     1     0
 180     1     0
 190     1     0

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1104.vvp Guia_1104.v
Para executar: vvp Guia_1104.vvp
*/
