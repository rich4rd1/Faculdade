#include <stdio.h>
#include <stdlib.h>

typedef struct no
{
    struct no *prox;
    int valor;
} no;

typedef struct Fila
{
    no *fim;
    no *inicio;
} Fila;

Fila *criar_fila()
{
    Fila *f = malloc(sizeof(Fila));
    f->inicio = NULL;
    f->fim = NULL;
    return f;
}

void enfileira(Fila *f, int valor)
{
    no *novo_no = malloc(sizeof(no));
    novo_no->valor = valor;
    novo_no->prox = NULL;

    if (f->fim == NULL)
    {
        f->inicio = novo_no;
        f->fim = novo_no;
    }
    else
    {
        f->fim->prox = novo_no;
        f->fim = novo_no;
    }
}

int desenfileira(Fila *f){
    if(f->inicio == NULL)
        return -1;
    
    no *temp = f->inicio;
    int valor = temp->valor;

    f->inicio = f->inicio->prox;

    if(f->inicio == NULL)
        f->fim == NULL;
    
    free(temp);

    return valor;
}