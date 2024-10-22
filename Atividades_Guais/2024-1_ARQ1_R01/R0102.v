/*
    identificação: 

    R0102 - 15 / 10 / 2024
    Nome: Davi Cândido de Almeida
    Matricula: 857859
    Código de Pessoa: 1527368
*/


//a.) mux (a, not(a), c)
//b.) mux (c, not(c), mux(a,not(a),b))


// Módulo MUX de 2 entradas e 1 seletor
module MUX (output s, input d0, input d1, input sel);

    // Multiplexador simples: se o seletor (sel) for 1, seleciona d1; caso contrário, seleciona d0
    assign s = sel ? d1 : d0;
endmodule // MUX

module f_MUX_a (output s, input a, input b, input c);


    not not01 (not_a, a);

    MUX MUX_01 (s, a, not_a, c);


endmodule // f_MUX_a - mux (a, not(a), c)

module f_MUX_b (output s, input a, input b, input c);


    not not01 (not_a, a);
    not not02 (not_b, b);
    not not_03 (not_c, c);

    MUX MUX_01 (s_01, a, not_a, b);

    MUX MUX_02 (s, c, not_c, s_01);


endmodule // f_MUX_b -  mux (c, not(c), mux(a,not(a),b))


// Módulo de teste R0102
module R0102;
    // Define os registradores

    reg a; 
    reg b; 
    reg c; // chave 
    wire sA; // saída 
    wire sB; // saída 

    f_MUX_a f01a(sA, a, b, c);
    f_MUX_b f01b(sB, a, b, c);

    initial begin : main
        $display("R0102 - Tests");
        $display("   a    b    c    sA   sB");
        $monitor("%4b %4b %4b %4b %4b", a, b, c, sA, sB);

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

endmodule // R0102

/*
    -Saídas de resultados esperados:

    R0102 - Tests
   a    b    c    sA   sB
   0    0    0    0    0
   0    1    0    0    1
   1    0    0    1    1
   1    1    0    1    0
   0    0    1    1    1
   0    1    1    1    0
   1    0    1    0    0
   1    1    1    0    1
*/

/*
    -Notas:

    Para compilar: iverilog -o R0102.vvp R0102.v
    Para executar: vvp R0102.vvp
*/

