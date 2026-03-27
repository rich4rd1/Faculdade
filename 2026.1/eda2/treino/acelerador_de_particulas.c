#include <stdio.h>
#include <math.h>

/*
1 emissor
3 sensores (1 2 3)
particula sai do emissor e da muitas voltas
particula sai do acelerador por uma das saidas atingindo um dos sensores
graduacao de 1km
do emissor para o sensor 3 tem 3km
circuferencia do acelerador eh de 8 km
*/

/*
dados
distancia total em km percorrida por uma particula, do emiisor ate o sensor
programa deve: determinar qual sensor foi atingido pela particula
se a distancia for 2 a particula atinge o sensor 2
*/

/*
entrada D, sendo D distancia

*/

int main(int argc, char const *argv[])
{
    // distancia
    int D;
    scanf("%d", &D);

    int posicao_no_acelerador = (D - 3) % 8;
    if (posicao_no_acelerador == 3) printf("1\n");
    if (posicao_no_acelerador == 4) printf("2\n");
    if (posicao_no_acelerador == 5) printf("3\n");
    return 0;
}
