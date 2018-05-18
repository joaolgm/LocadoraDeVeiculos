#include <iostream>
using namespace std;


class Vehicle {
    public:
        int id, year;
        string brand;   
        Vehicle(string brands, int years, int iden) {
            brand = brands;
            year = years;
            id = iden;
        }
        void setYear(int years) {
            year = years;
        }  
        void setId(int iden) {
            id = iden;
        }
        void setBrand(string brands) {
            brand = brands;
        }
        string getBrand(void) {
            return brand;
        }
        int getYear(void) {
            return year;
        }
        int getId(void) {
            return id;
        }
};

int main() {
    Vehicle vehicle1("lamborghini", 2010, 246);
    cout << vehicle1.getBrand() << " de " << vehicle1.getYear() << ": " << vehicle1.getId() << endl;
    return 0;
}