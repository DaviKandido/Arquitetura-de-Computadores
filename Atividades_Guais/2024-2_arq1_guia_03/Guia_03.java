/*
    -identificação: 

Guia_03.java - 15 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

import javax.xml.transform.Result;

public class Guia_03
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
 Converter valor binario para o complemento de 1.
 @return complemento de 1 equivalente
 @param length - tamanho
 @param value - valor binario
 */
 public static String C1 ( int length, String value )
 {


    String c1 = "";

    if(value.length() < length){
        for(int i = value.length(); i < length; i++){
            value = "0" + value;
        }
    }

    for(int i = 0; i < length; i++ ){
        if(value.charAt(i) == '1'){
            c1  += '0';
        }else
        c1 += '1';
    }


 return ( c1 );
 } // end C1 ( )
/*
 Converter valor binario para o complemento de 2.
 @return complemento de 2 equivalente
 @param length - tamanho
 @param value - valor binario
 */

 public static String C2 ( int length, String value )
 {
     char[] c2 = new char[length];

   
     while (value.length() < length) {
        value = "0" + value;
    }

    for (int i = 0; i < length; i++) {
        if (value.charAt(i) == '1') {
            c2[i] = '0';
        } else {
            c2[i] = '1';
        }
    }

    boolean ok = true;
    // Adiciona 1 ao complemento de 1 para obter o complemento de 2.
    for (int i = length - 1; i >= 0 && ok; i--) {
        if (c2[i] == '0') {
            c2[i] = '1';
            ok = false;
        } else {
            c2[i] = '0';
        }
    }

    // Converter o array de caracteres para uma string.
    return new String(c2);
 } // end C2 ( )
/*
 Converter valor em certa base para binario em complemento de 1.
 @return complemento de 1 equivalente
 @param length - tamanho
 @param value - valor em outra base
 @param base - base desse valor
 */ 

/*
Converter valor de uma base para binario com parte fracionaria.
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
                int referencia = parteInteira % base;
                if (referencia > 9 && base > 10) {
                    // Converte para caracteres hexadecimais (A-F)
                    char charN = (char) ('A' + referencia - 10);
                    binInteiro = charN + binInteiro;
                } else {
                    binInteiro = referencia + binInteiro;
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




public static double toDecimal ( String value, int base ){
    
    double decimalValue = 0;

    if (value.contains(".")) {
        String[] parte = value.split("\\.");
        String parteInteira = parte[0];
        String parteFracionaria = parte[1];
                                                                
        // Converte a parte inteira
        for (int i = 0; i < parteInteira.length(); i++) {
            char digit = parteInteira.charAt(parteInteira.length() - 1 - i);
            decimalValue += Character.digit(digit, base) * Math.pow(base, i); // Character.digit(digit, base) converte o caractere digit para o seu valor numérico correspondente na base original.
        }

        //Converte a parte fracionária
        for (int i = 0; i < parteFracionaria.length(); i++) {
            char digit = parteFracionaria.charAt(i);
            decimalValue += Character.digit(digit, base) * Math.pow(base, -(i + 1));
        }
    }else{
        for (int i = 0; i < value.length(); i++) {
            char digit = value.charAt(value.length() - 1 - i);
            decimalValue += Character.digit(digit, base) * Math.pow(base, i);
        }
    }

    return decimalValue;

}


public static String dbase2base ( String value, int base1, int base2 )
{

    double Result1 = toDecimal(value, base1);
    String Result2 = double2bin(Result1, base2);
    
    return String.valueOf(Result2);
} // end dbase2base ( )


 public static String C1 ( int length, String value, int base )
 {
    String c1 = dbase2base(value, base, 2);

    
    c1 = C1(length, c1);
    
 return ( c1 );
 } // end C1 ( )
/*
 Converter valor em certa base para binario em complemento de 2.
 @return complemento de 2 equivalente
 @param length - tamanho
 @param value - valor em outra base
 @param base - base desse valor
 */
 public static String C2 ( int length, String value, int base )
 {

    String c2 = dbase2base(value, base, 2);

    c2 = C2(length, c2);
    
 return ( c2 );
 } // end C2 ( )
/*
 Converter valor binario com sinal para decimal.
 @return decimal equivalente
 @param value - valor binario
 */
 public static String sbin2dec ( String value )
 {

    String sbin2 = C2(value.length(), value);

    String sbin10 = dbase2base(sbin2, 2, 10);

 return ( sbin10 );
 } // end sbin2dec ( )
