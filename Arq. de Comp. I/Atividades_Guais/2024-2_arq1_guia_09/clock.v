/*
    -identificação: 

Clock.v - 27 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock ( output clk );

    reg clk;

    initial
        begin
         clk = 1'b0;
        end

    always
        begin
         #12 clk = ~clk;
        end
endmodule // clock ( )



/*
    -Notas:

Para compilar: iverilog -o Clock.v.vvp Clock.v.v
Para executar: vvp Clock.v.vvp
*/

