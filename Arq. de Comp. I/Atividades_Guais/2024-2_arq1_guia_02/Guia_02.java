

/**
    -identificação: 

Arquitetura de Computadores I - Guia_02.java

Guia_0101 - 02 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

public class Guia_02
{
/*
Contador de erros.
*/
private static int errors = 0;
/*
Testar se dois valores sao iguais.
@param x - primeiro valor
@param y - segundo valor
*/
public static void test_equals ( Object x, Object y )
{
if ( (""+x).compareTo(""+y) != 0 )
errors = errors + 1;
} // end test_equals ( )
/*
Exibir o total de erros.
@return mensagem com o total de erros
*/
public static String test_report ( )
{
return ( ""+errors );
} // end test_report ( )

/*
Converter valor binario para decimal com parte fracionaria.
@return decimal equivalente
@param value - valor binario
*/
public static double bin2double ( String value, int base )
{

    String[] parte = value.split("\\."); // Separar a parte inteira da parte fracionária
    String parteInteira = parte[0];
    String ParteFracionaria = parte.length > 1 ? parte[1] : ""; //Verifica se a se há valor fracionario, se houver aplica o valor de parte[1] se não uma string vazia


    double dec = 0.0;
    
    for (int i = 0; i < parteInteira.length(); i++) {
        if (parteInteira.charAt(parteInteira.length() - 1 - i) == '1') {
            dec += Math.pow(base, i);
        }
    }
    
    for (int i = 0; i < ParteFracionaria.length(); i++) {
        if (ParteFracionaria.charAt(i) == '1') {
            dec += Math.pow(base, -(i + 1)); // "-"negativo (Expoente negativo)
        }
    }
    
    return dec;
    } // end bin2double ( )

/*
Converter valor decimal para binario com parte fracionaria.
@return valor binario equivalente
@param value - decimal
*/
public static String double2bin ( double value, int base )
{
    
        int parteInteira = (int) value;
        double parteDecimal = value - parteInteira;

        String binInteiro = "";
        String binFracionario = "";

        if (parteInteira == 0) {
            binInteiro = "0";
        } else {
            while (parteInteira > 0) {
                if(parteInteira > 9 && base > 10){

                    char charN = (char)('a' + (parteInteira % base) - 10);

                    binInteiro = charN + binInteiro;
                }else{
                    binInteiro = (parteInteira % base) + binInteiro;
                }
                parteInteira = parteInteira / base;
            }
        }

        while (parteDecimal>0){
            parteDecimal = parteDecimal * base;
            int bit = (int) parteDecimal;
            if (bit > 0) {
                binFracionario = binFracionario + bit;
                parteDecimal = parteDecimal - bit;
                } else if (bit > 9 && base > 10){
                    binFracionario = binFracionario + ("a"+(bit-10));
                } else {
                    binFracionario = binFracionario + "0";
            }
        }

        String bin = "";
        if(binFracionario != ""){
            bin = binInteiro + "." + binFracionario;
        }else{
            bin = binInteiro;
        }
        return bin;
} // end double2bin ( )

/*
Converter valor binario com parte fracionaria para base indicada.
@return base para a conversao
@param value - valor binario
*/
public static String dbin2base ( String value, int base )
{

    double Result1 =  bin2double(value, 2);
    String Result2 = double2bin(Result1, base);
    
    return String.valueOf(Result2);
} // end bin2double ( )

/*
Converter valor com parte fracionaria de uma base para outra base indicada.
@return valor equivalente na segunda base
@param value - valor na base1
@param base1 - primeira base
@param base2 - base para a conversao
*/

public static double toDecimal ( String value, int base ){

    String[] parte = value.split("\\.");
    String parteInteira = parte[0];
    String parteFracionaria = parte[1];
                                                              

    // Converte a parte inteira
    double decimalValue = 0;
    for (int i = 0; i < parteInteira.length(); i++) {
        char digit = parteInteira.charAt(parteInteira.length() - 1 - i);
        decimalValue += Character.digit(digit, base) * Math.pow(base, i); // Character.digit(digit, base) converte o caractere digit para o seu valor numérico correspondente na base original.
    }

    // Converte a parte fracionária
    for (int i = 0; i < parteFracionaria.length(); i++) {
        char digit = parteFracionaria.charAt(i);
        decimalValue += Character.digit(digit, base) * Math.pow(base, -(i + 1));
    }

    return decimalValue;

}


