// Daniel Pelagio Vazquez A01227873
#include<stdio.h>
#include<string.h>

/*
E -> TE'
E' -> +TE' | -TE' | EMPTY
T -> FT'
T' -> *FT' | /FT' | EMPTY
F -> (E) | sqrt(E) | (E)^id | id

*/

void E();
void T();
void Ep();
void Tp();
void F();

char input[100];
char new_input[100];
int i = 0, error = 0;

int main()
{
    while (1)
    {
        printf("Enter the input, please! \n");
        fgets(new_input, sizeof(new_input), stdin);
        for (int x = 0; x < sizeof(new_input); x++)
        {
            if (new_input[x] == '\n')
            {
                break;
            }
            else
            {
                input[x] = new_input[x];
            }
        }

        //E is start symbol
        E();
        printf("Size : %d\n",i);

        if ((i == strlen(input)) && (error == 0))
        {
            printf("Correct\n");
        }
        else
        {
            printf("Incorrect\n");
        }
    }    
}

// Rule 1
void E()
{
    T();
    Ep();
}

//Rule 3
void T()
{
    F();
    Tp();
}

//Rule 2
void Ep()
{
    if(input[i] == '+' || input[i] == '-')
    {
        i++;
        T();
        Ep();
    }
}

//Rule 4
void Tp()
{
    if (input[i] == '*' || input[i] == '/')
    {
        i++;
        F();
        Tp();
    }
}

//Rule 5
void F()
{
    if (input[i] == '(')
    {
        i++;
        E();
        if (input[i] == ')')
        {
            i++;
        }  
        else
        {
            error++;
        }
        
    }
    else if(input[i] == 'i')
    {
        i++;
    }
    else
    {
        error++;
    }
}