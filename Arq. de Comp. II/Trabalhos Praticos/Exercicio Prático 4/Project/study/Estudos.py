
# Retorna como string
nome = input("Digite seu nome: ")
idade = int(input("Digite sua idade: "))
peso = float(input("Digite o seu peso: "))

print("Olá", nome, "você tem", idade, "anos e pesa", peso, "kg")

print(type(peso))


# Operadores
soma = 1 + 1
subtracao = 1 - 1
multiplicacao = 1 * 1
divisao = 1 / 1
potencia = 1 ** 1

print("Soma: ",soma, 
      "\nSubtração: ", subtracao, 
      "\nMultiplicação: ", multiplicacao, 
      "\nDivisão: ", divisao, 
      "\nPotência: ", potencia)


# Condicionais
if idade >= 18:
    print("Maior de idade")
else:
    print("Menor de idade")

if peso <= 50:
    print("Peso baixo")
elif peso > 60 and peso < 70:
    print("Peso ideal")
else:
    print("Peso alto")


# Lista de dados
lista = [1, 2, 3, 4, "numero 5", 6, 7.5, 8, True, 10]

for x in lista:
    print(x)

# Metodos que podem ser utilizados em listas

# append(item) - Adiciona um item ao final da lista
# clear() - Limpa todos os elementos da lista
# copy() - Retorna uma cópia da lista
# count(item) - Retorna o número de ocorrências de um elemento na lista
# extend() - Adiciona os elementos de uma lista ao final da lista
# index(item) - Retorna o índice de um elemento na lista
# insert(posição, item) - Insere um elemento em uma posição específica da lista
# pop(item) - Remove um elemento de uma posição específica da lista
# remove(item) - Remove um elemento da lista
# reverse() - Inverte a ordem dos elementos na lista
# sort() - Ordena os elementos da lista

# len(lista) - Retorna o número de elementos na lista
# min(lista) - Retorna o menor elemento da lista
# max(lista) - Retorna o maior elemento da lista


# Repetições

# for
for i in range(5): # range(5) = [0, 1, 2, 3, 4]
    print(i)

# while
while i < 5:
  print(i)
  i += 1

# Dicionario
dicionario = {
    "nome": "João",
    "idade": 18, 
    "peso": 70.2
    }

print(dicionario["nome"])

# lista de dicionarios
dicionarios = [
    {
        "nome": "João",
        "idade": 18, 
        "peso": 70.2
    },
    {
        "nome": "Maria",
        "idade": 20, 
        "peso": 60.2
    }
]

print(dicionarios[0]["nome"])



# import os
# import random

# os.system("cls")
# print(random.randint(1, 10))


# Funções

def soma(a, b):
    return a + b