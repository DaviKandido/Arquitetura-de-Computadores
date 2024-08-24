/*
    -identificação: 

Guia_0403 - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module f03_a (output s, input x, y, z);
    assign s = (~x&~y&z) | (x&~y&z) | (x&y&~z) | (x&y&z);
endmodule 



module f03_b (output s, input x, y, z);

    assign s = (~x&y &z) | (x&~y&z) | ( x&y&~z) | (x&y&z);

endmodule 


module f03_c (output s, input x, y, w, z);

    assign s = (~x&~y&~w&z) | (~x&~y&w &z) | ( ~x&~y&w&~z) | (~x&y&w &~z) | (~x&y&w &z) | (x &~y&w &z) | (x &y&w &z) ;

endmodule 


module f03_d (output s, input x, y, w, z);

    assign s = (~x&~y&~w&z) | (~x&~y&w &~z) | (~x&y&w &~z) | (x &~y&~w&~z) | (x &~y&w &~z) | ( x& y&~w&~z) | (x &y&w &~z) ;

endmodule 


module f03_e (output s, input x, y, w, z);

    assign s = (~x&~y&~w&~z) | (~x&~y&w &~z) | (~x&y&~w&z ) | (~x&y&w &z) | (x &~y&~w&~z) | (x &~y&w &z);

endmodule 



// ---------------------
// -- test_module
// ---------------------
module Guia_0403;
    reg x, y, w, z;
    wire s1, s2, s3, s4, s5;
    // instancias
    f03_a f03_a (s1, x, y, z);
    f03_b f03_b (s2, x, y, z);
    f03_c f03_c (s3, x, y, w, z);
    f03_d f03_d (s4, x, y, w, z);
    f03_e f03_e (s5, x, y, w, z);
    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; w = 1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade 03)  \n");
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

 Atividade 03)  

 x  y  z =  a) b)
 x  x  x =  x  x 
 0  0  0 =  0  0 
 0  0  1 =  1  0 
 0  1  0 =  0  0 
 0  1  1 =  0  1 
 1  0  0 =  0  0 
 1  0  1 =  1  1 
 1  1  0 =  1  1 
 1  1  1 =  1  1 


 x  y  w  z =  c) d) e)
 x  x  x  x =  x  x  x 
 0  0  0  0 =  0  0  1 
 0  0  0  1 =  1  1  0 
 0  0  1  0 =  1  1  1 
 0  0  1  1 =  1  0  0 
 0  1  0  0 =  0  0  0 
 0  1  0  1 =  0  0  1 
 0  1  1  0 =  1  1  0 
 0  1  1  1 =  1  0  1 
 1  0  0  0 =  0  1  1 
 1  0  0  1 =  0  0  0 
 1  0  1  0 =  0  1  0 
 1  0  1  1 =  1  0  1 
 1  1  0  0 =  0  1  0 
 1  1  0  1 =  0  0  0 
 1  1  1  0 =  0  1  0 
 1  1  1  1 =  1  0  0 


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0403.vvp Guia_0403.v
Para executar: vvp Guia_0403.vvp
*/



