/*
    -identificação: 

Guia_0802 - 19 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



/// -------------------------
// meio subtrator (half subtractor)
// -------------------------
module subtradorComun ( output borrow, output diff, input a, input b );

    xor XOR1 (diff, a, b);  // Diferença parcial
    not NOT1(not_a, a);
    and AND1 (borrow, not_a, b);  // Borrow-out
endmodule // subtradorComun


// -------------------------
// subtrador completo (full subtractor)
// -------------------------
module SubtradorCompleto ( output borrow_out, output diff, input a, input b, input borrow_in );

    wire borrow1, borrow2, res_Xor;
    
    // Dois meios subtratores para implementar o subtrador completo
    subtradorComun HS1 (borrow1, res_Xor, a, b);         // Primeiro meio subtrator
    subtradorComun HS2 (borrow2, diff, res_Xor, borrow_in); // Segundo meio subtrator
    
    // O borrow-out é a OR dos dois borrows intermediários
    or OR1 (borrow_out, borrow1, borrow2);
endmodule // SubtradorCompleto



// -------------------------
// modulo de teste para o full subtractor
// -------------------------
module test_SubtradorCompleto;
    // ------------------------- definir dados

    reg [4:0] x;           // Registradores de 4 bits para armazenar operandos
    reg [4:0] y;
    wire [4:0] borrow;     // "Borrow" de 4 bits
    wire [5:0] subtracao;  // Subtração de 5 bits para acomodar borrow-out final
    
    // Instanciando os subtratores completos
    SubtradorCompleto FS0 (borrow[0], subtracao[0], x[0], y[0], 1'b0); // Primeiro bit
    SubtradorCompleto FS1 (borrow[1], subtracao[1], x[1], y[1], borrow[0]); // Segundo bit
    SubtradorCompleto FS2 (borrow[2], subtracao[2], x[2], y[2], borrow[1]); // Terceiro bit
    SubtradorCompleto FS3 (borrow[3], subtracao[3], x[3], y[3], borrow[2]); // Quarto bit
    SubtradorCompleto FS4 (borrow[4], subtracao[4], x[4], y[4], borrow[3]); // Quinto bit
    
    // Borrow-out final para o quinto bit
    assign subtracao[5] = borrow[4];
    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0802 - Davi Cândido de Almeida - 857859");
        $display("Test Subtração Completa");
        
        // Inicializar os valores de x e y
        x = 5'b01010; // Exemplo de valor binário (10 em decimal)
        y = 5'b00101; // Exemplo de valor binário (5 em decimal)
        
        // Exibir os resultados da subtração e do borrow
        #1 $monitor("x = %b, y = %b, subtracao = %b, borrow = %b", x, y, subtracao, borrow);

        // Testes adicionais
        #1 x = 5'b00000; y = 5'b00000;
        #1 x = 5'b00001; y = 5'b00000;
        #1 x = 5'b00001; y = 5'b00001;
        #1 x = 5'b00010; y = 5'b00001;
        #1 x = 5'b00011; y = 5'b00001;
        #1 x = 5'b00100; y = 5'b00010;
        #1 x = 5'b00101; y = 5'b00010;
        #1 x = 5'b01000; y = 5'b00100;

        //teste de subtrações para negativos
        #1 x = 5'b00000; y = 5'b00001;
        #1 x = 5'b00010; y = 5'b01100;
    end
endmodule // test_SubtradorCompleto


/*
    -Saídas de resultados:

Guia_0802 - Davi Cândido de Almeida - 857859
Test Subtração Completa
x = 01010, y = 00101, subtracao = 000101, borrow = 00101
x = 00000, y = 00000, subtracao = 000000, borrow = 00000
x = 00001, y = 00000, subtracao = 000001, borrow = 00000
x = 00001, y = 00001, subtracao = 000000, borrow = 00000
x = 00010, y = 00001, subtracao = 000001, borrow = 00001
x = 00011, y = 00001, subtracao = 000010, borrow = 00000
x = 00100, y = 00010, subtracao = 000010, borrow = 00010
x = 00101, y = 00010, subtracao = 000011, borrow = 00010
x = 01000, y = 00100, subtracao = 000100, borrow = 00100
x = 00000, y = 00001, subtracao = 111111, borrow = 11111
x = 00010, y = 01100, subtracao = 110110, borrow = 11100

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0802.vvp Guia_0802.v
Para executar: vvp Guia_0802.vvp
*/

