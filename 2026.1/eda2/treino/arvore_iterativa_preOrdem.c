#include <stdio.h>
#include <stdlib.h>


//struct das celulas da arvore
typedef struct celula{
    int dado;
    struct celula *esq, *dir;
}celula;

//strcut dos nos da pilha
//no de pilha recebe no de arvore
typedef struct noPilha{
    struct noPilha *prox;
    struct celula *noArvore;
}noPilha;

//struct da pilha
//pilha recebe no de pilha
typedef struct pilha{
    noPilha *topo;
}pilha;

pilha *criaPilha(){
    pilha *novo = malloc((pilha) * sizeof(pilha));
    if (novo != NULL)
        novo->topo = NULL;
    return novo;
}

pilha *empilha(pilha *p, celula *no_de_Arvore){
    noPilha *novo= malloc(sizeof(noPilha));
    if(novo == NULL)
        return;
    novo->noArvore = no_de_Arvore;
    novo->prox = p->topo;
    p->topo = novo;
}

celula *desempilha(pilha *p){
    //cria um no temporario para o topo
    noPilha *aux = p->topo; 
    
    //cria uma celula nova para guardar a celula do topo
    celula *noArv = aux->noArvore;
    
    //atribui topo para NULL
    p->topo = aux->prox;
    
    //limpa memoria 
    free(aux);
    //retorna a celula requisitada
    return noArv;
}

void_preOrdemIterativa(celula *raiz){
    if(raiz == NULL)
        return;

    //cria a pilha para ir empilhando no caminho
    pilha *p = criaPilha();
    
    while(raiz != NULL || p->topo != NULL){
        if(raiz != NULL){
            printf("%d", raiz->dado);
            // empilha as da direita 
            if(raiz->dir != NULL){
                empilha(p,raiz->dir);

            }
        //e caminha pela esquerda ate chegar em NULL
        raiz = raiz->esq;
        }
        //se a esquerda for nula volta desempilhando
        else
            raiz = desempilha(p);
    }
}

