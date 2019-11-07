#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

float max_value(vector <float>);
vector<float> readFile(string);

int main()
{
    vector<float> lista;
    string nameFile;
    cout << "Input the name of the file that contains the numbers ordered from lowest to highest, please. " <<endl;
    cin >> nameFile;
    lista = readFile("test.txt");
    cout << "The max value is: " << max_value(lista) <<endl;

    return 0;
}

float max_value(vector <float> lista)
{
    return lista.at(lista.size()-1);
}

vector<float> readFile(string filename)
{
    ifstream myFile(filename);
    float x = 0;
    vector<float> lista;
    cout << "reading" <<endl;
    if(!myFile)
    {
    	cout << "Error al abrir el archivo, intenta ingresar el nombre correcto." << endl;
    	exit(1);
    }
    while (myFile >> x)
    {
        lista.push_back(x);
    }
    myFile.close();

    return lista;
}