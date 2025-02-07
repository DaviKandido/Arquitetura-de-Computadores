/*
    -identificação: 
    Guia_0806 - 20 / 09 / 2024
    Nome: Davi Cândido de Almeida
    Matricula: 857859
    Código de Pessoa: 1527368
*/


module ComparadorComun ( output Result, input a, input b );

    xnor XNOR1 (Result, a, b);  // Result-out
endmodule // meio comparador 



module ComparadorCompleto_6bits (output igualdade, output desigualdade, input [5:0] a, input [5:0] b);

    wire [5:0] Result;
    
    ComparadorComun FS0 (Result[0], a[0], b[0]); // Primeiro bit
    ComparadorComun FS1 (Result[1], a[1], b[1]); // Segundo bit
    ComparadorComun FS2 (Result[2], a[2], b[2]); // Terceiro bit
    ComparadorComun FS3 (Result[3], a[3], b[3]); // Quarto bit
    ComparadorComun FS4 (Result[4], a[4], b[4]); // Quinto bit
    ComparadorComun FS5 (Result[5], a[5], b[5]); // sexto bit
    
    // AND dos Results intermediários
    and AND1 (igualdade, Result[0], Result[1], Result[2], Result[3], Result[4], Result[5]);

    not NOT2(desigualdade, igualdade);
endmodule // ComparadorCompleto_5bits


module SomaOuSubComum (output s1, output s0, input a, input b, input chave);
    wire and1, and2;

    xor XOR1(s0, a, b);  // Soma parcial
    and AND1(and1, ~a, b, chave);  // Para subtração
    and AND2(and2, a, b, ~chave);  // Para soma

    or OR1(s1, and1, and2);  // Carry-out (vai-um)
endmodule // SomaOuSubComum

// -------------------------
// somador completo (full adder)
// -------------------------
module SomadorOuSubtradorCompleto (output s1, output s0,  input a, input b, input carryIn, input chave);
    wire res_Xor, carry1, carry2;
    
    // Primeira metade do somador/subtrator
    SomaOuSubComum HA1(carry1, res_Xor, a, b, chave);  
    // Segunda metade do somador/subtrator
    SomaOuSubComum HA2(carry2, s0, res_Xor, carryIn, chave);  
    
    // O carry-out é a OR dos dois carries intermediários
    or OR1(s1, carry1, carry2);
endmodule // SomadorOuSubtradorCompleto

// -------------------------
// modulo de teste para o somador/subtrator completo
// -------------------------
module test_SomadorCompleto;
    // ------------------------- definir dados
    reg [5:0] x;             // Registradores de 6 bits para armazenar operandos
    reg [5:0] y;
    wire [5:0] carry;         // "Carry" de 6 bits (vai-um)
    wire [6:0] somaOuSub;     // Soma de 7 bits para acomodar carry-out final
    reg chave;                // Registre a chave para soma ou subtração
    wire igualdade; 
    wire desigualdade; 

    // Instanciar os somadores completos
    SomadorOuSubtradorCompleto FA0(carry[0], somaOuSub[0], x[0], y[0], 1'b0, chave);  // Bit 0
    SomadorOuSubtradorCompleto FA1(carry[1], somaOuSub[1], x[1], y[1], carry[0], chave);  // Bit 1
    SomadorOuSubtradorCompleto FA2(carry[2], somaOuSub[2], x[2], y[2], carry[1], chave);  // Bit 2
    SomadorOuSubtradorCompleto FA3(carry[3], somaOuSub[3], x[3], y[3], carry[2], chave);  // Bit 3
    SomadorOuSubtradorCompleto FA4(carry[4], somaOuSub[4], x[4], y[4], carry[3], chave);  // Bit 4
    SomadorOuSubtradorCompleto FA5(carry[5], somaOuSub[5], x[5], y[5], carry[4], chave);  // Bit 5


    ComparadorCompleto_6bits FS0 (igualdade, desigualdade, x, y);

    
    // Atribuir o carry final
    assign somaOuSub[6] = carry[5];
    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0806 - Davi Cândido de Almeida - 857859");
        $display("Test Somador ou Subtrador Completo");

        chave = 1'b0;  // Operação de soma

        // Testes de soma
        x = 6'b001010; // 10 em decimal
        y = 6'b000101; // 5 em decimal
        #1 $monitor("x = %b, y = %b, somaOuSub = %b, chave = %b Igualdade = %b, Desigualdade = %b", x, y, somaOuSub, chave, igualdade, desigualdade);


    $display("\nChave = 0");
        // Outros exemplos
        #1 x = 6'b000000; y = 6'b000000; chave = 1'b0;// 0 + 0
        #1 x = 6'b000001; y = 6'b000000; // 1 + 0
        #1 x = 6'b000001; y = 6'b000001; // 1 + 1
        #1 x = 6'b000010; y = 6'b000001; // 2 + 1
        #1 x = 6'b000011; y = 6'b000001; // 3 + 1
        #1 x = 6'b000100; y = 6'b000010; // 4 + 2
        #1 x = 6'b000101; y = 6'b000010; // 5 + 2
        #1 x = 6'b001000; y = 6'b000100; // 8 + 4

        $display("\nChave = 1");

                // Outros exemplos
        #1 x = 6'b000000; y = 6'b000001; chave = 1'b1; // 0 + 1
        #1 x = 6'b000001; y = 6'b011000; // 1 - 24
        #1 x = 6'b000001; y = 6'b000001; // 1 + 1
        #1 x = 6'b000010; y = 6'b000001; // 2 + 1
        #1 x = 6'b000011; y = 6'b000001; // 3 + 1
        #1 x = 6'b000100; y = 6'b000010; // 4 + 2
        #1 x = 6'b000101; y = 6'b000010; // 5 + 2
        #1 x = 6'b001000; y = 6'b000100; // 8 + 4
    end
endmodule // test_SomadorCompleto





/*
    -Saídas de resultados:

    Guia_0806 - Davi Cândido de Almeida - 857859
    Test Somador ou Subtrador Completo

    Chave = 0
    x = 001010, y = 000101, somaOuSub = 0001111, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000000, y = 000000, somaOuSub = 0000000, chave = 0 Igualdade = 1, Desigualdade = 0
    x = 000001, y = 000000, somaOuSub = 0000001, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000001, y = 000001, somaOuSub = 0000010, chave = 0 Igualdade = 1, Desigualdade = 0
    x = 000010, y = 000001, somaOuSub = 0000011, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000011, y = 000001, somaOuSub = 0000100, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000100, y = 000010, somaOuSub = 0000110, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000101, y = 000010, somaOuSub = 0000111, chave = 0 Igualdade = 0, Desigualdade = 1

    Chave = 1
    x = 001000, y = 000100, somaOuSub = 0001100, chave = 0 Igualdade = 0, Desigualdade = 1
    x = 000000, y = 000001, somaOuSub = 1111111, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 000001, y = 011000, somaOuSub = 1101001, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 000001, y = 000001, somaOuSub = 0000000, chave = 1 Igualdade = 1, Desigualdade = 0
    x = 000010, y = 000001, somaOuSub = 0000001, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 000011, y = 000001, somaOuSub = 0000010, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 000100, y = 000010, somaOuSub = 0000010, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 000101, y = 000010, somaOuSub = 0000011, chave = 1 Igualdade = 0, Desigualdade = 1
    x = 001000, y = 000100, somaOuSub = 0000100, chave = 1 Igualdade = 0, Desigualdade = 1


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0806.vvp Guia_0806.v
Para executar: vvp Guia_0806.vvp
