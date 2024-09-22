/*
    -identificação: 

Guia_0804 - 19 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// -------------------------
// meio Comparador de Desigualdade 
// -------------------------
module ComparadorDesigualdadeComun ( output Result, input a, input b );

    xor XOR1 (Result, a, b);  // Result-out
endmodule // meio comparador 


// -------------------------
// ComparadorComparadorDesigualdadeCompleto_5bits
// -------------------------
module ComparadorDesigualdadeCompleto_5bits (output Result_out, input [4:0] a, input [4:0] b);

    wire [4:0] Result;
    
    ComparadorDesigualdadeComun FS0 (Result[0], a[0], b[0]); // Primeiro bit
    ComparadorDesigualdadeComun FS1 (Result[1], a[1], b[1]); // Segundo bit
    ComparadorDesigualdadeComun FS2 (Result[2], a[2], b[2]); // Terceiro bit
    ComparadorDesigualdadeComun FS3 (Result[3], a[3], b[3]); // Quarto bit
    ComparadorDesigualdadeComun FS4 (Result[4], a[4], b[4]); // Quinto bit
    
    // OR dos Results intermediários
    or OR1 (Result_out, Result[0], Result[1], Result[2], Result[3], Result[4]);
endmodule // ComparadorComparadorDesigualdadeCompleto_5bits



// -------------------------
// modulo de teste para o Comparado de rDesigualdade 5 bits
// -------------------------
module test_ComparadorDesigualdadeCompleto_5bits;
    // ------------------------- definir dados

    reg [4:0] x;            
    reg [4:0] y;
    wire Result_out;         // Resultado final do comparador
    
    // Instanciando o comparador completo
    ComparadorDesigualdadeCompleto_5bits FS0 (Result_out, x, y);

    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0804 - Davi Cândido de Almeida - 857859");
        $display("Test ComparadorDesigualdadeCompleto_5bits");
        
        // Inicializar os valores de x e y
        x = 5'b01010; // Exemplo de valor binário (10 em decimal)
        y = 5'b00101; // Exemplo de valor binário (5 em decimal)
        
        // Exibir os resultados da subtração e do Result_out
        #1 $monitor("x = %b, y = %b, Result = %b", x, y, Result_out);

        // Testes adicionais
        #1 x = 5'b00000; y = 5'b00000;
        #1 x = 5'b00001; y = 5'b00000;
        #1 x = 5'b00001; y = 5'b00001;
        #1 x = 5'b00010; y = 5'b00001;
        #1 x = 5'b00011; y = 5'b00011;
        #1 x = 5'b00100; y = 5'b00100;
        #1 x = 5'b00101; y = 5'b00010;
        #1 x = 5'b01000; y = 5'b00100;

        // Teste de subtrações para negativos
        #1 x = 5'b00000; y = 5'b00001;
        #1 x = 5'b01100; y = 5'b01100;
    end
endmodule // test_fullSubtractor


/*
    -Saídas de resultados:

Guia_0804 - Davi Cândido de Almeida - 857859
Test ComparadorDesigualdadeCompleto_5bits
x = 01010, y = 00101, Result = 1
x = 00000, y = 00000, Result = 0
x = 00001, y = 00000, Result = 1
x = 00001, y = 00001, Result = 0
x = 00010, y = 00001, Result = 1
x = 00011, y = 00011, Result = 0
x = 00100, y = 00100, Result = 0
x = 00101, y = 00010, Result = 1
x = 01000, y = 00100, Result = 1
x = 00000, y = 00001, Result = 1
x = 01100, y = 01100, Result = 0
    [Done] exit with code=0 in 0.058 seconds

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0804.vvp Guia_0804.v
Para executar: vvp Guia_0804.vvp
