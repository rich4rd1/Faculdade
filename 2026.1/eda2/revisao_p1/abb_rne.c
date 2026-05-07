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

celula *busca(celula *raiz, int x){
    if(raiz != NULL){
        if (x < raiz->dado){
            raiz->esq = busca(raiz->esq, x);
        }
        else if(x > raiz->dado){
            raiz ->dir = (raiz->dir, x);
        }
    }
    return raiz;
}

int ehVermelho(celula *no){
    if(no != NULL)
        return no->cor = VERMELHO;
    else return 0;
}

int ehPreto(celula *no){
    if(no != NULL)
        return no->cor = PRETO;
        else return 1;
}

celula *rotacaoEsq(celula *a){
    //direita de a
    celula *b = a->dir;
    //esquerda de b
    celula *c = b->esq;
    b->cor = a->cor;
    a->cor = VERMELHO;
    a->dir = c;
    b->esq = a;
    return b;
}

celula *rotacaoDir(celula *a){
    // esquerda de A
    celula *filhoEsquerdoA = a->esq;
    //neto direito de A
    celula *netoDireito = filhoEsquerdoA->dir;
    //filho passa a ser preto
    filhoEsquerdoA->cor = a->cor;
    //pai (que vai virar filho dir) passa a ser vermelho
    a->cor = VERMELHO;

    a->esq = netoDireito;
    filhoEsquerdoA->dir = a;
    return filhoEsquerdoA;
}

void trocaCor(celula *raiz){
    raiz->cor = VERMELHO;
    raiz->esq->cor = raiz->dir->cor = PRETO;
}

celula *insere_rne(celula *raiz, int x){
    if(raiz == NULL){
        celula *novo = malloc(sizeof(celula));
        novo->dado = x;
        novo->esq = novo->dir = NULL;
        novo->cor = VERMELHO;
        return novo;
    }    
    
    
    if(raiz != NULL){
        if (x < raiz->dado){
            raiz->esq = insere_rne(raiz->esq, x);
        }
        else if(x > raiz->dado){
            raiz -> dir = insere_rne(raiz->dir, x);
        }
    }
    //caso 1 no a esqueda preto e o da direita vermelho
    if(ehVermelho(raiz->dir) && ehPreto(raiz->esq))
        raiz = rotacaoEsq(raiz);

    //caso 2 , dois nos vermelhos concecutivos
    if(ehVermelho(raiz->esq) && ehVermelho(raiz->esq->esq))
        raiz = rotacaoDir(raiz);
    
    //caso 3 , se ambos os filhos forem vermelhos
    if(ehVermelho(raiz->esq) && ehVermelho(raiz->dir))
        trocaCor(raiz);

    return raiz;
}   
