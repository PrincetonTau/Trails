// basic file operations
#include <iostream>
#include <fstream>
using namespace std;



int MoreFile () {
  string line;
  ifstream myfile ("4100517997d29000_1028_SAMT0_20.txt");
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
      cout << line << '\n';
    }
    myfile.close();
  }

  else cout << "Unable to open file"; 

  return 0;
}





int main () {
  ofstream myfile;
  myfile.open ("example.txt");
  myfile << "Writing this to a file.\n";
  myfile << "Writing this to a file.\n";
  myfile << "Writing this to a file.\n";
  myfile << "Writing this to a file.\n";
  myfile << "Writing this to a file.\n";


  myfile.close();
  
  MoreFile();
  return 0;
}








