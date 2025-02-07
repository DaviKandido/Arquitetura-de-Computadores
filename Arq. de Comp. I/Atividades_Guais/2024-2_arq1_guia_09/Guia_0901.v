/*
    -identificação: 

Guia_0901 - 27 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

/*

01.) Projetar e descrever em Verilog módulos
geradores de pulso (pulse) e gatilho (trigger).
O nome do arquivo deverá ser Guia_0901.v,
e poderá seguir o modelo descrito abaixo.
Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.

*/

// ---------------------------
// -- test clock generator (2)
// ---------------------------
module clock ( output clk );
    reg clk;
    initial
    begin
        clk = 1'b0;
    end
    always
    begin
    #12 clk = ~clk;
    end
endmodule

module pulse ( signal, clock );
    input clock;
    output signal;
    reg signal;
    always @ ( clock )
    begin
    signal = 1'b1;
    #3 signal = 1'b0;
    #3 signal = 1'b1;
    #3 signal = 1'b0;
    end
endmodule // pulse

// ---------------------------
module trigger ( signal, on, clock );
    input on, clock;
    output signal;
    reg signal;
    always @ ( posedge clock & on )
    begin
    #60 signal = 1'b1;
    #60 signal = 1'b0;
    end
endmodule // trigger

module Guia_0901;

    wire clock;
    clock clk ( clock );
    reg p;
    wire p1,t1;
    pulse pulse1 ( p1, clock );
    trigger trigger1 ( t1, p, clock );
    initial begin
    p = 1'b0;
    end
    initial begin
    $dumpfile ( "Guia_0901.vcd" );
    $dumpvars ( 1, clock, p1, p, t1 );
    #060 p = 1'b1;
    #120 p = 1'b0;
    #180 p = 1'b1;
    #240 p = 1'b0;
    #300 p = 1'b1;
    #360 p = 1'b0;
    #376 $finish;
end
endmodule // Guia_0901
/*
    -Saídas de resultados:

    #0
    $dumpvars
    x$
    0#
    1"
    0!
    $end
    #3
    0"
    #6
    1"
    #9
    0"
    #12
    1"
    1!
    #15
    0"
    #18
    1"
    #21
    0"
    #24
    1"
    0!
    #27
    0"
    #30
    1"
    #33
    0"
    #36
    1"
    1!
    #39
    0"
    #42
    1"
    #45
    0"
    #48
    1"
    0!
    #51
    0"
    #54
    1"
    #57
    0"
    #60
    1"
    1!
    1#
    #63
    0"
    #66
    1"
    #69
    0"
    #72
    1"
    0!
    #75
    0"
    #78
    1"
    #81
    0"
    #84
    1"
    1!
    #87
    0"
    #90
    1"
    #93
    0"
    #96
    1"
    0!
    #99
    0"
    #102
    1"
    #105
    0"
    #108
    1"
    1!
    #111
    0"
    #114
    1"
    #117
    0"
    #120
    1"
    0!
    1$
    #123
    0"
    #126
    1"
    #129
    0"
    #132
    1"
    1!
    #135
    0"
    #138
    1"
    #141
    0"
    #144
    1"
    0!
    #147
    0"
    #150
    1"
    #153
    0"
    #156
    1"
    1!
    #159
    0"
    #162
    1"
    #165
    0"
    #168
    1"
    0!
    #171
    0"
    #174
    1"
    #177
    0"
    #180
    1"
    1!
    0$
    0#
    #183
    0"
    #186
    1"
    #189
    0"
    #192
    1"
    0!
    #195
    0"
    #198
    1"
    #201
    0"
    #204
    1"
    1!
    #207
    0"
    #210
    1"
    #213
    0"
    #216
    1"
    0!
    #219
    0"
    #222
    1"
    #225
    0"
    #228
    1"
    1!
    #231
    0"
    #234
    1"
    #237
    0"
    #240
    1"
    0!
    #243
    0"
    #246
    1"
    #249
    0"
    #252
    1"
    1!
    #255
    0"
    #258
    1"
    #261
    0"
    #264
    1"
    0!
    #267
    0"
    #270
    1"
    #273
    0"
    #276
    1"
    1!
    #279
    0"
    #282
    1"
    #285
    0"
    #288
    1"
    0!
    #291
    0"
    #294
    1"
    #297
    0"
    #300
    1"
    1!
    #303
    0"
    #306
    1"
    #309
    0"
    #312
    1"
    0!
    #315
    0"
    #318
    1"
    #321
    0"
    #324
    1"
    1!
    #327
    0"
    #330
    1"
    #333
    0"
    #336
    1"
    0!
    #339
    0"
    #342
    1"
    #345
    0"
    #348
    1"
    1!
    #351
    0"
    #354
    1"
    #357
    0"
    #360
    1"
    0!
    1#
    #363
    0"
    #366
    1"
    #369
    0"
    #372
    1"
    1!
    #375
    0"
    #378
    1"
    #381
    0"
    #384
    1"
    0!

*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0901.vvp Guia_0901.v
Para executar: vvp Guia_0901.vvp
*/

