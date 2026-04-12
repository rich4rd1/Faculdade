#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int topo = -1;

void cria_lista(int pilha[])
{
    topo = -1;
}

int vazia()
{
    return topo == -1;
}

int cheia()
{
    return topo == MAX - 1;
}

void empilha(int pilha[], int valor)
{
    if (cheia())
    {
        printf("pilha cheia!");
        return;
    }
    pilha[++topo] = valor;
}

int desempilha(int pilha[]){
    if(vazia()){
        printf("pilha vazia");
        return -1;
    }
    return pilha[topo--];
}

int espia(int pilha[]){
    if(vazia)
        return -1;
    
    return pilha[topo];

}