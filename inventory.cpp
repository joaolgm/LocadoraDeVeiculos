#include <iostream>
#include <stdio.h>

using namespace std;

string ids[50], rented[50], years[50], types[50], models[50];
int vehicles = 0;
int position = 0;
int maxPosition = 50;
int i, j, k;

void addVehicle(string id, string year, string type, string model) {
    ids[vehicles] = id;
    rented[vehicles] = "Disponível";
    years[vehicles] = year;
    types[vehicles] = type;
    models[vehicles] = model;
    vehicles++;
}

int searchVehicle(string id){
    for(i = 0; i < vehicles; i++){
   		if(id == ids[i]){
               return i;
        }
   	}
}

void removeVehicle(string id){
    position = searchVehicle(id);
    for(j = position; i < maxPosition - 1; i++){
   		ids[j] = ids[j + 1];
        rented[j] = rented[j + 1];
        years[j] = years[j + 1];
        types[j] = types[j + 1];
        models[j] = models[j + 1];
   	}
    vehicles--;
}

void viewVehicle(string id){
    position = searchVehicle(id);
    printf("Id: %s \n", ids[position]);
    printf("Alugado: %s \n", rented[position]);
    printf("Ano de fabricação: %s \n", years[position]);
    printf("Tipo: %s \n", types[position]);
    printf("Modelo: %s \n", models[position]);
} 

string returnState(string id){
    position = searchVehicle(id);
    return rented[position];
}

void updateVehicle(string id, string state){
    position = searchVehicle(id);
    rented[position] = state;
}

void viewAll(){
    if(vehicles == 0){
        printf("O inventário está vazio.\n");
    } else {
        for(k = 0; k < vehicles; k++){
            printf("Id: %s / Situação: %s / Ano: %s / Tipo: %s / Modelo: %s \n", ids[k], rented[k], years[k], types[k], models[k]);
        }
    }
}

