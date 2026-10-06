#include <stdio.h>

int insertion_sort(int *v, int n){
    int i,j, aux;
    for (j = 1 ; j < n; j++){
        aux = v[j];
        i = j;
        while (i > 0 && v[i-1] > aux)
        {
            v[i] = v[i - 1];
            i--;
        }
        v[i] = aux;
    }

}

int main()
{
    int vet[4] = {30, 20, 40, 10};
    insertion_sort(vet,0);

    
    for (int k = 0; k < 4; k++)
    {
        printf("[%d]", vet[k]);
    }
}


