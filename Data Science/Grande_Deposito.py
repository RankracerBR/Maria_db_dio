valor = float(input())

if valor > 0:
    print(f'Deposito realizado com sucesso!')
    print(f'Saldo atual: R$ {valor:.2f}')
elif valor < 0:
   print('Valor invalido! Digite um valor maior que zero.')
else:
  print('Encerrando o programa...')