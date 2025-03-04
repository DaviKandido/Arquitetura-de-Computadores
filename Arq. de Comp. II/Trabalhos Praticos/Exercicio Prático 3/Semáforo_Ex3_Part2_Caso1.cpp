#include <Arduino.h>

/*
  Exercicio 02
  ULA CASO 1
 */

int led13_A=13;
int led12_B=12;   
int led11_C=11;
int led10_Vai1=10;
int saida;
int vai1;

void setup() {
	Serial.begin(9600);
    pinMode(led13_A,OUTPUT);
    pinMode(led12_B,OUTPUT);
    pinMode(led11_C,OUTPUT);
    pinMode(led10_Vai1,OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {
    int a = Serial.parseInt();
    int b = Serial.parseInt();
    int OP = Serial.parseInt();

    Serial.print("a= ");
    Serial.print(a);
    Serial.println();
    Serial.print("b= ");
    Serial.print(b);
    Serial.println();
    Serial.print("OP= ");
    Serial.print(OP);
    Serial.println();

    switch(OP){
      case 0:
       Serial.print("AND(");
       Serial.print(a);
       Serial.print(",");
       Serial.print(b);
       Serial.print(")= ");
       saida = portaAND(a, b);
       Serial.println(saida);
       break;
      case 1:
       Serial.print("OR(");
       Serial.print(a);
       Serial.print(",");
       Serial.print(b);
       Serial.print(")= ");
       saida = portaOR(a, b);
       Serial.println(saida);
       break;
      case 2:
       Serial.print("NOT(");
       Serial.print(a);
       Serial.print(")= ");
       saida = portaNOT(a);
       Serial.println(saida);   
       break;
      case 3:
       Serial.print("SOMA(");
       Serial.print(a);
       Serial.print(",");
       Serial.print(b);
       Serial.print(")= ");
       saida = portaSOMA(a, b);
       vai1 = portaAND(a, b);
       Serial.println(saida);
      
       Serial.print("Vai1 = ");
       Serial.println(vai1);
       break;           
      
    }
    
    if(OP > 3 || OP < 0)
      Serial.println("Entrada de OP invalida!");
   
        
    if(vai1)
	    mostrar(a,b,saida, vai1);
    else
      	mostrar(a,b,saida);
  }
}


int portaOR(int a, int b){
  return(a|b);
}

int portaAND(int a, int b){
  return(a&b);
}

int portaNOT(int a){  
  return(!a);
}

int portaSOMA(int a, int b){
  return(a+b);
}

void mostrar(int a, int b, int saida){
 digitalWrite(led13_A, a > 0);
 digitalWrite(led12_B, b > 0);
 digitalWrite(led11_C, saida > 0);
 digitalWrite(led10_Vai1, 0);
}

void mostrar(int a, int b, int saida, int vai1){
 digitalWrite(led13_A, a > 0);
 digitalWrite(led12_B, b > 0);
 digitalWrite(led11_C, saida > 0);
 digitalWrite(led10_Vai1, vai1 > 0);
}

