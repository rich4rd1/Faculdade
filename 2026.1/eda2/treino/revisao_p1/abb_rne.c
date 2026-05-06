#include <stdio.h>
#include <stdlib.h>

enum cor {VERMELHO, PRETO};

typedef struct celula{
    enum cor cor;
    int dado; 
    struct celula *esq;
    struct celula *dir;
}celula;

celula *cria_abb(int x){
    celula *raiz = malloc(sizeof(celula));
    raiz->dado = x;
    raiz->esq = raiz->dir = NULL;
    raiz->cor = PRETO;
    return raiz;
}

//insercao 


