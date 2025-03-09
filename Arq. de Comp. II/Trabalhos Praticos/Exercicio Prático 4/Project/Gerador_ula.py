import random  # Importa o módulo para gerar números aleatórios
import os  # Importa o módulo para manipulação de arquivos e diretórios

def gerar_instrucoes():
    # Dicionário que mapeia operações para seus códigos hexadecimais correspondentes
    operacoes = {
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
    
    instrucoes = []  # Lista para armazenar as instruções formatadas
    
    for _ in range(100):  # Gera 20 instruções aleatórias
        x = random.randint(0, 15)  # Gera um valor aleatório para X (0 a 15)
        y = random.randint(0, 15)  # Gera um valor aleatório para Y (0 a 15)
        operacao = random.choice(list(operacoes.keys()))  # Escolhe uma operação aleatória

        # Adiciona as instruções formatadas à lista
        instrucoes.append(f"X={x};")
        instrucoes.append(f"Y={y};")
        instrucoes.append(f"W={operacao};")
    
    return instrucoes   # Retorna as instruções e suas representações em hexadecimal

def salvar_arquivo(nome, conteudo):
    pasta = "dados"  # Nome da pasta onde os arquivos serão salvos
    os.makedirs(pasta, exist_ok=True)  # Cria a pasta se ela não existir
    caminho_completo = os.path.join(pasta, nome)  # Caminho completo do arquivo
    
    with open(caminho_completo, "w") as f:  # Abre o arquivo em modo de escrita
        f.write("inicio:\n")
        for linha in conteudo:  # Escreve cada linha do conteúdo no arquivo
            f.write(linha + "\n")
        f.write("fim.\n")

def main():
    # Gera as instruções e suas representações em hexadecimal
    instrucoes = gerar_instrucoes()
    
    # Salva as instruções no arquivo 'testeula.ula'
    salvar_arquivo("testeula.ula", instrucoes)
    
    # Exibe uma mensagem informando que os arquivos foram gerados
    print("Arquivos gerados na pasta 'dados': testeula.ula e testeula.hex")

# Executa a função main() apenas se o script for executado diretamente
if __name__ == "__main__":
    main()
