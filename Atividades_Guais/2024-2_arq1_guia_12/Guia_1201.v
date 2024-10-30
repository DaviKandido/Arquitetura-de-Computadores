/*
    -identificação: 

Guia_1201 - 24 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/
`include "RAM_1x4.v"

module test_RAM_1x4;

// Sinais de entrada e saída para o módulo
reg in1, in2, in3, in4;
reg addr, r_w, clk, clear;
wire out1, out2, out3, out4;

// Instancia o módulo RAM_1x4
RAM_1x4 dut (out1, out2, out3, out4, in1, in2, in3, in4, addr, r_w, clk, clear);

// Geração do clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Estímulos de teste
initial begin
    $monitor("Tempo=%0t | addr=%b | r_w=%b | in=%b%b%b%b | clear=%b | out=%b%b%b%b",
             $time, addr, r_w, in1, in2, in3, in4, clear, out1, out2, out3, out4);

    // Inicialização
    in1 = 0; in2 = 0; in3 = 0; in4 = 0;
    addr = 0;
    r_w = 0;
    clear = 1; // Clear ativo (limpa o flip-flop)

    #10 clear = 0; // Desativa o clear após a limpeza

    // Teste de escrita
    addr = 1; r_w = 1; in1 = 1; in2 = 0; in3 = 1; in4 = 0;
    #10;

    // Teste de leitura
    addr = 1; r_w = 0;
    #10;

    // Alteração de valores e teste de leitura
    in1 = 0; in2 = 1; in3 = 0; in4 = 1; 
    #10;
    addr = 1; r_w = 1; // Escrita com novos valores
    #10;

    addr = 1; r_w = 0; // Leitura para verificar se valores foram escritos corretamente
    #10;

    // Teste de clear
    clear = 1;
    #10;
    clear = 0;

    // Verificação final
    addr = 1; r_w = 0;
    #10;

    $finish;
end

endmodule


/*
    -Saídas de resultados:

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1201.vvp Guia_1201.v
Para executar: vvp Guia_1201.vvp
*/

