#include <iostream>
#include <vehicle.cpp>

using namespace std;

class Concesionaria {
    public:
        Vehicle vehicles[100];
        int qtdVehicles = 0;
        void registerVehicle(Vehicle vehicle) {
            vehicles[qtdVehicles] = vehicle;
            qtdVehicles++;
        }

        void updateVehicle(int id, string field) {
            Vehicle vehicle = getById(id);
            if(vehicle != nullptr) { //como usa null?
                if(tolower(field) == "brand") {
                    vehicle.setBrand;
                }
            }
        }

        Vehicle getById(int id) {
            for(int i=0;i<qtdVehicles;i++) {
                if(vehicles[i].getId() == id) {
                    return vehicles[i];
                }
            }
        }
};