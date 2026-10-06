# Questões de Revisão — Módulo 2: Processos

## Parte 1 — Modelo de processo

### 1. Processo x programa
Explique a diferença entre **programa** e **processo**.

Use a ideia de que um programa é passivo e um processo envolve uma atividade em execução.

### 2. Componentes de um processo
Quais informações/estruturas fazem parte do estado de um processo? Cite os elementos apresentados no módulo.

### 3. Contextos
Segundo a divisão apresentada no material, o processo pode ser entendido em:
- espaço de endereçamento;
- contexto de software;
- contexto de hardware.

Explique o que representa cada parte e como **ambiente** e **execução** se relacionam com elas.

### 4. Heavyweight
Por que o processo tradicional é classificado como *heavyweight*? O que torna a troca de contexto entre processos relativamente pesada?

---

## Parte 2 — Criação, hierarquia e estados

### 5. Criação de processos
Por que sistemas de propósito geral precisam de mecanismos para criar processos dinamicamente?

### 6. Hierarquia
Quando um processo cria outro processo, qual é a relação estabelecida entre eles? Explique o conceito de processo pai e filho.

### 7. Estados
Explique os três estados fundamentais apresentados para um processo:

- Rodando;
- Pronto;
- Bloqueado.

### 8. Transições
Explique cada situação:

a) Um processo rodando precisa esperar uma leitura de disco.

b) Um processo bloqueado recebe o evento pelo qual estava esperando.

c) Um processo pronto é escolhido pelo escalonador.

d) O processo em execução perde a posse do processador por preempção.

---

## Parte 3 — Escalonamento

### 9. Preempção
O que significa um escalonamento ser preemptivo? Qual é a diferença para um escalonamento não preemptivo?

### 10. FCFS
Explique o funcionamento do algoritmo **First Come First Served (FCFS)**.

Quais são suas principais vantagens e problemas segundo o módulo?

### 11. FCFS — cálculo
Considere:

| Processo | Chegada | Execução |
|---|---:|---:|
| P1 | 0 | 8 |
| P2 | 1 | 2 |
| P3 | 2 | 5 |
| P4 | 3 | 4 |

Suponha FCFS e nenhuma chamada bloqueante.

Determine:
- ordem de execução;
- tempo de espera de cada processo;
- tempo médio de espera.

Depois explique por que o algoritmo pode ser injusto nesse cenário.

### 12. Round-Robin
Explique o funcionamento do **Round-Robin** e o conceito de **quantum**.

### 13. Round-Robin — quantum
Explique o que tende a acontecer quando:
- o quantum é muito longo;
- o quantum é muito curto.

Por que o custo da troca de contexto precisa ser considerado?

### 14. Prioridades
Como funciona o escalonamento por prioridades? Em que tipo de sistema ele pode ser particularmente relevante?

### 15. Comparação
Compare FCFS e Round-Robin quanto a:
- justiça;
- tempo de resposta;
- uso da CPU;
- efeito do tempo de troca de contexto.

### 16. Shortest Job First
Explique a ideia do **Shortest Job First (SJF)** e por que colocar tarefas curtas antes de tarefas longas pode reduzir determinados tempos médios.

---

## Questão estilo prova

### 17. Simulação de escalonamento
Considere três processos:

| Processo | Chegada | Execução |
|---|---:|---:|
| A | 0 | 6 |
| B | 0 | 2 |
| C | 1 | 3 |

Considere Round-Robin com quantum de 2.

Monte a sequência de execução considerando a fila de processos e determine, ao final, quando cada processo termina.

Explique as decisões tomadas pelo escalonador.

### 18. Situação-problema
Um processo está bloqueado esperando dados de rede. O computador possui outros processos prontos.

Explique:
1. por que o processo não deve continuar consumindo a CPU enquanto espera;
2. qual estado ele ocupa;
3. como outro processo pode utilizar a CPU;
4. o que precisa acontecer para o processo voltar a ficar elegível para execução.

---

## Questão de distinção

### 19. Diferencie claramente
Explique a diferença entre:

a) processo e programa;

b) processo rodando e processo pronto;

c) processo bloqueado e processo pronto;

d) preempção e bloqueio por E/S;

e) heavyweight e lightweight.

### 20. Verdadeiro ou falso — justifique

a) "Um processo é apenas o código executável armazenado no disco."

b) "Um processo bloqueado está necessariamente consumindo a CPU."

c) "No Round-Robin, cada processo recebe um intervalo de tempo denominado quantum."

d) "Um quantum muito longo pode fazer o Round-Robin se comportar de forma semelhante ao FCFS."

e) "Processos tradicionais compartilham automaticamente o mesmo espaço de memória."
