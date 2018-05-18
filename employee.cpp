#include <iostream>
using namespace std;

class Employee {
    public:
        string name;
        string getName() {
            return name;
        }
};

class Manager: public Employee {
    public:
        
};

class Salesman: public Employee {
    public:
        
};