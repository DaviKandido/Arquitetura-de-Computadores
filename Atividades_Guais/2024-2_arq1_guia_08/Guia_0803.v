/*
    -identificação: 

Guia_0803 - 19 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// -------------------------
// meio comparador 
// -------------------------
module ComparadorComun ( output Result, input a, input b );

    xnor XNOR1 (Result, a, b);  // Result-out
endmodule // meio comparador 


// -------------------------
// ComparadorCompleto_5bits
// -------------------------
module ComparadorCompleto_5bits (output Result_out, input [4:0] a, input [4:0] b);

    wire [4:0] Result;
    
    ComparadorComun FS0 (Result[0], a[0], b[0]); // Primeiro bit
    ComparadorComun FS1 (Result[1], a[1], b[1]); // Segundo bit
    ComparadorComun FS2 (Result[2], a[2], b[2]); // Terceiro bit
    ComparadorComun FS3 (Result[3], a[3], b[3]); // Quarto bit
    ComparadorComun FS4 (Result[4], a[4], b[4]); // Quinto bit
    
    // AND dos Results intermediários
    and AND1 (Result_out, Result[0], Result[1], Result[2], Result[3], Result[4]);
endmodule // ComparadorCompleto_5bits



// -------------------------
// modulo de teste para o full subtractor
// -------------------------
module test_fullSubtractor;
    // ------------------------- definir dados

    reg [4:0] x;            // Registradores de 5 bits para armazenar operandos
    reg [4:0] y;
    wire Result_out;         // Resultado final do comparador
    
    // Instanciando o comparador completo
    ComparadorCompleto_5bits FS0 (Result_out, x, y);

    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0803 - Davi Cândido de Almeida - 857859");
        $display("Test ComparadorCompleto_5bits");
        
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

    Guia_0803 - Davi Cândido de Almeida - 857859
    Test ComparadorCompleto_5bits
    x = 01010, y = 00101, Result = 0
    x = 00000, y = 00000, Result = 1
    x = 00001, y = 00000, Result = 0
    x = 00001, y = 00001, Result = 1
    x = 00010, y = 00001, Result = 0
    x = 00011, y = 00011, Result = 1
    x = 00100, y = 00100, Result = 1
    x = 00101, y = 00010, Result = 0
    x = 01000, y = 00100, Result = 0
    x = 00000, y = 00001, Result = 0
    x = 01100, y = 01100, Result = 1

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0803.vvp Guia_0803.v
Para executar: vvp Guia_0803.vvp
