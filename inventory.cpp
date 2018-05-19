#include <iostream>
#include <vehicle.cpp>

using namespace std;

class Inventory {
    
    public:
        
        Vehicle vehicles[100];
        int qtdVehicles = 0;
        
        void addVehicle(string id, string rented, string type, string year, string model) {
            vehicle = new Vehicle(id, rented, type, year, model);
            registerVehicle(vehicle);
        }

        void registerVehicle(Vehicle vehicle) {
            vehicles[qtdVehicles] = vehicle;
            qtdVehicles++;
        }

        void viewVehicle() {

        }

        void removeVehicle() {

        }

        void updateVehicle() {

        }

        void listAll() {

        }

};