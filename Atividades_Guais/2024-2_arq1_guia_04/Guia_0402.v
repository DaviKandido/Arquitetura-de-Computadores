/*
    -identificação: 

Guia_0402 - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module f02_a (output s, input x, y, z);
    assign s = x & ~( ~x | y );
endmodule 



module f02_b (output s, input x, y, z);

    assign s = ( ~x | y ) | ( ~x & y );

endmodule 


module f02_c (output s, input x, y, z);

    assign s = ~( ~x & ~y ) & ( x | y );

endmodule 


module f02_d (output s, input x, y, z);

    assign s = ~( ~x & y ) | ~( ~x | y );

endmodule 


module f02_e (output s, input x, y, z);

    assign s = ( y | ~x ) & ~( ~y | x );

endmodule 

//-----------------------------Expressões Simplificadas------------------------------------//

module f02_aSi (output s, input x, y, z);
    assign s = x&~y;
endmodule 



module f02_bSi (output s, input x, y, z);

    assign s = (~x|y);

endmodule 


module f02_cSi (output s, input x, y, z);

    assign s = (x|y);

endmodule 


module f02_dSi (output s, input x, y, z);

    assign s = (x|~y);

endmodule 


module f02_eSi (output s, input x, y, z);

    assign s = (y&~x);

endmodule 
//-------------------------------End Expressões Simplificadas----------------------------------//

// ---------------------
// -- test_module
// ---------------------
module Guia_0402;
    reg x, y, z;
    wire s1, s2, s3, s4, s5,   s1Si, s2Si, s3Si, s4Si, s5Si;
    // instancias
    f02_a f02_a (s1, x, y, z);
        f02_aSi f02_aSi (s1Si, x, y, z);

    f02_b f02_b (s2, x, y, z);
        f02_bSi f02_bSi (s2Si, x, y, z);

    f02_c f02_c (s3, x, y, z);
        f02_cSi f02_cSi (s3Si, x, y, z);

    f02_d f02_d (s4, x, y, z);
        f02_dSi f02_dSi (s4Si, x, y, z);

    f02_e f02_e (s5, x, y, z);
        f02_eSi f02_eSi (s5Si, x, y, z);


    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade 02) \n");
    // monitoramento
    $display(" x  y =  a) aS b) bS c) cS d) dS e) eS");
    $monitor("%2b %2b = %2b %2b %2b %2b %2b %2b %2b %2b %2b %2b ", x, y, s1, s1Si, s2, s2Si, s3, s3Si, s4, s4Si, s5, s5Si);
    // sinalizacao
    #1 x=0; y=0;
    #1 x=0; y=1;
    #1 x=1; y=0;
    #1 x=1; y=1;
end
endmodule // test_module
/*
    -Saídas de resultados:

Exemplo- Davi Cândido de Almeida - 857859

 Atividade 02) 

 x  y =  a) aS b) bS c) cS d) dS e) eS
 x  x =  x  x  x  x  x  x  x  x  x  x 
 0  0 =  0  0  1  1  0  0  1  1  0  0 
 0  1 =  0  0  1  1  1  1  0  0  1  1 
 1  0 =  1  1  0  0  1  1  1  1  0  0 
 1  1 =  0  0  1  1  1  1  1  1  0  0 

 Observou-se que pelas saidas x - xS serem iguais significa que as espresseões
 foram simplificadas com sucesso


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0402.vvp Guia_0402.v
Para executar: vvp Guia_0402.vvp
*/



