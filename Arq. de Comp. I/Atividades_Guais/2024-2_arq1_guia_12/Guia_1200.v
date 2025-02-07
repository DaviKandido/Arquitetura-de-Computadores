/*
    -identificação: 

Guia_1200 - 24 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

`include "RAM_1x1.v"

module test_RAM_1x1;

// Sinais de entrada e saída para o módulo
reg in1, addr, r_w, clk, clear;
wire out1;

// Instancia o módulo RAM_1x1
RAM_1x1 dut (out1, in1, addr, r_w, clk, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | addr=%b | r_w=%b | in1=%b | clear=%b | out1=%b", $time, addr, r_w, in1, clear, out1);

    // Inicialização
    in1 = 0;
    addr = 0;
    r_w = 0;
    clear = 1; // Clear ativo (limpa o flip-flop)

    #10 clear = 0; 


    addr = 1; r_w = 1; in1 = 1; 
    #10;
    addr = 1; r_w = 0; 
    #10;

    in1 = 0; 
    #10;


    clear = 1; 
    #10;
    clear = 0; 

    addr = 1; r_w = 0; 
    #10;

    $finish;
end

endmodule


/*
    -Saídas de resultados:

[Running] Guia_1200.v
Tempo=0 | addr=0 | r_w=0 | in1=0 | clear=1 | out1=0
Tempo=10 | addr=1 | r_w=1 | in1=1 | clear=0 | out1=0
Tempo=15 | addr=1 | r_w=1 | in1=1 | clear=0 | out1=1
Tempo=20 | addr=1 | r_w=0 | in1=1 | clear=0 | out1=1
Tempo=30 | addr=1 | r_w=0 | in1=0 | clear=0 | out1=1
Tempo=40 | addr=1 | r_w=0 | in1=0 | clear=1 | out1=0
Tempo=50 | addr=1 | r_w=0 | in1=0 | clear=0 | out1=0
[Done] exit with code=0 in 0.09 secon

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1200.vvp Guia_1200.v
Para executar: vvp Guia_1200.vvp
*/

