#include <iostream>
#include <vehicle.cpp>

using namespace std;

class Inventory {
    
    public:
        
        Vehicle vehicles[100];
        int qtdVehicles = 0;
        
        void registerVehicle(Vehicle vehicle) {
            vehicles[qtdVehicles] = vehicle;
            qtdVehicles++;
        }

        void addVehicle() {
            
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