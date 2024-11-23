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
