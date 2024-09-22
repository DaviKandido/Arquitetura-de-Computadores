/*
    -identificação: 

Guia_0802 - 19 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// -------------------------
// meio subtrator (half subtractor)
// -------------------------
module Complemento_de_1 (output S0, output S1, input a, input vai_um);

    not NOT1(not_a, a);
    xor XOR1 (S0, not_a, vai_um);  // Diferença parcial
    and AND1 (S1, not_a, vai_um);  // Vai-um

endmodule // Complemento_de_1


// -------------------------
// subtrator completo (full subtractor)
// -------------------------
module Complemento_de_2_completo (output S0, output S1, input a, input vem_um);

    // Dois meios subtratores para implementar o subtrator completo
    Complemento_de_1 HS1 (S0, S1, a, vem_um);  // Primeira operação de subtração

endmodule // Complemento_de_2_completo


// -------------------------
// modulo de teste para o subtrator completo
// -------------------------
module test_Complemento_de_2_completo;
    // ------------------------- definir dados

    reg [5:0] x;           // Registradores de 5 bits para armazenar operandos
    wire [5:0] vai_um;     // "Borrow" de 5 bits
    wire [5:0] Complemento_de_2;  // Subtração de 5 bits
    
    // Instanciando os subtratores completos
    Complemento_de_2_completo FS0 (Complemento_de_2[0], vai_um[0], x[0], 1'b1); // Primeiro bit = 1 (complemento de 2)
    Complemento_de_2_completo FS1 (Complemento_de_2[1], vai_um[1], x[1], vai_um[0]); // Segundo bit
    Complemento_de_2_completo FS2 (Complemento_de_2[2], vai_um[2], x[2], vai_um[1]); // Terceiro bit
    Complemento_de_2_completo FS3 (Complemento_de_2[3], vai_um[3], x[3], vai_um[2]); // Quarto bit
    Complemento_de_2_completo FS4 (Complemento_de_2[4], vai_um[4], x[4], vai_um[3]); // Quinto bit
    Complemento_de_2_completo FS5 (Complemento_de_2[5], vai_um[5], x[5], vai_um[4]); // sexto bit

    // ------------------------- parte principal
    initial begin
        $display("Guia_0802 - Davi Cândido de Almeida - 857859");
        $display("Test Complemento_de_2_completo");
        
        // Inicializar os valores de x
        x = 6'b001010; // Exemplo de valor binário (10 em decimal)
        
        // Exibir os resultados da subtração e do borrow
        #1 $monitor("x = %b Complemento_de_2 = %b", x, Complemento_de_2);

        // Testes adicionais
        #1 x = 6'b000000;
        #1 x = 6'b000001;
        #1 x = 6'b000010;
        #1 x = 6'b000011;
        #1 x = 6'b000100;
        #1 x = 6'b000101;
        #1 x = 6'b001000;

        // Teste de subtrações para negativos
        #1 x = 6'b000000;
        #1 x = 6'b000010;
    end
endmodule // test_Complemento_de_2_completo

/*
    -Saídas de resultados:

    Guia_0802 - Davi Cândido de Almeida - 857859
    Test Complemento_de_2_completo
    x = 001010 Complemento_de_2 = 110110
    x = 000000 Complemento_de_2 = 000000
    x = 000001 Complemento_de_2 = 111111
    x = 000010 Complemento_de_2 = 111110
    x = 000011 Complemento_de_2 = 111101
    x = 000100 Complemento_de_2 = 111100
    x = 000101 Complemento_de_2 = 111011
    x = 001000 Complemento_de_2 = 111000
    x = 000000 Complemento_de_2 = 000000
    x = 000010 Complemento_de_2 = 111110


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0802.vvp Guia_0802.v
Para executar: vvp Guia_0802.vvp
