#include <stdio.h>
#include <stdlib.h>

typedef struct celula
{
    int dado;
    struct celula *esq, *dir;
} celula;

celula *cria_abb(int x)
{
    celula *nova = malloc(sizeof(celula));
    nova->dado = x;
    nova->esq = nova->dir = NULL;
    return nova;
}

celula *insere(celula *raiz, int x)
{
    if (raiz == NULL)
        return cria_abb(x);

    if (x < raiz->dado)
    {
        // atribui o valor x para a raiz e ja volta para recursao a partir dela
        raiz->esq = insere(raiz->esq, x);
    }
    else if (x > raiz->dado)
    {
        raiz->dir = insere(raiz->dir, x);
    }
    return raiz;
}

celula *remove(celula* raiz, int x){
    //enquanto arvore nao for null
    if(raiz != NULL){
        
        //encontrando o caminho ate a raiz que vamos retirar
        if(x < raiz->dado){
            raiz->esq = remove(raiz->esq, x);
        }
        else if(x > raiz->dado){
            raiz->dir = remove(raiz->dir, x);
        }
        //encontramos, precisamos agora apagar ele
        else{
            //caso 0: se raiz nao tiver filho
            if(raiz->esq == NULL && raiz->dir == NULL){
                free(raiz);
                return NULL;
                
            }
            // primeiro caso: tem apenas um filho a esquerda ou a direita
            if(raiz->esq == NULL){
                celula *aux = raiz->dir;
                free(raiz);
                return aux;
            }
            else if(raiz->dir == NULL){
                celula *aux = raiz->esq;
                free(raiz);
                return aux;
            }
            //segundo caso, tem dois filhos, precisa escolher qual deve ficar na posicao?
            //caso do sucessor (dir) [1 passo dir, resto todo para esquerda ate null]
            //cria ponteiro auxiliar
            celula *aux = raiz->dir;
            while (aux->esq != NULL)
            {
                aux = aux->esq;
            }
            raiz->dado = aux->dado;
            raiz->dir = remove(raiz->dir, aux->dado);
            
            //caso do antecessor (esq) [1 passo esq, resto todo para direita ate null]
            celula *temp = raiz->esq;
            while (temp->dir != NULL)
            {
                temp = temp->dir;
            }
            raiz->dado = temp->dado;
            raiz->esq = remove(raiz->esq, temp->dado);
        }
        return raiz
    }
}