//Daniel Pelagio Vázquez A01227873 

#include <iostream>
#include <vector>
#include <fstream>
#include <string>

using namespace std;

float Union2D(vector<vector<float> > , int );
vector<vector<float> > readFile(string);

int main()
{
    vector<vector<float> > lista = readFile("text.txt");
    Union2D(lista, 0);
    return 0;
}

float Union2D(vector<vector<float> > lista, int referencia)
{
    vector<vector<float> > listaOrd;
    float answer = 0;
    cout << "begin" <<endl;
    while(lista.size() > 0)
    {
        float mayor = lista[0][1];
        int index = 0;
        for(int i = 0; i < lista.size(); i++)
        {
            if(lista[i][1] > mayor)
            {
                mayor = lista[i][1];
                index = i;
            }
        }
        listaOrd.push_back(lista[index]);
        lista.erase(lista.begin() + index);
    }

    for(int i = 0; i < listaOrd.size();i++)
    {
        for(int j = 0; j < 2; j++)
        {
            cout << listaOrd[i][j] << " ";
        }
        cout << endl;
    }

    float maxX = listaOrd[0][0];
    answer += listaOrd[0][1] * listaOrd[0][0];

    cout << "begin" <<endl;
    for(int i = 0; i < listaOrd.size()-1; i++)
    {
        if(listaOrd[i + 1][0] > maxX)
        { 
            answer += (listaOrd[i + 1][0] - maxX) * listaOrd[i + 1][1]; //sumar el area del siguiente rectangulo
            maxX = listaOrd[i + 1][0];
        }
    }

    cout << "A= " << answer <<endl;

    return answer;
}

vector<vector<float> > readFile(string filename)
{
    ifstream myFile(filename);
    float x, y = 0;
    vector<vector<float> > lista;
    cout << "reading" <<endl;
    if(!myFile)
    {
    	cout << "Error al abrir el archivo, intenta ingresar el nombre correcto." << endl;
    	exit(1);
    }
    while (myFile >> x >> y )
    {
        vector <float> tempVec;
        tempVec.push_back(x);
        tempVec.push_back(y);
        lista.push_back(tempVec);
    }
    myFile.close();

    return lista;
}