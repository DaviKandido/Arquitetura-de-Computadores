/*
    -identificação: 

R0101 - 15 / 10 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module f01_a (output s, input a, b, c, d);
    assign s = (~a&b&~c&~d) | (a&~b&~c&~d) | (a&~b&~c&d) | (a&b&~c&~d) | (a&b&~c&d) | (a&b&c&~d);
endmodule 



module f01_b (output s, input A, B, C, D);

    assign s = (A|B|C|D) & (A|B|C|~D) & (A|B|~C|D) & (A|B|~C|~D) & (A|~B|C|~D) & (A|~B|~C|D) & (A|~B|~C|~D) & (~A|B|~C|D) & (~A|B|~C|~D) & (~A|~B|~C|~D);

endmodule 


module f01_c (output s, input a, b, c, d);

    assign s = (a&~c) | (b&~c&~d) | (a&b&~d) ;

endmodule 


module f01_d (output s, input A, B, C, D);

    assign s = (A|B) & (A|~D) & (A|~C) & (~C|~D) & (B|~C) ;

endmodule 


module f01_e (output s, input a, b, c, d);

    assign s = ~( ~(a&~(c&c)) & ~(b&~(c&c)&~(d&d)) & ~(a&b&~(d&d)) );

endmodule 

module f01_f (output s, input A, B, C, D);

    assign s = ~( (~(A|B)) | (~(A|~(D|D))) | (~(A|~(C|C))) | (~(~(C|C)|~(D|D))) |( ~(B|~(C|C))) );

endmodule 



// ---------------------
// -- test_module
// ---------------------
module R0101;
    reg x, y, w, z;
    wire s1, s2, s3, s4, s5, s6;
    // instancias
    f01_a f01_a (s1, x, y, w, z);
    f01_b f01_b (s2, x, y, w, z);
    f01_c f01_c (s3, x, y, w, z);
    f01_d f01_d (s4, x, y, w, z);
    f01_e f01_e (s5, x, y, w, z);
    f01_f f01_f (s6, x, y, w, z);

    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; w = 1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display(" Davi Cândido de Almeida - 857859");
    $display("\n Atividade 01)  \n");

    x=1'bx; y=1'bx; z=1'bx; w = 1'bx;
    $display(" a  b  c  d =  a) b) c) d) e) f)");
    $monitor("%2b %2b %2b %2b = %2b %2b %2b %2b %2b %2b  ", x, y, w, z, s1, s2, s3, s4, s5, s6);
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

 Davi Cândido de Almeida - 857859

 Atividade 01)  

 a  b  c  d =  a) b) c) d) e) f)
 x  x  x  x =  x  x  x  x  x  x  
 0  0  0  0 =  0  0  0  0  0  0  
 0  0  0  1 =  0  0  0  0  0  0  
 0  0  1  0 =  0  0  0  0  0  0  
 0  0  1  1 =  0  0  0  0  0  0  
 0  1  0  0 =  1  1  1  1  1  1  
 0  1  0  1 =  0  0  0  0  0  0  
 0  1  1  0 =  0  0  0  0  0  0  
 0  1  1  1 =  0  0  0  0  0  0  
 1  0  0  0 =  1  1  1  1  1  1  
 1  0  0  1 =  1  1  1  1  1  1  
 1  0  1  0 =  0  0  0  0  0  0  
 1  0  1  1 =  0  0  0  0  0  0  
 1  1  0  0 =  1  1  1  1  1  1  
 1  1  0  1 =  1  1  1  1  1  1  
 1  1  1  0 =  1  1  1  1  1  1  
 1  1  1  1 =  0  0  0  0  0  0 


*/

/*
    -Notas:

Para compilar: iverilog -o R0101.vvp R0101.v
Para executar: vvp R0101.vvp
*/



