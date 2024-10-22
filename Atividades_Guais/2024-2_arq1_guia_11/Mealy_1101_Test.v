/*
    -identificação: 

 Mealy_1101_Test - 10 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// -------------- 
// --- Mealy FSM 
// -------------- 
 
/* 
                        Mealy FSM Diagram 
                      ___________________ 
                    /                    \ 
              1    v     1           0  1 | // found 
   [start] ---> [id1] ---> [id11] ---> [id110] 
     ^  \0      0 |       1 /  ^        0 | // not found 
      \_/        /          \__/          | 
       \________/                         | 
        \                                 | 
         \________________________________/ 
*/ 
 
// constant definitions 
`define found      1 
`define notfound 0 
 
// FSM by Mealy 
module mealy_1101 ( y, x, clk, reset ); 
 output reg y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 parameter      // state identifiers  
   start    = 2'b00, 
   id1      = 2'b01, 
   id11    = 2'b11, 
   id110  = 2'b10; 
 
 reg [1:0] E1; // current state 
 reg [1:0] E2; // next state logic output 

 // next state logic 
 always @( x or E1 ) begin 
   case ( E1 ) 
     start: 
       if ( x ) 
         E2 = id1; 
       else 
         E2 = start; 
     id1: 
       if ( x ) 
         E2 = id11; 
       else 
         E2 = start; 
     id11: 
       if ( x ) 
         E2 = id11; 
       else 
         E2 = id110; 
     id110: 
       if ( x ) begin 
         E2 = id1; 
       end else begin 
         E2 = start; 
       end
     default:    
       E2 = 2'bxx; 
   endcase 
 end // always at signal or state changing 
 
// state variables 
 always @( posedge clk or posedge reset ) begin 
   if ( reset ) begin
     E1 <= start;   
     y <= `notfound; 
   end else begin
     E1 <= E2;      
     if (E1 == id110 && x) 
       y <= `found; 
     else 
       y <= `notfound; 
   end 
 end 
 
endmodule // mealy_1101

module Mealy_1101; 

  // Inputs
  reg x;
  reg clk;
  reg reset;
  reg [7:0] entrada; 

  // Outputs
  wire y;

  mealy_1101 uut ( y ,x, clk, reset);

  always #10 clk = ~clk; // Clock alterna a cada 10 unidadedes de tempo

  initial begin

    clk = 0;
    reset = 0;
    x = 0;

    reset = 1; #15;   // Aplica 15 unidades de tempo
    reset = 0;

    // Test 1: Sequence "1101"
    entrada = 4'b1101;

    x = entrada[3]; #20;  
    x = entrada[2]; #20;  
    x = entrada[1]; #20;  
    x = entrada[0]; #20;  // Final deve ser 1

    // Test 2: Sequence "1110"
    reset = 1; #15;
    reset = 0;

    entrada = 4'b1110;

    x = entrada[3]; #20;  
    x = entrada[2]; #20;  
    x = entrada[1]; #20;  
    x = entrada[0]; #20;  // Final deve ser 0


    // Test 3: Sequence "101"
    reset = 1; #15;
    reset = 0;

    entrada = 3'b101;

    x = entrada[2]; #20;  
    x = entrada[1]; #20;  
    x = entrada[0]; #20;  // Final deve ser 0

    // Test 4: Sequence "1101"
    reset = 1; #15;
    reset = 0;

    entrada = 8'b1101101; //Verifica detecção em um sequência contida em outra


    x = entrada[7]; #20; 
    x = entrada[6]; #20;  
    x = entrada[5]; #20;  
    x = entrada[4]; #20;  // Final deve ser 1
    x = entrada[3]; #20; 
    x = entrada[2]; #20;  
    x = entrada[1]; #20;  
    x = entrada[0]; #20;  // Final deve ser 1


    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %5d, x = %b, y = %b, entrada = %4b, reset = %b", $time, x, y, entrada, reset);
  end

endmodule

/*
    -Saídas de resultados:

[Running] Mealy_1101.v
Time =     0, x = 0, y = 0, entrada = xxxxxxxx, reset = 1
Time =    15, x = 1, y = 0, entrada = 00001101, reset = 0
Time =    55, x = 0, y = 0, entrada = 00001101, reset = 0
Time =    75, x = 1, y = 0, entrada = 00001101, reset = 0
Time =    90, x = 1, y = 1, entrada = 00001101, reset = 0 //Saida 1 em y confirmando a sequencia
Time =    95, x = 1, y = 0, entrada = 00001101, reset = 1
Time =   110, x = 1, y = 0, entrada = 00001110, reset = 0
Time =   170, x = 0, y = 0, entrada = 00001110, reset = 0
Time =   190, x = 0, y = 0, entrada = 00001110, reset = 1
Time =   205, x = 1, y = 0, entrada = 00000101, reset = 0
Time =   225, x = 0, y = 0, entrada = 00000101, reset = 0
Time =   245, x = 1, y = 0, entrada = 00000101, reset = 0
Time =   265, x = 1, y = 0, entrada = 00000101, reset = 1 
Time =   280, x = 0, y = 0, entrada = 01101101, reset = 0
Time =   300, x = 1, y = 0, entrada = 01101101, reset = 0
Time =   340, x = 0, y = 0, entrada = 01101101, reset = 0
Time =   360, x = 1, y = 0, entrada = 01101101, reset = 0
Time =   370, x = 1, y = 1, entrada = 01101101, reset = 0 //Saida 1 em y confirmando a sequencia
Time =   390, x = 1, y = 0, entrada = 01101101, reset = 0
Time =   400, x = 0, y = 0, entrada = 01101101, reset = 0
Time =   420, x = 1, y = 0, entrada = 01101101, reset = 0
Time =   430, x = 1, y = 1, entrada = 01101101, reset = 0 //Saida 1 em y confirmando a sequencia
*/


/*
    -Notas:

Para compilar: iverilog -o  Mealy_1101_Test.vvp  Mealy_1101_Test.v
Para executar: vvp  Mealy_1101_Test.vvp
*/
