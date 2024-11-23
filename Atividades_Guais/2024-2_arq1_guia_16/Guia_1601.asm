; Guia_1600c.txt
; 857859 - Davi Cândido de Almeida
;
; Extrair o nibble alto de um número de 8 bits chamando uma função (nibble alto é o grupo de 4 bits mais significativos)
; Armazene manualmente o 1º número na posição de memória 0050h
; O resultado é armazenado em 0052h
;
; F_HI - Função HI ; A = hi(C)
; @retorna A
; @parâmetro C


      JMP MAIN
F_HI: POP H

      POP B
      MOV A,C
      ANI F0
      RAR
      RAR
      RAR
      RAR
      PUSH H
      RET

MAIN: LXI H,0050
      MVI B,00
      MOV C,M
      PUSH B
C_HI: CALL F_HI // A = F_HI (C)
      STA 0052 // MEM[0052] = A
      HLT
END:



; Guia_1601c.txt
; 857859 - Davi Cândido de Almeida
;
; Implementar um programa (Guia_1601.txt) para o processador 8085 para
; calcular o produto (IMUL) de dois dados
; com 8 bits cada.
; DICA: Usar somas sucessivas e tamanho maior que 8 bits para o resultado.
; dado03 = dado01 * dado02

; Redireciona PC para a MAIN
JMP MAIN

; Função de Inicialização
INIT:
    LXI H,C100      ; Aponta para o início da memória
    MVI M,04H       ; Inicializa dado01 = 4
    INX H
    MVI M,03H       ; Inicializa dado02 = 3
    RET

; Função de Multiplicação por somas sucessivas
MULT:
    MOV B,M         ; Multiplicando (dado01) no registrador B
    INX H
    MOV C,M         ; Multiplicador (dado02) no registrador C

    MVI D,00H       ; Parte alta do resultado inicializada em 0
    MVI E,00H       ; Parte baixa do resultado inicializada em 0

BACK:
    MOV A,E         ; Carrega a parte baixa do resultado
    ADD B            ; Soma o multiplicando
    MOV E,A         ; Atualiza a parte baixa do resultado
    MOV A,D         ; Carrega a parte alta do resultado
    ACI 00H          ; Adiciona carry (se houver)
    MOV D,A         ; Atualiza a parte alta do resultado

    DCR C            ; Decrementa o contador (multiplicador)
    JNZ BACK         ; Repete enquanto o contador não for zero
    RET

; Programa Principal
MAIN: 
    CALL INIT        ; Inicializa variáveis

    ; Aponta para os dados na memória
    LXI H,C100

    CALL MULT        ; Chama a função de multiplicação

    ; Armazena o resultado na memória
    SHLD C103        ; Armazena o resultado em 16 bits (C103 e C104)

    HLT              ; Finaliza o programa

END:
