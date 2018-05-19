#include <iostream>
using namespace std;


class Vehicle {
    public:
        string id, rented, type, year, model;   
        Vehicle(string id_, string rented_, string type_, string year_, string model_) {
            id = id_;
            rented = rented_;
            type = type_;
            year = year_;
            model = model_;
        }
        void setRented(string rented_) {
            rented = rented_;
        }
        string getId(void) {
            return id;
        }
        string getRented(void) {
            return rented;
        }
        string getType(void) {
            return type;
        }
        string getYear(void) {
            return year;
        }
        string getModel(void) {
            return model;
        }

};
