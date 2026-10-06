# Questões de Revisão — Módulo 4: Comunicação entre Threads

## Parte 1 — Exclusão mútua

### 1. Condição de corrida
Explique por que uma condição de corrida pode ocorrer quando processos/threads acessam dados compartilhados.

### 2. Região crítica
Defina **região crítica** e explique por que ela deve ser protegida.

### 3. Requisitos
Segundo o módulo, quais características uma boa solução de exclusão mútua deve garantir?

### 4. Variável de impedimento
Explique a ideia da variável de impedimento e por que uma implementação simples dela ainda pode apresentar uma condição de corrida.

---

## Parte 2 — Espera ocupada e hardware

### 5. Busy waiting
O que é **espera ocupada**? Qual é o problema de deixar uma thread em um laço esperando enquanto ela poderia estar bloqueada?

### 6. Inibir interrupções
Como inibir interrupções pode impedir acesso concorrente à região crítica?

Por que essa técnica é adequada principalmente ao modo kernel?

### 7. TSL
Explique o funcionamento da instrução **TSL/Test-and-Set** e por que a atomicidade é importante.

### 8. Prioridade invertida
Explique o cenário de **inversão de prioridade** apresentado no módulo quando uma thread de baixa prioridade está na região crítica e uma thread de alta prioridade fica esperando.

---

## Parte 3 — Dormir/acordar e produtor-consumidor

### 9. Sleep/Wakeup
Qual é a finalidade das primitivas de dormir e acordar? Qual vantagem elas possuem em relação à espera ocupada?

### 10. Produtor-Consumidor
Explique o problema do **Produtor-Consumidor** considerando um buffer limitado.

O que acontece quando:
- o buffer está cheio;
- o buffer está vazio?

### 11. Problema de sincronização
Por que uma implementação ingênua usando `sleep` e `wakeup` pode falhar devido a uma troca de contexto?

Explique o problema em termos de ordem dos eventos.

---

## Parte 4 — Semáforos

### 12. Conceito
O que é um semáforo e qual é a ideia de utilizá-lo como contador de sinais?

### 13. Down/P e Up/V
Explique detalhadamente:

- `down(P)`;
- `up(V)`.

O que acontece quando o valor do semáforo é zero?

### 14. Atomicidade
Por que as operações de um semáforo precisam ser atômicas?

### 15. Produtor-Consumidor com semáforos
Explique a função dos semáforos:
- `mutex`;
- `full`;
- `empty`.

Qual deles garante exclusão mútua e quais sincronizam a disponibilidade do buffer?

---

## Parte 5 — Mutex e locks

### 16. Mutex
Explique o que é um mutex e quais são seus dois estados.

### 17. Lock
O que acontece quando uma thread tenta adquirir um mutex que está:
- destravado;
- travado?

### 18. Mutex x semáforo
Por que um mutex pode ser visto como uma solução mais simples quando não precisamos da capacidade de contagem de um semáforo?

### 19. Read/Write lock
Por que é possível permitir várias threads simultaneamente em uma região crítica quando todas apenas leem os dados?

Explique a diferença entre `read_lock` e `write_lock`.

---

## Parte 6 — Monitores

### 20. Motivação
Por que o uso direto de semáforos e mutexes pode tornar programas concorrentes difíceis de manter?

### 21. Monitor
Explique o que é um **monitor** e qual problema de programação concorrente ele procura facilitar.

### 22. Regra central
Por que processos não podem acessar diretamente os dados internos de um monitor?

### 23. Concorrência
Quantos processos podem estar ativos dentro de um monitor simultaneamente, segundo o modelo apresentado?

---

## Questão estilo prova

### 24. Análise de execução
Considere um semáforo inicialmente com valor `1`.

Duas threads executam:

```text
down(S)
    [seção crítica]
up(S)
```

Explique o que acontece quando:
1. T1 executa `down(S)`;
2. T2 tenta executar `down(S)` enquanto T1 está na região crítica;
3. T1 executa `up(S)`;
4. T2 é liberada.

### 25. Situação-problema
Um programa produtor-consumidor possui buffer limitado. O produtor verifica que existe espaço disponível, mas sofre uma troca de contexto antes de inserir o item. O consumidor executa e altera o estado do buffer.

Explique por que sincronização inadequada pode produzir comportamento incorreto e qual família de mecanismos do módulo é usada para resolver esse problema.

### 26. Verdadeiro ou falso — justifique

a) "Espera ocupada não consome CPU enquanto espera."

b) "Um semáforo pode bloquear uma thread quando seu valor é zero."

c) "A operação `up` de um semáforo pode liberar uma thread que estava aguardando."

d) "Um mutex permite que várias threads entrem simultaneamente na mesma região crítica."

e) "Um monitor busca oferecer uma abstração de mais alto nível para sincronização."

f) "A região crítica precisa ser protegida porque o resultado pode depender da ordem de execução."
