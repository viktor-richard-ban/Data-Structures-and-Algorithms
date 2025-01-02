#include <iostream>

using namespace std;

template<class T>
struct ArrayList {
private:
    T* items;
    int index;
    int capacity;
    
public:
    ArrayList() {
        cout << "ArrayList has been initiated" << endl;
        index = 0;
        capacity = 2;
        items = new T[capacity];
    }
    
    ~ArrayList() {
        delete items;
    }
    
    void append(T item) {
        cout << "Append:" << item << " to: "  << index << endl;
        
        if (index == capacity - 1) {
            cout << "Capacity has been reached" << endl;
            resize();
        }
        
        items[index] = item;
        index += 1;
    }
    
    T operator[](int i) {
        if (i < 0 || i >= index) {
            throw "Index out of range...";
        }
        return items[i];
    }
    
    int length() {
        return index;
    }
    
private:
    void resize() {
        capacity *= 2;
        T* newItems = new T[capacity];
        for (int i = 0; i < index; i++) {
            newItems[i] = items[i];
        }
        delete items;
        items = newItems;
    }
};

int main()
{
    ArrayList<int> a;
    a.append(1);
    a.append(2);
    a.append(3);
    a.append(4);
    a.append(5);
    
    cout << "Current length: " << a.length() << endl;
    
    cout << "Value of the 3rd item: " << a[2] << endl;
}

/*
 Result of this code:
 
 ArrayList has been initiated
 Append:1 to: 0
 Append:2 to: 1
 Capacity has been reached
 Append:3 to: 2
 Append:4 to: 3
 Capacity has been reached
 Append:5 to: 4
 Current length: 5
 Value of the 3rd item: 3
 */
