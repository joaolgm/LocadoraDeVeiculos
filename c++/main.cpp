#include <iostream>
#include <stdio.h>
#include "inventory.cpp"

using namespace std;

int main(){
    
    int option = 0;
    int vehicles = 0;
    int MAXVEHICLES = 50; 
    string id, year, type, model, state;
    
    cout << "Bem vindo!" << endl;
    
    do{
        cout << "Selecione uma das opções abaixo:" << endl;
        cout << "1 - Adicionar veículo ao inventário." << endl;
        cout << "2 - Remover veículo ao inventário." << endl;
        cout << "3 - Visualizar veículo do inventário." << endl;
        cout << "4 - Atualizar veículo do inventário." << endl;
        cout << "5 - Listar todos os veículos do inventário." << endl;
        cout << "6 - Realizar Locação de Veículo." << endl;
        cout << "7 - Recebimento de Veiculo." << endl;
        cout << "8 - Sair" << endl;

        cin >> option;

        switch (option){
            case 1:
                if (vehicles > MAXVEHICLES) {
                    cout << "O inventário está cheio." << endl;
                } else {
                    cout << "Digite o id do veículo a ser adicionado:" << endl;
                    cin >> id;
                    cout << "Digite o ano de fabricação do veículo a ser adicionado:" << endl;
                    cin >> year;
                    cout << "Digite o tipo do veículo a ser adicionado:" << endl;
                    cin >> type;
                    cout << "Digite o modelo do veículo a ser adicionado:" << endl;
                    cin >> model;
                    addVehicle(id, year, type, model);
                    vehicles++;
                }
                break;
            case 2:
                if(vehicles == 0){
                    cout << "O inventário está vazio." << endl;
                } else {
                    cout << "Digite o id do veículo a ser removido:" << endl;
                    cin >> id;
                    removeVehicle(id);
                    vehicles--;
                }
                break;
            case 3:
                cout << "Digite o id do veículo a ser visualizado:" << endl;
                cin >> id;
                viewVehicle(id);
                break;
            case 4:
                cout << "Digite o id do veículo a ser atualizado:" << endl;
                cin >> id;
                cout << "O estado atual do veículo é: " << returnState(id) << endl;
                cout << "O novo estado do veículo deve ser:" << endl;
                cin >> state;
                updateVehicle(id, state);
                break;
            case 5:
                viewAll();
                break;
            case 6:
                cout << "Digite o id do veículo a ser locado:" << endl;
                cin >> id;
                veichileRental(id);
            case 7:
                cout << "Digite o id do veículo a ser recebido:" << endl;
                cin >> id;
                receiveVehicles(id);
        }
    
    } while(option != 8);
}
