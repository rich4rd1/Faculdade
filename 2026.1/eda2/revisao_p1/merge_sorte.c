#include <stdio.h>
#include <stdlib.h>

int intercala(int *v, int e, int m, int d){
    int *vetor_auxiliar = malloc((d- e + 1) * sizeof(int)); // criacao de um vetor auxiliar
    int i = e;
    int j = m + 1;
    int k = 0;
    
    //percorrer os dois lados do vetor 
    while(i <= m && j <= d){
        //compara, qual dos dois, i ou j, que tem o menor valor e copia para o vetor auxiliar
        if(v[i] <= v[j]){
            vetor_auxiliar[k] = v[i];
            i++;
        }
        else{
            vetor_auxiliar[k] = v[j];
            j++;
        }
        k++;
    }
        //um dos lados terminara antes, por seguraca copiamos aqui fora o que sobrar
        while(i <= m){
            vetor_auxiliar[k] = v[i];
            i++; //percorre ate chegar no final
            k++;
        }
        while(j <= d){
            vetor_auxiliar[k] = v[j];
            j++;
            k++;
        }
        // copiamos o vetor auxiliar no vetor original, subtraindo i por e, para dar a posicao correta de cada elemento
        for(int i = e; i <= d; i++){
            v[i] = vetor_auxiliar[i - e];
        }
        free(vetor_auxiliar);
}

int merge_sort(int *v, int e, int d){
    //verificar se a esquerda eh maior que a direita para dividir
    if(e < d){
        int m = (e+d)/2;
        merge_sort(v, e, m);
        merge_sort(v,m+1, d);
        intercala(v, e, m, d);

    }
    
    
}