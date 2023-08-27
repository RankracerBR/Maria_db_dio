#Libs
import pandas as pd
import csv
import os

#Functions
def get_usuarios():
    users = pd.read_csv('STDW.csv')
    users_json = users.to_json(orient='records')
    return f'\n{users_json}'

def update_users(file, new_data):
    with open(file, 'a', newline='') as arquivo_csv:
        writer = csv.writer(arquivo_csv)
        writer.writerow(new_data)
    print('Usuario inserido com sucesso!')
    
def delete_users(name_user):
    file = 'STDW.csv'
    
    modified_lines = []
    user_found = False

    with open(file, 'r', newline='') as arquivo_csv:
        reader = csv.reader(arquivo_csv)
        for line in reader:
            if line[0] != name_user:
                modified_lines.append(line)
            else:
                user_found = True
    
        if user_found:
            with open(file, 'w', newline='') as arquivo_csv:
                writer = csv.writer(arquivo_csv)
                writer.writerows(modified_lines)
            print(f'Usuário {name_user} deletado com sucesso!')
        else:
            print(f'Usuário {name_user} não encontrado')

#Variables
while True:
    response = input('Digite uma das opções(1- Ver usuários /2- Atualizar Usuarios/ 3- Remover usuário/ 4- Sair): ')

    if response == '1':
        os.system('cls')
        print(get_usuarios())
        
    if response == '2':
        os.system('cls')
        file_name = 'STDW.csv'
        new_data = input('Digite o nome de Usuario: ').split(',')
        update_users(file_name, new_data)
        
    if response == '3':
        os.system('cls')
        delete = input('Digite o nome do usuario que desejas deletar: ')
        delete_users(delete)

    if response == '4':
        os.system('cls')
        break