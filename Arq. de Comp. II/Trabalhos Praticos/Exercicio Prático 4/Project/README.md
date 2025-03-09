

  # Documentação de Projeto Compilador Python

```python
  import os # biblioteca para interagir com o sistema operacional
```



```python
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
```



### Função que lê um arquivo e retorna o conteúdo em uma lista de strings, cada string representando uma linha do arquivo.
 Parameters:
    arquivo (str): Caminho do arquivo que se deseja ler.
 Returns:
    list: Uma lista de strings, cada string representando uma linha do arquivo.

```python
def ler_Arquivo(arquivo):
pasta, nome = arquivo.split("/") # Divide o caminho do arquivo em pasta e nome

caminho_completo = os.path.join(pasta, nome) # Caminho completo do arquivo
with open(caminho_completo, "r") as f:  # Abre o arquivo em modo de leitura
    conteudo = f.readlines()  # Leitura das linhas do arquivo
    return conteudo
```

### Salva o conteúdo em um arquivo.
  Parameters
  ----------
  conteudo : List[str]
      O conteúdo a ser salvo.
  arquivo : str
      O caminho do arquivo que será salvo.

```python
def salvar_arquivo(conteudo, arquivo):
    pasta, nome =  arquivo.split("/") # Divide o caminho do arquivo em pasta e nome

    caminho_completo = os.path.join(pasta, nome) # Caminho completo do arquivo
    with open(caminho_completo, "w") as f:
        for i in conteudo:  # Escreve cada linha do conteúdo no arquivo
            f.write(i + "\n")
```


### Função que lê o arquivo "testeula.ula" e retorna um array com as instruções formatadas em hexadecimal.

O arquivo "testeula.ula" deve ter o seguinte formato:
inicio:
X=<valor>;
Y=<valor>;
W=<operacao>;
fim.

A função ignora as linhas "inicio:" e "fim.", e extrai os valores de X, Y e a operação W.
A operação W é convertida para o seu código hexadecimal correspondente, e o valor de X e Y são convertidos para inteiros.
A função retorna um array com as instruções formatadas em hexadecimal, no formato "XYO", onde X e Y são os valores gerados convertidos para hexadecimal (1 caractere cada) e O é o código hexadecimal da operação escolhida.
```python
def estrator_operacoes():
    instrucao = ler_Arquivo("dados/testeula.ula")

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
```

### Função principal do programa.

  Ela executa a função estrator_operacoes, que extrai as operações do arquivo
  'testeula.ula', e salva o resultado em um arquivo 'testeula.hex' no
  formato hexadecimal.
```python
def main():
    operacao = estrator_operacoes()
    salvar_arquivo(operacao, "dados/testeula.hex") # Salva as instruções no arquivo 'testeula.hex'
```

```python
if __name__ == "__main__":
    main()
```