#include <stdio.h>
#include <stdlib.h>

#define MAX 100
int inicio = 0;
int fim = 0;

void cria_fila(int vet[])
{
    inicio = 0;
    fim = 0;
}

int vazia()
{
    return inicio == fim;
}

int cheia()
{
    return fim == MAX;
}

void enfileira(int vet[], int valor)
{
    if (cheia())
    {
        printf("fila cheia");
        return -1;
    }
    vet[fim++] = valor;
}

int desenfileira(int vet[])
{
    if(vazia()){
        printf("fila vazia");
        return -1;
    }
    return vet[inicio++];
}