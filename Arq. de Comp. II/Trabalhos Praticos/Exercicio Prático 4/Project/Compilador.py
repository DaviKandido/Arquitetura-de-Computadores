import os

# Dicionário que mapeia operações para seus códigos hexadecimais correspondentes
Mnemonico = {
      "zeroL": "0", 
      "umL": "1", 
      "copiaA": "2", 
      "copiaB": "3", 
      "nA": "4", 
      "nB": "5", 
      "AenB": "6", 
      "nAeB": "7", 
      "AxB": "8", 
      "nAxnB": "9", 
      "nAxnBn": "A", 
      "AeB": "B", 
      "AeBn": "C", 
      "AoBn": "D", 
      "AoB": "E", 
      "nAonBn": "F"
}

# Função para ler um arquivo
def ler_Arquivo(arquivo):
    with open(arquivo, "r") as f:  # Abre o arquivo em modo de leitura
        conteudo = f.readlines()  # Leitura das linhas do arquivo
        return conteudo
    
# Função para salvar no arquivo
def salvar_arquivo(conteudo, arquivo):
    with open(arquivo, "w") as f:
        for i in conteudo:  # Escreve cada linha do conteúdo no arquivo
            f.write(i + "\n")
    

def estrator_operacoes():
    instrucao = ler_Arquivo("dados/testeula.ula") # Leitura do arquivo 'testeula.ula', estraindo as instruções

    Array_Operacoes = []

    for i in instrucao:
        if i == "inicio:\n" or i == "fim.\n":
            continue
        
        var, val = i.split("=") # Divide a instrução em partes variável, valor ou operação
        val = val.strip().replace(";", "")
        if var == 'X':
            x = int(val) # Converte o valor para inteiro
        elif var == 'Y':
            y = int(val) # Converte o valor para inteiro
        else:
            Array_Operacoes.append(f"{x:01X}{y:01X}{Mnemonico[val]}") # Adiciona a instrução formatada ao array
    
    return Array_Operacoes


# Função principal
def main():
    operacao = estrator_operacoes()
    salvar_arquivo(operacao, "dados/testeula.hex") # Salva as instruções no arquivo 'testeula.hex'


# Executa a função main() apenas se o script for executado diretamente
if __name__ == "__main__":
    main()