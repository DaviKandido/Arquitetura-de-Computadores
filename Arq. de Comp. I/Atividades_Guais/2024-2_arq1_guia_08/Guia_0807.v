/*
    -identificação: 

Guia_0807 - 20 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// -------------------------
// meio comparador 
// -------------------------
module ComparadorComun (output Result, input a, input b, input chave);
    wire Result_xnor, Result_xor;
    
    xnor XNOR1 (Result_xnor, a, b);  // Result-out
    xor XOR1 (Result_xor, a, b);    // Result-out

    wire Result_xnor_2, Result_xor_2;

    and AND1(Result_xnor_2, Result_xnor, ~chave);
    and AND2(Result_xor_2, Result_xor, chave);

    or OR_comp (Result, Result_xnor_2, Result_xor_2);  // Result-out
endmodule // meio comparador 


// -------------------------
// ComparadorCompleto_6bits
// -------------------------
module ComparadorCompleto_6bits (output Result_out, input [5:0] a, input [5:0] b, input chave);

    wire [5:0] Result;
    wire Result_AND, Result_OR, Result_AND_Chave, Result_OR_Chave;
    
    // Comparadores de 1 bit
    ComparadorComun FS0 (Result[0], a[0], b[0], chave); // Primeiro bit
    ComparadorComun FS1 (Result[1], a[1], b[1], chave); // Segundo bit
    ComparadorComun FS2 (Result[2], a[2], b[2], chave); // Terceiro bit
    ComparadorComun FS3 (Result[3], a[3], b[3], chave); // Quarto bit
    ComparadorComun FS4 (Result[4], a[4], b[4], chave); // Quinto bit
    ComparadorComun FS5 (Result[5], a[5], b[5], chave); // Sexto bit
    
    // AND dos Results intermediários
    and AND_comp (Result_AND, Result[0], Result[1], Result[2], Result[3], Result[4], Result[5]);
    or OR_comp (Result_OR, Result[0], Result[1], Result[2], Result[3], Result[4], Result[5]);

    and AND_comp1 (Result_AND_Chave, Result_AND, ~chave); // AND com a chave 0
    and AND_comp2 (Result_OR_Chave, Result_OR, chave);   // OR com a chave 1

    or OR_comp3 (Result_out, Result_AND_Chave, Result_OR_Chave);  // Combinação final com chave
endmodule // ComparadorCompleto_6bits


// -------------------------
// modulo de teste para o Comparador
// -------------------------
module test_Comparador;
    // ------------------------- definir dados

    reg [5:0] x;            // Registradores de 5 bits para armazenar operandos
    reg [5:0] y;
    wire Result_out;         // Resultado final do comparador
    reg chave;
    
    // Instanciando o comparador completo
    ComparadorCompleto_6bits FS0 (Result_out, x, y, chave);

    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0807 - Davi Cândido de Almeida - 857859");
        $display("Test ComparadorCompleto_6bits");
        
        chave = 1'b0;  // Comparação normal
         
        // Inicializar os valores de x e y
        x = 6'b001010; // Exemplo de valor binário (10 em decimal)
        y = 6'b000101; // Exemplo de valor binário (5 em decimal)
        
        // Exibir os resultados da comparação e do Result_out
        #1 $monitor("x = %b, y = %b, Result = %b, Chave = %b", x, y, Result_out, chave);

        $display("\nChave = 0 - Igualdade");
        // Outros exemplos
        chave = 1'b0; // Comparação 0 e 0
        #1 x = 6'b000000; y = 6'b000000; 
        #1 x = 6'b000001; y = 6'b000000; // Comparação 1 e 0
        #1 x = 6'b000001; y = 6'b000001; // Comparação 1 e 1
        #1 x = 6'b000010; y = 6'b000001; // Comparação 2 e 1
        #1 x = 6'b000011; y = 6'b000001; // Comparação 3 e 1
        #1 x = 6'b000100; y = 6'b000010; // Comparação 4 e 2
        #1 x = 6'b000101; y = 6'b000010; // Comparação 5 e 2
        #1 x = 6'b001000; y = 6'b000100; // Comparação 8 e 4

        $display("\nChave = 1 - Desigualdade");

        // Comparações com chave = 1
        chave = 1'b1; // Comparação 0 e 1
        #1 x = 6'b000000; y = 6'b000000; 
        #1 x = 6'b000001; y = 6'b000000; // Comparação 1 e 0
        #1 x = 6'b000001; y = 6'b000001; // Comparação 1 e 1
        #1 x = 6'b000010; y = 6'b000001; // Comparação 2 e 1
        #1 x = 6'b000011; y = 6'b000001; // Comparação 3 e 1
        #1 x = 6'b000100; y = 6'b000010; // Comparação 4 e 2
        #1 x = 6'b000101; y = 6'b000010; // Comparação 5 e 2
        #1 x = 6'b001000; y = 6'b000100; // Comparação 8 e 4
    end
endmodule // test_Comparador




/*
    -Saídas de resultados:

Guia_0807 - Davi Cândido de Almeida - 857859
Test ComparadorCompleto_6bits

Chave = 0 - Igualdade
x = 001010, y = 000101, Result = 0, Chave = 0
x = 000000, y = 000000, Result = 1, Chave = 0
x = 000001, y = 000000, Result = 0, Chave = 0
x = 000001, y = 000001, Result = 1, Chave = 0
x = 000010, y = 000001, Result = 0, Chave = 0
x = 000011, y = 000001, Result = 0, Chave = 0
x = 000100, y = 000010, Result = 0, Chave = 0
x = 000101, y = 000010, Result = 0, Chave = 0

Chave = 1 - Desigualdade
x = 001000, y = 000100, Result = 1, Chave = 1
x = 000000, y = 000000, Result = 0, Chave = 1
x = 000001, y = 000000, Result = 1, Chave = 1
x = 000001, y = 000001, Result = 0, Chave = 1
x = 000010, y = 000001, Result = 1, Chave = 1
x = 000011, y = 000001, Result = 1, Chave = 1
x = 000100, y = 000010, Result = 1, Chave = 1
x = 000101, y = 000010, Result = 1, Chave = 1
x = 001000, y = 000100, Result = 1, Chave = 1

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0807.vvp Guia_0807.v
Para executar: vvp Guia_0807.vvp
