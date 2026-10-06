# Questões de Revisão — Módulo 5: Deadlock

## Parte 1 — Conceito

### 1. Definição
O que é um **deadlock (impasse)**?

Explique a situação em termos de processos bloqueados e eventos que dependem uns dos outros.

### 2. Jantar dos filósofos
Explique como o problema do jantar dos filósofos pode representar um deadlock.

### 3. Cenário clássico
Considere cinco filósofos. Cada um precisa de dois garfos para comer.

Se todos pegarem simultaneamente um garfo e depois tentarem pegar o segundo, explique passo a passo por que pode ocorrer deadlock.

---

## Parte 2 — Deadlock x starvation

### 4. Starvation
O módulo apresenta uma situação em que os filósofos continuam sendo escalonados, mas nenhum consegue efetivamente realizar progresso.

Que problema é esse? Explique a diferença para deadlock.

### 5. Tentativa de solução
Uma solução faz o filósofo liberar o garfo esquerdo caso não consiga obter o direito.

Por que essa estratégia reduz o problema, mas não constitui uma solução teoricamente completa?

### 6. Espera aleatória
Outra estratégia manda o filósofo esperar um tempo aleatório antes de tentar novamente.

Por que ela pode funcionar muito bem na prática e ainda assim não ser considerada uma solução 100% correta do ponto de vista teórico?

---

## Parte 3 — Condições de deadlock

### 7. Quatro condições
Quais são as **quatro condições necessárias para que um deadlock ocorra**?

Explique cada uma.

### 8. Situação-problema
Dois processos possuem recursos diferentes e cada um espera por um recurso mantido pelo outro.

Identifique quais condições podem estar presentes e explique por que a simples existência de espera não é suficiente para afirmar que existe deadlock.

---

## Parte 4 — Soluções

### 9. Prevenção
O que significa **prevenir deadlock**? Qual é a vantagem de técnicas de prevenção segundo o módulo?

### 10. Detecção e recuperação
Qual é a diferença entre:
- prevenção;
- detecção;
- recuperação?

Por que detecção e recuperação podem ser caras?

### 11. Sistemas modernos
O módulo afirma que muitos sistemas operacionais modernos optam por não detectar/tratar automaticamente certos deadlocks.

Explique essa decisão e qual responsabilidade fica com o programador.

---

## Parte 5 — Jantar dos filósofos

### 12. Solução com mutex
Explique como uma solução que coloca um semáforo binário/mutex em torno da aquisição dos garfos pode evitar o deadlock.

Qual é o problema de desempenho dessa solução?

### 13. Solução completa
Explique a ideia da solução com:
- uma função para pegar os garfos;
- uma função para liberar os garfos;
- um mutex protegendo essas funções;
- um semáforo por filósofo.

Como um filósofo que não consegue obter os dois garfos reage?

### 14. Comparação
Por que a solução com um único mutex é teoricamente correta, mas pode permitir menos paralelismo do que a solução completa?

---

## Questão estilo prova

### 15. Análise de recursos
Considere:

```text
Processo A:
Req(R)
Req(S)
Free(R)
Free(S)

Processo B:
Req(S)
Req(R)
Free(S)
Free(R)
```

Suponha que A obtenha `R` e B obtenha `S` antes das próximas requisições.

Explique o que acontece quando:
- A solicita `S`;
- B solicita `R`.

Existe possibilidade de deadlock? Justifique utilizando as condições necessárias.

### 16. Questão de raciocínio
Um sistema possui vários processos concorrentes. Todos podem solicitar recursos, mas o sistema garante que nenhum processo mantém um recurso enquanto espera por outro.

Explique qual condição de deadlock está sendo impedida e por que essa restrição pode ajudar a prevenir o problema.

### 17. Verdadeiro ou falso — justifique

a) "Deadlock e starvation são exatamente o mesmo fenômeno."

b) "Se todos os filósofos segurarem um garfo e esperarem pelo segundo, pode ocorrer deadlock."

c) "Uma solução que funciona em 99,99% dos escalonamentos é teoricamente suficiente para garantir ausência de deadlock."

d) "Prevenção de deadlock procura evitar que as condições necessárias ao deadlock se estabeleçam."

e) "Deadlock significa que todos os processos envolvidos estão esperando indefinidamente por eventos que dependem dos próprios membros do conjunto."
