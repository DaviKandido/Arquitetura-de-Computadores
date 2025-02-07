/*
    identificação: 

    PA_0103 - 26 / 09 / 2024
    Nome: Davi Cândido de Almeida
    Matricula: 857859
    Código de Pessoa: 1527368
*/

// Módulo MUX de 2 entradas e 1 seletor
module MUX (output s, input d0, input d1, input sel);

    // Multiplexador simples: se o seletor (sel) for 1, seleciona d1; caso contrário, seleciona d0
    assign s = sel ? d1 : d0;
endmodule // MUX

module f_MUX (output s, input a, input b, input c);

    wire s_01, s_02, not_01, not_02, not_c;

    MUX MUX_01 (s_01, b, a, c);

    not not01 (not_a, a);
    not not02 (not_b, b);
    not not_03 (not_c, c);

    MUX MUX_02 (s_02, not_a, not_b, c);


    MUX MUX_03 (s, s_01, s_02, not_c);

endmodule // f_MUX - Implementa f(x, y)

// Módulo de teste PA_0103
module PA_0103;
    // Define os registradores

    reg a; 
    reg b; 
    reg c; // chave 
    wire s; // saída 

    f_MUX f01a(s, a, b, c);

    initial begin : main
        $display("PA_0103 - Tests");
        $display("   a    b    c    s");
        $monitor("%4b %4b %4b %4b", a, b, c, s);

        // Testes com diferentes valores de entrada
           a = 1'b0; b = 1'b0; c = 1'b0;
        #1 a = 1'b0; b = 1'b1; c = 1'b0;
        #1 a = 1'b1; b = 1'b0; c = 1'b0;
        #1 a = 1'b1; b = 1'b1; c = 1'b0;

        #1 a = 1'b0; b = 1'b0; c = 1'b1;
        #1 a = 1'b0; b = 1'b1; c = 1'b1;
        #1 a = 1'b1; b = 1'b0; c = 1'b1;
        #1 a = 1'b1; b = 1'b1; c = 1'b1;

    end // main

endmodule // PA_0103

/*
    -Saídas de resultados esperados:

    PA_0103 - Tests
    a    b    c    s
    0    0    0    1
    0    1    0    1
    1    0    0    0
    1    1    0    0
    0    0    1    0
    0    1    1    0
    1    0    1    1
    1    1    1    1
*/

/*
    -Notas:

    Para compilar: iverilog -o PA_0103.vvp PA_0103.v
    Para executar: vvp PA_0103.vvp
*/

