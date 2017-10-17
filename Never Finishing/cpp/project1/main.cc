#include <iostream>
using namespace std;

int main(){
  int choice;

  cout<<"Welcome to Quicky Mart! \n What would you like to buy? ";

  cin>>choice;

  return 0;
}

void menu() {
  cout<<"1. Candy Bar -- $1.00"<<endl;
  cout<<"2. Pop       -- $1.50"<<endl;
  cout<<"3. Chips     -- $0.50"<<endl;
}
