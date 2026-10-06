#include <stdio.h>
#include <stdlib.h>

typedef struct no
{
    int valor;
    struct no *prox;
} no;

typedef struct Pilha
{
    no *topo;
} Pilha;

Pilha *cria_pilha()
{
    Pilha *p = malloc(sizeof(Pilha));
    p->topo = NULL;
    return p;
}

void empilha(Pilha *p, int valor)
{
    no *novo = malloc(sizeof(no));
    novo->valor = valor;
    novo->prox = p->topo;
    p->topo = novo;
}

int desempilha(Pilha *p){
    if (p->topo == NULL)
        return -1;
   
    no *temp = p->topo;
    int valor = temp->valor;
    p->topo = temp->prox;
    free(temp);
    return valor;
}

