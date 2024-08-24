/*
    -identificação: 

Guia_04_06e07_Extras - 23 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/


// ---------------------
// -- expression
// ---------------------

module FXYZ (output S1, input X, input Y, input Z);
assign S1 = ( ~X | Y | ~Z ) & ( X | ~Y | ~Z);
endmodule // FXYZ


module fxyz (output s1, input x, input y, input z);
assign s1 = ( ~x & ~y & z ) | ( x & y & ~z);
endmodule // fxyz 



// ---------------------
// -- test_module
// ---------------------
module Guia_04_06e07_Extras;
    reg x, y, z;
    wire s1, S1;
    // instancias
    FXYZ FXYZ (s1_SOP, x, y, z);
    fxyz fxyz (s1_POS, x, y, z);

    // valores iniciais
    initial begin: start
    x=1'bx; y=1'bx; z=1'bx; // indefinidos
    end
    // parte principal
    initial begin: main
    // identificacao
    $display("Exemplo- Davi Cândido de Almeida - 857859");
    $display("\n Atividade Extras 06 e 07)  \n");
    // monitoramento
    $display(" x  y  z =  06 07");
    $monitor("%2b %2b %2b = %2b %2b ", x, y, z, s1_SOP, s1_POS, );
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

 Atividade Extras 06 e 07)  

 x  y  z =  06 07
 x  x  x =  x  x  
 0  0  0 =  1  0  
 0  0  1 =  1  1  
 0  1  0 =  1  0  
 0  1  1 =  0  0  
 1  0  0 =  1  0  
 1  0  1 =  0  0  
 1  1  0 =  1  1  
 1  1  1 =  1  0  


 SOP F (X,Y,Z) = π M ( 0, 1, 2, 4, 6, 7) = (x'•y'•z') + (x•y•z') + (x•y'•z) + (x'•y•z) + (x'•y'•z) + (x'•y'•z')

 POS f (x,y,z) = ∑ m ( 0, 2, 3, 4, 5, 7 ) = (x+y+z) • (x+y'+z) • (x+y'+z') • (x'+y+z) • (x'+y+z') • (x'+y'+z')


*/

/*
    -Notas:

Para compilar: iverilog -o Guia_04_06e07_Extras.vvp Guia_04_06e07_Extras.v
Para executar: vvp Guia_04_06e07_Extras.vvp
*/



