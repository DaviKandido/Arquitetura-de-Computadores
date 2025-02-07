/*
    -identificação: 

Guia_0401 - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module f01_a (output s, input x, y, z);
    assign s = ~x & ~( ~y|z );
endmodule 



module f01_b (output s, input x, y, z);

    assign s = ~( ~x |~y ) & z;

endmodule 


module f01_c (output s, input x, y, z);

    assign s = ~( x & ~y ) & ~z;

endmodule 


module f01_d (output s, input x, y, z);

    assign s = ~( ~x & y ) & z;

endmodule 


module f01_e (output s, input x, y, z);

    assign s = ( ~x | y ) & ~( ~y | z);

endmodule 



// ---------------------
// -- test_module
// ---------------------
module Guia_0401;
    reg x, y, z;
    wire s1, s2, s3, s4, s5;
    // instancias
    f01_a f01_a (s1, x, y, z);
    f01_b f01_b (s2, x, y, z);
    f01_c f01_c (s3, x, y, z);
    f01_d f01_d (s4, x, y, z);
    f01_e f01_e (s5, x, y, z);
    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade 01)  \n");
    // monitoramento
    $display(" x  y  z =  a) b) c) d) e)");
    $monitor("%2b %2b %2b = %2b %2b %2b %2b %2b ", x, y, z, s1, s2, s3, s4, s5);
    // sinalizacao
    #1 x=0; y=0; z=0;
    #1 x=0; y=0; z=1;
    #1 x=0; y=1; z=0;
    #1 x=0; y=1; z=1;
    #1 x=1; y=0; z=0;
    #1 x=1; y=0; z=1;
    #1 x=1; y=1; z=0;
    #1 x=1; y=1; z=1;
end
endmodule // test_module
/*
    -Saídas de resultados:

Exemplo- Davi Cândido de Almeida - 857859
Atividade 01)

 x  y  z =  a) b) c) d) e)
 x  x  x =  x  x  x  x  x 
 0  0  0 =  0  0  1  0  0 
 0  0  1 =  0  0  0  1  0 
 0  1  0 =  1  0  1  0  1 
 0  1  1 =  0  0  0  0  0 
 1  0  0 =  0  0  0  0  0 
 1  0  1 =  0  0  0  1  0 
 1  1  0 =  0  0  1  0  1 
 1  1  1 =  0  1  0  1  0 
[Done] exit with code=0 in 0.044 seconds


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0401.vvp Guia_0401.v
Para executar: vvp Guia_0401.vvp
*/



