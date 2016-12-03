/* catcord_2x1a.cpp */

#include <iostream>     // cout, endl
#include <fstream>      // fstream
#include <vector>
#include <string>
#include <algorithm>    // copy
#include <iterator>     // ostream_operator
#include <boost/tokenizer.hpp>
/* Richard Conover
 * 16-11-6 
 * A program to gobble CSV file to KML Coords
 */


int main()
{
    using namespace std;
    using namespace boost;
    string data("track_161107a.csv");

    ifstream in(data.c_str());
    if (!in.is_open()) return 1;

    typedef tokenizer< escaped_list_separator<char> > Tokenizer;
    vector< string > vec;
    string line;

    while (getline(in,line))
    {
        Tokenizer tok(line);
        vec.assign(tok.begin(),tok.end());
	cout << vec[2]<<','<< vec[1]<<','<< '0'<< endl;
    }
}








