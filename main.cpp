#include <iostream>
#include <stdio.h>
#include "inventory.cpp"

using namespace std;

int main(){
    
    int option = 0;
    int vehicles = 0;
    int MAXVEHICLES = 50; 
    string id, year, type, model, state;
    
    printf("Bem vindo!\n");
    printf("Selecione uma das opções abaixo:\n");
    printf("1 - Adicionar veículo ao inventário.\n");
    printf("2 - Remover veículo ao inventário.\n");
    printf("3 - Visualizar veículo do inventário.\n");
    printf("4 - Atualizar veículo do inventário.\n");
    printf("5 - Listar todos os veículos do inventário.\n");
    
    scanf("%d",&option);

    switch (option){
        case 1:
            if (vehicles > MAXVEHICLES) {
                printf("O inventário está cheio.\n");
            } else {
                printf("Digite o id do veículo a ser adicionado:\n");
                scanf("%s",&id);
                printf("Digite o ano de fabricação do veículo a ser adicionado:\n");
                scanf("%s",&year);
                printf("Digite o tipo do veículo a ser adicionado:\n");
                scanf("%s",&type);
                printf("Digite o modelo do veículo a ser adicionado:\n");
                scanf("%s",&model);
                addVehicle(id, year, type, model);
                vehicles++;
            }           
            break;
        case 2:
            if(vehicles == 0){
                printf("O inventário está vazio.\n");
            } else {
                printf("Digite o id do veículo a ser removido:\n");
                scanf("%s",&id);
                removeVehicle(id);
                vehicles--;
            }           
            break;
        case 3:            
            printf("Digite o id do veículo a ser visualizado:\n");
            scanf("%s",&id);
            viewVehicle(id);
            break;
        case 4:            
            printf("Digite o id do veículo a ser atualizado:\n");
            scanf("%s",&id);
            printf("O estado atual do veículo é %s \n", returnState(id));
            printf("O novo estado do veículo deve ser:\n");
            scanf("%s",&state);
            updateVehicle(id, state);
            break;
        case 5:            
            viewAll();
            break;
    }


}
