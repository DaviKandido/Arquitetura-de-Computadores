/*
    -identificação: 

Guia_0405 - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression SOP
// ---------------------

module f05_a_SOP (output s, input x, y);

    assign s = (x&~y);

endmodule 


module f05_b_SOP (output s, input x, y);

    assign s = (~x&y) | (x&y);

endmodule 


module f05_c_SOP (output s, input x, y, z);

    assign s = (~x&~y&~z) | (~x&y&z) | (x&~y&~z) | (x&~y&z) | (x&y&z) ;

endmodule 


module f05_d_SOP (output s, input x, y, z);

    assign s = (~x&~y&~z) | (~x&~y&z) | (~x&y&~z) | (x&~y&~z) | (x&~y&z) | (x&y&~z) ;

endmodule 


module f05_e_SOP (output s, input x,y, w, z);

    assign s = (~x&~y&~w&~z) | (~x&~y&~w&z) | (~x&~y&w&z) | (~x&y&~w&z) | (~x&y&w&~z) | (x&~y&~w&~z) | (x&~y&~w&z) | (x&~y&w&~z) | (x&y&~w&~z) | (x&y&w&~z) | (x&y&w&z);

endmodule 

// ---------------------
// -- expression POS
// ---------------------

module f05_a_POS (output s, input x, y);

    assign s = (x|y) & (x|~y) & (~x|~y);

endmodule 


module f05_b_POS (output s, input x, y);

    assign s = (x|y) & (~x|y) ;

endmodule 


module f05_c_POS (output s, input x, y, z);

    assign s = (x|y|~z) & (x|~y|z) & (~x|~y|z) ;

endmodule 


module f05_d_POS (output s, input x, y, z);

    assign s = (x|~y|~z) & (~x|~y|~z) ;

endmodule 


module f05_e_POS (output s, input x,y, w, z);

    assign s = (x|y|~w|z) & (x|~y|w|z) & (x|~y|~w|~z) & (~x|y|~w|~z) & (~x|~y|w|~z);

endmodule 


// ---------------------
// -- test_module
// ---------------------
module Guia_0405;
    reg x, y, w, z;
    wire s1_SOP, s2_SOP, s3_SOP, s4_SOP, s5_SOP, s1_POS, s2_POS, s3_POS, s4_POS, s5_POS;
    // instancias
    f05_a_SOP f05_a_SOP (s1_SOP, x, y);
        f05_a_POS f05_a_POS (s1_POS, x, y);

    f05_b_SOP f05_b_SOP (s2_SOP, x, y);
        f05_b_POS f05_b_POS (s2_POS, x, y);

    f05_c_SOP f05_c_SOP (s3_SOP, x, y, z);
        f05_c_POS f05_c_POS (s3_POS, x, y, z);

    f05_d_SOP f05_d_SOP (s4_SOP, x, y, z);
        f05_d_POS f05_d_POS (s4_POS, x, y, z);

    f05_e_SOP f05_e_SOP (s5_SOP, x, y, w, z);
        f05_e_POS f05_e_POS (s5_POS, x, y, w, z);

    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; w = 1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade 05)  \n");
    // monitoramento
    $display(" x  y  =  aS aP bS bP");
    $monitor("%2b %2b = %2b %2b %2b %2b ", x, y, s1_SOP, s1_POS, s2_SOP, s2_POS);
    // sinalizacao
    #1 x=0; y=0;
    #1 x=0; y=1;
    #1 x=1; y=0;
    #1 x=1; y=1;
    #1

    x=1'bx; y=1'bx; z=1'bx; w = 1'bx;
    $display("\n x  y  z =  cS cP dS dP");
    $monitor("%2b %2b %2b = %2b %2b %2b %2b", x, y, z, s3_SOP, s3_POS, s4_SOP, s4_POS);
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
    $display("\n x  y  w  z =  eS eP");
    $monitor("%2b %2b %2b %2b = %2b %2b ", x, y, w, z, s5_SOP, s5_POS);
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

 Atividade 05)  

 x  y  =  aS aP bS bP
 x  x =  x  x  x  x 
 0  0 =  0  0  0  0 
 0  1 =  0  0  1  1 
 1  0 =  1  1  0  0 
 1  1 =  0  0  1  1 

 x  y  z =  cS cP dS dP
 x  x  x =  x  x  x  x
 0  0  0 =  1  1  1  1
 0  0  1 =  0  0  1  1
 0  1  0 =  0  0  1  1
 0  1  1 =  1  1  0  0
 1  0  0 =  1  1  1  1
 1  0  1 =  1  1  1  1
 1  1  0 =  0  0  1  1
 1  1  1 =  1  1  0  0

 x  y  w  z =  eS eP
 x  x  x  x =  x  x 
 0  0  0  0 =  1  1 
 0  0  0  1 =  1  1 
 0  0  1  0 =  0  0 
 0  0  1  1 =  1  1 
 0  1  0  0 =  0  0 
 0  1  0  1 =  1  1 
 0  1  1  0 =  1  1 
 0  1  1  1 =  0  0 
 1  0  0  0 =  1  1 
 1  0  0  1 =  1  1 
 1  0  1  0 =  1  1 
 1  0  1  1 =  0  0 
 1  1  0  0 =  1  1 
 1  1  0  1 =  0  0 
 1  1  1  0 =  1  1 
 1  1  1  1 =  1  1 
s
Observou-se que os resultados considiram entre a SOP e POS
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0405.vvp Guia_0405.v
Para executar: vvp Guia_0405.vvp
*/



