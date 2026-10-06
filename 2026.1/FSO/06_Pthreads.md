# Questões de Revisão — Módulo 6: Pthreads

## Parte 1 — POSIX Threads

### 1. Pthreads
O que é **Pthreads** e qual é o objetivo da padronização POSIX apresentada no módulo?

### 2. Implementação
A implementação de Pthreads pode variar entre sistemas operacionais. O que a padronização procura garantir apesar disso?

---

## Parte 2 — Criação e término

### 3. pthread_create
Explique a finalidade da função:

```c
pthread_create(...)
```

Quais são os papéis principais de seus argumentos?

### 4. Função de início
Por que `pthread_create` recebe uma função como argumento? O que essa função representa para a nova thread?

### 5. Argumentos
Como uma thread pode receber dados da thread que a criou?

Explique o papel do argumento `arg`.

### 6. Término
Liste as situações apresentadas no módulo que podem causar o término de uma thread.

### 7. Retorno
O que acontece quando a função passada para `pthread_create` retorna?

---

## Parte 3 — pthread_join

### 8. Finalidade
Para que serve `pthread_join`?

### 9. Garantia
O que podemos afirmar sobre a thread aguardada depois que `pthread_join` retorna com sucesso?

### 10. Retorno da thread
Qual é a finalidade do argumento `retval` de `pthread_join`?

### 11. Situação
Uma thread principal cria cinco threads trabalhadoras e imediatamente termina sua função `main`.

Explique por que o comportamento do programa pode ser diferente de simplesmente "as cinco threads continuam executando normalmente", considerando as regras de término apresentadas no módulo.

---

## Parte 4 — Mutex

### 12. Operações
Explique a finalidade das operações:

- `pthread_mutex_init`;
- `pthread_mutex_lock`;
- `pthread_mutex_trylock`;
- `pthread_mutex_unlock`;
- `pthread_mutex_destroy`.

### 13. Situação
Duas threads incrementam uma variável global milhões de vezes.

Explique por que um mutex pode ser necessário e em que trecho ele deve proteger a operação compartilhada.

### 14. Lock x trylock
Qual é a diferença conceitual entre tentar adquirir um mutex com `lock` e com `trylock`?

---

## Parte 5 — Variáveis de condição

### 15. pthread_cond_wait
Qual é a finalidade de `pthread_cond_wait`?

### 16. Mutex + condição
Por que a thread precisa possuir o mutex antes de chamar `pthread_cond_wait`?

O que acontece com o mutex enquanto ela espera?

### 17. Signal x Broadcast
Qual é a diferença entre:
- `pthread_cond_signal`;
- `pthread_cond_broadcast`?

### 18. Situação
Três threads estão esperando pela mesma condição.

O que pode acontecer quando uma thread executa `pthread_cond_signal`? E quando executa `pthread_cond_broadcast`?

---

## Questão estilo prova

### 19. Ordem de execução
Considere:

```text
Thread principal:
    cria T1
    cria T2
    imprime "fim"

T1:
    imprime "A"

T2:
    imprime "B"
```

É possível afirmar que a saída será sempre:

```text
A
B
fim
```

? Justifique.

Depois explique como `pthread_join` poderia ser usado para estabelecer uma ordem de término/espera.

### 20. Região crítica com pthread_mutex
Considere:

```text
contador = contador + 1;
```

Duas threads executam essa operação milhares de vezes.

Explique o problema e mostre, em pseudocódigo, onde o `lock` e o `unlock` deveriam aparecer.

### 21. Condição
Uma thread precisa esperar até que uma estrutura de dados fique disponível.

Explique por que utilizar `pthread_cond_wait` pode ser mais apropriado do que manter a thread em um laço de espera ocupada.

### 22. Verdadeiro ou falso — justifique

a) "`pthread_join` cria uma nova thread."

b) "Depois de um `pthread_join` bem-sucedido, a thread aguardada terminou."

c) "Duas threads podem compartilhar variáveis globais."

d) "`pthread_mutex_lock` serve para proteger uma região crítica."

e) "`pthread_cond_wait` é uma forma de esperar por uma condição."

f) "`pthread_cond_broadcast` desbloqueia apenas uma das threads que esperam a condição."
