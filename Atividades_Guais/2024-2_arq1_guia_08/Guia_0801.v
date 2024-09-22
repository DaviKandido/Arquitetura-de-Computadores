/*
    -identificação: 

Guia_0801 - 19 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/



// -------------------------
// meio somador (half adder)
// -------------------------
module SomaComum ( output s1, output s0, input a, input b );

    xor XOR1 (s0, a, b);  // Soma parcial
    and AND1 (s1, a, b);  // Carry-out (vai-um)
endmodule // SomaComum

// -------------------------
// somador completo (full adder)
// -------------------------
module SomadorCompleto ( output s1, output s0, input a, input b, input carryIn );

    wire res_Xor, carry1, carry2;
    
    // Dois meios somadores para implementar o somador completo
    SomaComum HA1 (carry1, res_Xor, a, b);     // Primeiro meio somador
    SomaComum HA2 (carry2, s0, res_Xor, carryIn);  // Segundo meio somador
    
    // O carry-out é a OR dos dois carries intermediários
    or OR1 (s1, carry1, carry2);
endmodule // SomadorCompleto

// -------------------------
// modulo de teste para o full adder
// -------------------------
module test_SomadorCompleto;
    // ------------------------- definir dados

    reg [4:0] x;           // Registradores de 4 bits para armazenar operandos
    reg [4:0] y;
    wire [4:0] carry;       // "Carry" de 4 bits (vai-um)
    wire [5:0] soma;        // Soma de 5 bits para acomodar carry-out final
    
    // Instanciando os somadores completos
    SomadorCompleto FA0 (carry[0], soma[0], x[0], y[0], 1'b0); // Primeiro bit
    SomadorCompleto FA1 (carry[1], soma[1], x[1], y[1], carry[0]); // Segundo bit
    SomadorCompleto FA2 (carry[2], soma[2], x[2], y[2], carry[1]); // Terceiro bit
    SomadorCompleto FA3 (carry[3], soma[3], x[3], y[3], carry[2]); // Quarto bit
    SomadorCompleto FA4 (carry[4], soma[4], x[4], y[4], carry[3]); // quinto bit
    
    // Carry-out final para o quinto bit
    assign soma[5] = carry[4];
    
    // ------------------------- parte principal
    initial begin
        $display("Guia_0801 - Davi Cândido de Almeida - 857859");
        $display("Test Somador Completo");
        
        // Inicializar os valores de x e y
        x = 5'b01010; // Exemplo de valor binário (10 em decimal)
        y = 5'b00101; // Exemplo de valor binário (5 em decimal)
        
        // Exibir os resultados da soma e do carry
        #1 $monitor("x = %b, y = %b, soma = %b, carry = %b", x, y, soma, carry);

        #1 x = 5'b00000; /* (0 em decimal)*/  y = 5'b00000; //  (0 em decimal)
        #1 x = 5'b00001; /* (1 em decimal)*/  y = 5'b00000; //  (0 em decimal)
        #1 x = 5'b00001; /* (1 em decimal)*/  y = 5'b00001; //  (1 em decimal)
        #1 x = 5'b00010; /* (2 em decimal)*/  y = 5'b00001; //  (1 em decimal)
        #1 x = 5'b00011; /* (3 em decimal)*/  y = 5'b00001; //  (1 em decimal)
        #1 x = 5'b00100; /* (4 em decimal)*/  y = 5'b00010; //  (2 em decimal)
        #1 x = 5'b00101; /* (5 em decimal)*/  y = 5'b00010; //  (2 em decimal)
        #1 x = 5'b01000; /* (8 em decimal)*/  y = 5'b00100; //  (4 em decimal)
     

    end
endmodule // test_SomadorCompleto


/*
    -Saídas de resultados:

Test Somador Completo
x = 01010, y = 00101, soma = 001111, carry = 00000
x = 00000, y = 00000, soma = 000000, carry = 00000
x = 00001, y = 00000, soma = 000001, carry = 00000
x = 00001, y = 00001, soma = 000010, carry = 00001
x = 00010, y = 00001, soma = 000011, carry = 00000
x = 00011, y = 00001, soma = 000100, carry = 00011
x = 00100, y = 00010, soma = 000110, carry = 00000
x = 00101, y = 00010, soma = 000111, carry = 00000
x = 01000, y = 00100, soma = 001100, carry = 00000

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0801.vvp Guia_0801.v
Para executar: vvp Guia_0801.vvp
*/

