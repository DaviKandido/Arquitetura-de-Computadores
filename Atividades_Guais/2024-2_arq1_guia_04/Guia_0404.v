/*
    -identificação: 

Guia_0404 - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module f04_a (output s, input X, Y, Z);
    assign s = (X|Y|~Z) & (X|~Y|Z) & (~X|~Y|Z) & (~X|~Y|~Z);
endmodule 



module f04_b (output s, input X, Y, Z);

    assign s = ( X |Y |Z) & ( X|~Y|~Z) & (~X|Y |Z) & (~X|~Y|~Z);

endmodule 


module f04_c (output s, input X, Y, W, Z);

    assign s = (X |Y|W |Z) & (X |Y|W |~Z) & (X |Y|~W|Z ) & (X |~Y|W |Z) & (X |~Y|~W|Z) & (~X|Y |W |Z) & (~X|Y|~W|~Z) & (~X|~Y|W |Z) ;

endmodule 


module f04_d (output s, input X, Y, W, Z);

    assign s = (X |Y|W |~Z) & (X |Y|~W|Z ) & (X |~Y|W|Z ) & (X|~Y|~W|~Z) & (~X|Y|W |Z ) & (~X|Y| W|~Z) & (~X|~Y|~W|~Z) ;

endmodule 


module f04_e (output s, input X, Y, W, Z);

    assign s = (X |Y|W |Z ) & (X |Y|W |~Z) & (X |Y|~W|Z ) & (X |~Y|W |Z) & (X |~Y|W|~Z) & (~X|Y |~W|Z) & (~X|~Y|W|~Z);

endmodule 



// ---------------------
// -- test_module
// ---------------------
module Guia_0404;
    reg x, y, w, z;
    wire s1, s2, s3, s4, s5;
    // instancias
    f04_a f04_a (s1, x, y, z);
    f04_b f04_b (s2, x, y, z);
    f04_c f04_c (s3, x, y, w, z);
    f04_d f04_d (s4, x, y, w, z);
    f04_e f04_e (s5, x, y, w, z);
    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; w = 1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade 04)  \n");
    // monitoramento
    $display(" x  y  z =  a) b)");
    $monitor("%2b %2b %2b = %2b %2b ", x, y, z, s1, s2);
    // sinalizacao
    #1 x=0; y=0; z=0;
    #1 x=0; y=0; z=1;
    #1 x=0; y=1; z=0;
    #1 x=0; y=1; z=1;
    #1 x=1; y=0; z=0;
    #1 x=1; y=0; z=1;
    #1 x=1; y=1; z=0;
    #1 x=1; y=1; z=1;
    #1

    x=1'bx; y=1'bx; z=1'bx; w = 1'bx;
    $display("\n");
    $display(" x  y  w  z =  c) d) e)");
    $monitor("%2b %2b %2b %2b = %2b %2b %2b ", x, y, w, z, s3, s4, s5);
    #1 x=0; y=0; w = 0; z=0; 
    #1 x=0; y=0; w = 0; z=1;
    #1 x=0; y=0; w = 1; z=0; 
    #1 x=0; y=0; w = 1; z=1; 
    #1 x=0; y=1; w = 0; z=0; 
    #1 x=0; y=1; w = 0; z=1; 
    #1 x=0; y=1; w = 1; z=0; 
    #1 x=0; y=1; w = 1; z=1; 
    #1 x=1; y=0; w = 0; z=0; 
    #1 x=1; y=0; w = 0; z=1; 
    #1 x=1; y=0; w = 1; z=0; 
    #1 x=1; y=0; w = 1; z=1; 
    #1 x=1; y=1; w = 0; z=0; 
    #1 x=1; y=1; w = 0; z=1; 
    #1 x=1; y=1; w = 1; z=0; 
    #1 x=1; y=1; w = 1; z=1; 
        
end
endmodule // test_module
/*
    -Saídas de resultados:

Exemplo- Davi Cândido de Almeida - 857859

 Atividade 04)  

 x  y  z =  a) b)
 x  x  x =  x  x 
 0  0  0 =  1  0 
 0  0  1 =  0  1 
 0  1  0 =  0  1 
 0  1  1 =  1  0 
 1  0  0 =  1  0 
 1  0  1 =  1  1 
 1  1  0 =  0  1 
 1  1  1 =  0  0 


 x  y  w  z =  c) d) e)
 x  x  x  x =  x  x  x 
 0  0  0  0 =  0  1  0 
 0  0  0  1 =  0  0  0 
 0  0  1  0 =  0  0  0 
 0  0  1  1 =  1  1  1 
 0  1  0  0 =  0  0  0 
 0  1  0  1 =  1  1  0 
 0  1  1  0 =  0  1  1 
 0  1  1  1 =  1  0  1 
 1  0  0  0 =  0  0  1 
 1  0  0  1 =  1  0  1 
 1  0  1  0 =  1  1  0 
 1  0  1  1 =  0  1  1 
 1  1  0  0 =  0  1  1 
 1  1  0  1 =  1  1  0 
 1  1  1  0 =  1  1  1 
 1  1  1  1 =  1  0  1 


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0404.vvp Guia_0404.v
Para executar: vvp Guia_0404.vvp
*/



