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

        void updateVehicle(string id, string field, string data) {
            Vehicle vehicle = getById(id);
            if(vehicle != nullptr) {                     //como usa null?
                if(tolower(field) == "brand") {          //tolower?
                    vehicle.setBrand(data);
                } else if(tolower(field) == "year") {    //tolower?
                    vehicle.setYear(data);
                }
            }
        }

        Vehicle getById(string id) {
            for(int i=0;i<qtdVehicles;i++) {
                if(vehicles[i].getId() == id) {
                    return vehicles[i];
                }
            }
        }
};