#include <iostream>
using namespace std;


class Car {
    public:
        int id, year;
        string brand;   
        Car(string brands, int years, int iden) {
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
    Car car("lamborghini", 2010, 246);
    cout << car.getBrand() << " de " << car.getYear() << ": " << car.getId() << endl;
    return 0;
}