/*
    -identificação: 

 Mealy_1101_Test - 10 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// FSM by Moore 
module  moore_1101 ( y, x, clk, reset ); 
 output reg y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 parameter        // state identifiers 
   start     = 3'b000, 
   id1       = 3'b001, 
   id11      = 3'b011, 
   id110     = 3'b010, 
   id1101    = 3'b110;  //  signal found 

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
         E2 = id11; 
        else 
         E2 = start; 
      id11: 
        if ( x ) 
         E2 = id11; 
        else 
         E2 = id110; 
      id110: 
        if ( x ) 
         E2 = id1101; 
        else 
         E2 = start; 
      id1101: 
        if ( x ) 
         E2 = id11; 
        else 
         E2 = start; 
     default:   // undefined state 
         E2 = 3'bxxx; 
     endcase 
    end // always at signal or state changing 
 
// state variables 
   always @( posedge clk or posedge reset ) 
    begin 
     if ( reset ) 
      E1 <= start;    // Reset to start state 
     else 
      E1 <= E2;      // updates current state 
    end // always at signal changing 
 
// output logic 
   always @( E1 ) 
    begin 
     y = (E1 == id1101);   // Set y to 1 only in id1101 state 
    end // always at state changing 
 
endmodule // moore_1101

module Moore_1101; 

  // Inputs
  reg x;
  reg clk;
  reg reset;
  reg [7:0] entrada; 

  // Outputs
  wire y;

  moore_1101 uut ( y ,x, clk, reset);

  always #10 clk = ~clk; // Clock alterna a cada 10 unidades de tempo

  initial begin

    clk = 0;
    reset = 0;
    x = 1;

    reset = 1; #15;   // Aplica 15 unidades de tempo
    reset = 0;

    // Test 1: Sequence "11011"
    entrada = 5'b11011;

    x = entrada[4]; #20;
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

    entrada = 8'b11011011; // Verifica detecção em um sequência contida em outra

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

[Running] Moore_1101.v
Time =     0, x = 1, y = 0, entrada = xxxxxxxx, reset = 1
Time =    15, x = 1, y = 0, entrada = 00011011, reset = 0
Time =    55, x = 0, y = 0, entrada = 00011011, reset = 0
Time =    75, x = 1, y = 0, entrada = 00011011, reset = 0
Time =    90, x = 1, y = 1, entrada = 00011011, reset = 0 //Saida 1 em y confirmando a sequencia
Time =   110, x = 1, y = 0, entrada = 00011011, reset = 0
Time =   115, x = 1, y = 0, entrada = 00011011, reset = 1
Time =   130, x = 1, y = 0, entrada = 00001110, reset = 0
Time =   190, x = 0, y = 0, entrada = 00001110, reset = 0
Time =   210, x = 0, y = 0, entrada = 00001110, reset = 1
Time =   225, x = 1, y = 0, entrada = 00000101, reset = 0
Time =   245, x = 0, y = 0, entrada = 00000101, reset = 0
Time =   265, x = 1, y = 0, entrada = 00000101, reset = 0
Time =   285, x = 1, y = 0, entrada = 00000101, reset = 1
Time =   300, x = 1, y = 0, entrada = 11011011, reset = 0
Time =   340, x = 0, y = 0, entrada = 11011011, reset = 0
Time =   360, x = 1, y = 0, entrada = 11011011, reset = 0
Time =   370, x = 1, y = 1, entrada = 11011011, reset = 0 //Saida 1 em y confirmando a sequencia
Time =   390, x = 1, y = 0, entrada = 11011011, reset = 0
Time =   400, x = 0, y = 0, entrada = 11011011, reset = 0
Time =   420, x = 1, y = 0, entrada = 11011011, reset = 0
Time =   430, x = 1, y = 1, entrada = 11011011, reset = 0 //Saida 1 em y confirmando a sequencia
Time =   450, x = 1, y = 0, entrada = 11011011, reset = 0
*/

/*
    -Notas:

Para compilar: iverilog -o moore_1101_Test.vvp moore_1101_Test.v
Para executar: vvp moore_1101_Test.vvp
*/
