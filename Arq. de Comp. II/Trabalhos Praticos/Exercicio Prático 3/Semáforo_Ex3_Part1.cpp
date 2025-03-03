/*
  Exercicio 01
  Semafaro Temporizado
 */

// Definiçao de valores para variáveis  
int led10_Blue = 10;
int led11_Green = 11;
int led12_Yellow = 12;
int led13_Red = 13;

bool estadoBlue = false;
int contRed=0; // 3 Ciclos
int contGreen=0; // 4 Ciclos 
int contYellow=0; // 2 Ciclos


void setup() {                
  // configura os pinos como saídas DIGITAIS.
  pinMode(led10_Blue, OUTPUT);
  pinMode(led11_Green, OUTPUT);
  pinMode(led12_Yellow, OUTPUT);
  pinMode(led13_Red, OUTPUT);
  Serial.begin(9600);
}


void loop() {
  estadoBlue = !estadoBlue;
  digitalWrite(led10_Blue, estadoBlue);

  if(estadoBlue){

      if(contRed < 3){
       digitalWrite(led12_Yellow, 0);
       digitalWrite(led13_Red, 1); 
       contRed++;
      }

      if(contRed >= 3 && contGreen < 4){
       digitalWrite(led13_Red, 0);
       digitalWrite(led11_Green, 1); 
       contGreen++;
      }

      if(contRed >= 3 && contGreen >= 4 && contYellow < 2){
       digitalWrite(led11_Green, 0);
       digitalWrite(led12_Yellow, 1); 
       contYellow++;
      }

      if(contRed >= 3 && contGreen >= 4 && contYellow >= 2)
        contRed = contGreen = contYellow = 0;
    
  }
  
  delay(1000);
}