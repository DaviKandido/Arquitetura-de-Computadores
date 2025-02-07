/*
    -identificação: 

Multplexador - 31 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

module mux2to1 (
    input wire sel,    // Sinal de seleção
    input wire d0, d1, // Entradas
    output wire y      // Saída
);

    // Seleciona a entrada com base no valor do seletor
    assign y = (sel == 1'b0) ? d0 : d1;

endmodule

 

