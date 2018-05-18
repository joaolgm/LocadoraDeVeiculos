#include <iostream>
using namespace std;


class Vehicle {
    public:
        string id, year, brand;   
        Vehicle(string brands, string years, string iden) {
            brand = brands;
            year = years;
            id = iden;
        }
        void setYear(string years) {
            year = years;
        }  
        void setId(string iden) {
            id = iden;
        }
        void setBrand(string brands) {
            brand = brands;
        }
        string getBrand(void) {
            return brand;
        }
        string getYear(void) {
            return year;
        }
        string getId(void) {
            return id;
        }
};

int main() {
    Vehicle vehicle1("lamborghini", "2010", "246");
    cout << vehicle1.getBrand() << " de " << vehicle1.getYear() << ": " << vehicle1.getId() << endl;
    return 0;
}