public static String dbase2base ( String value, int base1, int base2 )
{

    double Result1 = toDecimal(value, base1);
    String Result2 = double2bin(Result1, base2);
    
    return String.valueOf(Result2);
} // end dbase2base ( )

/*
Operar valores em binario
@return valor resultante da operacao, se valida
@param value1 - primeiro valor binario
@param op - operacao
@param value2 - segundo valor binario
*/
public static String dbinEval ( String value1, String op, String value2 )
{

    double num1 = bin2double(value1,2);


    double num2 = bin2double(value2,2);

    double result = 0.0;

    switch(op){

        case "+":
            result = num1 + num2;
            break;
        case "-":
            result = num1 - num2;
            break;
        case "*":
            result = num1 * num2;
            break;
        case "/":
            result = (int)num1 / (int)num2;
            break;
        case "%":
            result = num1 % num2;
            break;
    }

    
    String result2 = double2bin(result, 2);
    
    //System.out.println(num1 + op + num2 + "=" + result +"="+ result2);

    return ( String.valueOf(result2) );
} // end dbinEval ( )
/*
Acao principal.
*/
public static void main ( String [ ] args )
{
System.out.println ( "Guia_02 - Java Tests" );
System.out.println ( "857859 - Davi Cândido de Almeida" );
System.out.println ( );
test_equals ( bin2double ( "0.00011", 2 ), 0.09375 );
test_equals ( bin2double ( "0.01001", 2 ), 0.28125 );
test_equals ( bin2double ( "0.10101", 2 ), 0.65625 );
test_equals ( bin2double ( "1.11101", 2 ), 1.90625 );
test_equals ( bin2double ( "11.11001", 2 ), 3.78125 );
System.out.println ( "1. errorTotalReport = "+test_report ( ) );
test_equals ( double2bin ( 0.375000, 2 ), "0.011" );
test_equals ( double2bin ( 2.125000, 2 ), "10.001" );
test_equals ( double2bin ( 3.625000, 2 ), "11.101" );
test_equals ( double2bin ( 5.031250, 2), "101.00001" );
test_equals ( double2bin ( 6.750000, 2 ), "110.11" );
System.out.println ( "2. errorTotalReport = "+test_report ( ) );
test_equals ( dbin2base ( "0.011110", 4 ), "0.132" );
test_equals ( dbin2base ( "0.101001", 8 ), "0.51" );
test_equals ( dbin2base ( "0.100110", 16 ), "0.98" );
test_equals ( dbin2base ( "1.111011", 8 ), "1.73" );
test_equals ( dbin2base ( "1101.1001", 16 ), "d.9" );
System.out.println ( "3. errorTotalRepor = "+test_report ( ) );
test_equals ( dbase2base ( "0.321" , 4 , 2 ), "0.111001" );
test_equals ( dbase2base ( "0.3D2" , 16 , 4 ), "0.033102" );
test_equals ( dbase2base ( "0.751" , 8, 2 ), "0.111101001" );
test_equals ( dbase2base ( "7.345" , 8, 4 ), "13.13022" );
test_equals ( dbase2base ( "F.A5E" , 16, 4 ), "33.221132" );
System.out.println ( "4. errorTotalReport = "+test_report ( ) );
test_equals ( dbinEval ( "101.11", "+", "10.011" ), "1000.001" );
test_equals ( dbinEval ( "1000.101", "-", "10.01" ), "110.011" );
test_equals ( dbinEval ( "101.101", "*", "10.101" ), "1110.110001" );
test_equals ( dbinEval ( "10111.01", "/", "11.011" ), "111" );
test_equals ( dbinEval ( "1101011","%", "1101" ), "11" );
System.out.println ( "5. errorTotalReport = "+test_report ( ) );
System.out.print ( "\n\nApertar ENTER para terminar." );
//System.console ( ).readLine ( );
} // end main ( )
} // end class