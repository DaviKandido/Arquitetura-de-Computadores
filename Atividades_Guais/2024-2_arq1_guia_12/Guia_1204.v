/*
    -identificação: 

Guia_1203 - 26 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368
*/

`include "RAM_4x8.v"

module test_RAM_4x8;

    // Sinais de entrada e saída para o módulo
    reg in1, in2, in3, in4, in5, in6, in7, in8; // Entradas de 8 bits
    reg addr1, addr2, r_w, clk, clear;         // Endereços, Leitura/Escrita, Clock, Limpeza
    wire out1, out2, out3, out4, out5, out6, out7, out8; // Saídas de 8 bits

    // Instância do módulo RAM_4x8
    RAM_4x8 dut (
        out1, out2 ,out3 ,out4
        ,out5 ,out6 ,out7 ,out8
        ,in1 ,in2 ,in3 ,in4
        ,in5 ,in6 ,in7 ,in8
        ,addr1, addr2 ,r_w ,clk
        ,clear
    );

    // Geração do clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock com período de 10 ns
    end

    // Estímulos de teste
    initial begin
        $monitor("Tempo=%0t | addr1=%b | addr2=%b | r_w=%b | in=%b%b%b%b%b%b%b%b | clear=%b | out=%b%b%b%b%b%b%b%b",
                 $time, addr1, addr2, r_w, in1, in2, in3, in4, in5, in6, in7, in8, clear, 
                 out1, out2, out3, out4, out5, out6, out7, out8);

        // Inicialização
        in1 = 0; in2 = 0; in3 = 0; in4 = 0; 
        in5 = 0; in6 = 0; in7 = 0; in8 = 0;
        addr1 = 0;
        addr2 = 0;
        r_w = 0;
        clear = 1; // Clear ativo (limpa a RAM)

        #10 clear = 0; // Desativa o clear após a limpeza

        // Teste de escrita na RAM 1
        addr1 = 0; addr2 = 0; // Selecionar endereço 0
        r_w = 1; // Modo de escrita
        in1 = 1; in2 = 0; in3 = 1; in4 = 0; 
        in5 = 1; in6 = 0; in7 = 1; in8 = 0;
        #10;

        addr1 = 0; addr2 = 0; r_w = 0; // Modo de leitura
        #10;

        // Teste de escrita na RAM 2
        addr1 = 1; addr2 = 1; // Selecionar endereço 1
        r_w = 1; // Modo de escrita
        in1 = 0; in2 = 1; in3 = 0; in4 = 1; 
        in5 = 0; in6 = 1; in7 = 0; in8 = 1;
        #10;

        addr1 = 1; addr2 = 1; r_w = 0; // Modo de leitura
        #10;

        // Teste de limpeza
        clear = 1; // Ativar limpeza
        #10;
        clear = 0; // Desativar limpeza

        addr1 = 0; addr2 = 0; r_w = 0; // Modo de leitura após limpeza
        #10;

        $finish; // Finaliza a simulação
    end

endmodule

/*
    -Saídas de resultados:

[Running] Guia_1204.v
Tempo=0 | addr1=0 | addr2=0 | r_w=0 | in=00000000 | clear=1 | out=00000000
Tempo=10 | addr1=0 | addr2=0 | r_w=1 | in=10101010 | clear=0 | out=00000000
Tempo=20 | addr1=0 | addr2=0 | r_w=0 | in=10101010 | clear=0 | out=10101010
Tempo=25 | addr1=0 | addr2=0 | r_w=0 | in=10101010 | clear=0 | out=00000000
Tempo=30 | addr1=1 | addr2=1 | r_w=1 | in=01010101 | clear=0 | out=00000000
Tempo=40 | addr1=1 | addr2=1 | r_w=0 | in=01010101 | clear=0 | out=01010101
Tempo=45 | addr1=1 | addr2=1 | r_w=0 | in=01010101 | clear=0 | out=00000000
Tempo=50 | addr1=1 | addr2=1 | r_w=0 | in=01010101 | clear=1 | out=00000000
Tempo=60 | addr1=0 | addr2=0 | r_w=0 | in=01010101 | clear=0 | out=00000000
[Done] exit with code=0 in 0.111 seconds

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_1203.vvp Guia_1203.v
Para executar: vvp Guia_1203.vvp
*/