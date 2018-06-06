#include <iostream>
#include <stdio.h>

using namespace std;

string ids[50], rented[50], years[50], types[50], models[50];
int vehicles = 0;
int position = 0;
int maxPosition = 50;
int i, j, k;

/**
 * Adiciona um veiculo aos arrays com os dados passados.
 *
 * @param Id do veiculo
 * @param Ano do veiculo
 * @param Tipo do veiculo
 * @param Modelo do veiculo
*/
void addVehicle(string id, string year, string type, string model) {
    ids[vehicles] = id;
    rented[vehicles] = "Disponível";
    years[vehicles] = year;
    types[vehicles] = type;
    models[vehicles] = model;
    vehicles++;
}

/**
 * Procura um veiculo a partir de seu id.
 *
 * @param Id do veiculo
 * @return Indice do veiculo
 */
int searchVehicle(string id){
    for(i = 0; i < vehicles; i++){
        if(id == ids[i]){
            return i;
        }
    }
    return -1;
}

/**
 * Remove um veiculo dos arrays a partir de seu id, usando
 * o metodo searchVehicle(id).
 *
 * @param Id do veiculo
 */
void removeVehicle(string id){
    position = searchVehicle(id);
    if(position != -1){
        for(j = position; j < maxPosition - 1; j++){
            ids[j] = ids[j + 1];
            rented[j] = rented[j + 1];
            years[j] = years[j + 1];
            types[j] = types[j + 1];
            models[j] = models[j + 1];
        }
        vehicles--;
    }else{
        cout << "Veiculo não encontrado!" << endl;
    }
    
}

/**
 * Mostra informacoes de um veiculo a partir de seu id, usando
 * o metodo searchVehicle(id).
 *
 * @param Id do veiculo
 */
void viewVehicle(string id){
    position = searchVehicle(id);
    cout << " " << endl;
    cout << "Visualização: " << endl;
    cout << " " << endl;
    cout << "Id: " << ids[position] << endl;
    cout << "Situação: " << rented[position] << endl;
    cout << "Ano de fabricação: " << years[position] << endl;
    cout << "Tipo: " << types[position] << endl;
    cout << "Modelo: " << models[position] << endl;
    cout << " " << endl;
}

/**
 * Mostra a disponibilidade de um veiculo a partir de seu id, usando
 * o metodo searchVehicle(id).
 *
 * @param Id do veiculo
 * @return Disponibilidade do veiculo
 */
string returnState(string id){
    position = searchVehicle(id);
    return rented[position];
}

/**
 * Atualiza o estado de um veiculo a partir de seu id, usando
 * o metodo searchVehicle(id).
 *
 * @param Id do veiculo
 * @param Novo estado do veiculo
 */
void updateVehicle(string id, string state){
    position = searchVehicle(id);
    rented[position] = state;
}

/**
 * Mostra todos os veiculos do inventario, caso tenha,
 * e seus dados.
 */
void viewAll(){
    if(vehicles == 0){
        cout << "O inventário está vazio." << endl;
    } else {
        cout << " " << endl;
        cout << "Inventário: " << endl;
        cout << " " << endl;
        for(k = 0; k < vehicles; k++){
            cout << "Id: "<< ids[k] << " / Situação: " <<  rented[k] << " / Ano: " << years[k] << " / Tipo: " << types[k] << " / Modelo: " << models[k] << endl;
        }
        cout << " " << endl;
    }
}

/**
 * Realiza a locação de um veículo. Muda o estado se o veículo estiver disponivel.
 *
 */

void veichileRental(string id){
    position = searchVehicle(id);
    if (strcmp (rented[position], "Disponível") == 0) {
        rented[position] = "Indisponível";
    }else{
        cout << "O veículo está indisponível para locação" << endl;
    }
}

/**
 * Recebe o veículo e o torna disponível para locação.
 *
 */

void receiveVehicles(string id){
    position = searchVehicle(id);
    if (position != -1) {
        rented[position] = "Disponível";
    }else{
        cout << "O veículo a ser devolvido não está em nossa base de dados." << endl;
    }
    
}



