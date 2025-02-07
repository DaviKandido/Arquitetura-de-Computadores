/*
    -identificação: 

Demultiplexador - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module demux1to2 (
    input wire sel,  // Sinal de seleção
    input wire d,    // Entrada
    output wire y0, y1  // Saídas
);

    // Direciona a entrada para a saída selecionada
    assign y0 = (sel == 1'b0) ? d : 1'b0;
    assign y1 = (sel == 1'b1) ? d : 1'b0;

endmodule


 