/*
 Operar (subtrair) valores em certa base.
 @return valor resultante da operacao
 @param value1 - primeiro valor na base dada
 @param op - operacao ("-")
 @param value2 - segundo valor na base dada
 @param base - base para a conversao
 */
 public static String eval ( String value1, String op, String value2, int base )
 {
    
    String value1bin = dbase2base(value1, base, 10);
    String value2bin = dbase2base(value2, base, 10);

    double num1 = Double.parseDouble(value1bin);
    double num2 = Double.parseDouble(value2bin);


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

    if(result < 0){
        result = -result;
        String result2 = double2bin(result, base);
        return "-" + result2;
    } else{
        String result2 = double2bin(result, base);
        return  result2 ;
        
        //System.out.println(num1 + op + num2 + " = " + result + " = "+ result2);
    }


 } // end eval ( )
/*
 Operar valores em certas bases.
 @return valor resultante da operacao, se valida
 @param value1 - primeiro valor
 @param base1 - primeira base
 @param op - operacao
 @param value2 - segundo valor
 @param base2 - segunda base
 */
 public static String evalB1B2 ( String value1, int base1, String op, String value2, int base2 )
 {

    String value1bin = dbase2base(value1, base1, 10);
    String value2bin = dbase2base(value2, base2, 10);

    double num1 = Double.parseDouble(value1bin);
    double num2 = Double.parseDouble(value2bin);


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


    if(result < 0){
        result = -result;
        String result2 = double2bin(result, 2);

        return result2;
    } else{
        String result2 = double2bin(result, 2);

        return  result2;
    }
 } // end dbinEval ( )
/*
 Acao principal.
*/
 public static void main ( String [ ] args )
 {
 System.out.println ( "Guia_03 - Java Tests " );
 System.out.println ( " 857859 - Davi Cândido de Almeida" );
 System.out.println ( );
 test_equals ( C1 ( 6, "1010" ), "110101" );
 test_equals ( C1 ( 8, "1101" ), "11110010" );
 test_equals ( C2 ( 6, "101001" ), "010111" );
 test_equals ( C2 ( 7, "101111" ), "1010001" );
 test_equals ( C2 ( 8, "110100" ), "11001100" );
 System.out.println ( "1. errorTotalReportMsg = "+test_report ( ) );
 test_equals ( C1 ( 6, "321", 4 ), "000110" );
 test_equals ( C1 ( 8, "B2", 16 ), "01001101" );
 test_equals ( C2 ( 6, "231", 4 ), "010011" );
 test_equals ( C2 ( 10, "146", 8 ), "1110011010" );
 test_equals ( C2 ( 8, "6F", 16 ), "10010001" );
 System.out.println ( "2. errorTotalReportMsg = "+test_report ( ) );
 test_equals ( sbin2dec ( "10110" ), 10 );
 test_equals ( sbin2dec ( "110011" ), 13 );
 test_equals ( sbin2dec ( "100100" ), 28 );
 test_equals ( sbin2dec ( "1011011" ), 37 );
 test_equals ( sbin2dec ( "1110011" ), 13 );
 System.out.println ( "3. errorTotalReportMsg = "+test_report ( ) );
 test_equals ( eval ( "11001", "-", "1101", 2 ), "1100" );
 test_equals ( eval ( "101.1101", "-", "10.01", 2 ), "11.1001" );
 test_equals ( eval ( "312", "-", "231", 4 ), "21" );
 test_equals ( eval ( "376", "-", "267", 8 ), "107" );
 test_equals ( eval ( "7D2", "-", "A51", 16 ), "-27F" );
 System.out.println ( "4. errorTotalReportMsg = "+test_report ( ) );
 test_equals ( evalB1B2 ( "110101", 2, "-", "1011", 2 ), "101010" );
 test_equals ( evalB1B2 ( "101.1001", 2, "-", "3.1", 8 ), "10.0111" );
 test_equals ( evalB1B2 ( "213" , 4, "-", "3D", 16 ), "10110" );
 test_equals ( evalB1B2 ( "C5" , 16, "-", "1011001", 2 ), "1101100" );
 test_equals ( evalB1B2 ( "7E" , 16, "-", "2D", 16 ), "1010001" );
 System.out.println ( "5. errorTotalReportMsg = "+test_report ( ) );
 System.out.print ( "\n\nApertar ENTER para terminar." );
 System.console ( ).readLine ( );
} // end main ( )
} // end class