# Questões de Revisão — Módulo 2: Processos

# Questões de Revisão — Módulo 2: Processos

## Parte 1 — Modelo de processo

### 1. Processo x programa

Explique a diferença entre **programa** e **processo**.

> -- um processo esta relacionado diretamente com a manipulacao das instrucoes na memoria e na cpu, ou seja, o processo eh responsavel por executar tarefas e também possui um estado de execução e recursos associados, como espaço de endereçamento, registradores e arquivos abertos, ja o progama seria de onde os processos recebem as ordem de suas instrucoes. Um programa apenas tem o como fazer, o processo eh o que faz.

Use a ideia de que um programa é passivo e um processo envolve uma atividade em execução.

### 2. Componentes de um processo

Quais informações/estruturas fazem parte do estado de um processo? Cite os elementos apresentados no módulo.

> -- espaços de endereçamento, arquivos abertos, processos filhos, sinas, estistica de uso

> -- contador, apontador de pilha, conjunto de registradores, estados de execuçao.

**Contexto de software:** informações administrativas do processo, como arquivos abertos, processos filhos, sinais e estatísticas de uso.

**Contexto de hardware:** informações necessárias para retomar a execução, como contador de programa, apontador de pilha, registradores e estado de execução.

### 3. Contextos

Segundo a divisão apresentada no material, o processo pode ser entendido em:

- espaço de endereçamento;
- contexto de software;
- contexto de hardware.

Explique o que representa cada parte e como **ambiente** e **execução** se relacionam com elas.

> no espaço de endereçamento refere se as pilhas de instruçoes que sao guardadas na memoria. o contexto de software eh quem vai usar e o de hardware eh o que vai ser executado (material nao explica)

**Espaço de endereçamento:** região lógica de memória associada ao processo, que contém suas instruções, dados, pilha e outras áreas. Não é apenas uma pilha de instruções.

\*Contexto de software:\*\* informações administrativas utilizadas pelo SO para gerenciar o processo.

**Contexto de hardware:** informações da execução da CPU, como registradores, contador de programa e apontador de pilha.

### 4. Heavyweight

Por que o processo tradicional é classificado como _heavyweight_? O que torna a troca de contexto entre processos relativamente pesada?

> -- No heavy cada processo possuiu um unico fluxo de controle e roda de forma independente dos outros.

> -- O sistema opera com varios processos independentes entre si, por isso a troca de contexto eh pesada, a cpu precisa carregar um processo totalmente diferente e completo do qual ela estava rodando anteriormente.

A troca envolve salvar o estado do processo que sai e restaurar o estado do processo que entra. Além disso, processos possuem contextos e espaços de endereçamento próprios, o que pode tornar a troca mais custosa do que a troca entre threads do mesmo processo.

---

## Parte 2 — Criação, hierarquia e estados

### 5. Criação de processos

Por que sistemas de propósito geral precisam de mecanismos para criar processos dinamicamente?

> -- Devido a diversidade de softwares e hardwares que um SO pode operar sobre, ou seja, o SO precisa de diferente maneiras em diferentes maquinas, executar as instruçoes que o usuario indicou para o SO.

> Criando entao processos pais, e processos secundarios, chamados de deamons.

Sistemas operacionais precisam criar processos dinamicamente para iniciar programas, executar serviços e permitir que processos existentes criem novos processos para realizar outras tarefas. Isso permite administrar atividades de execução conforme as necessidades do sistema e dos usuários.

### 6. Hierarquia

Quando um processo cria outro processo, qual é a relação estabelecida entre eles? Explique o conceito de processo pai e filho.

> Como a unica forma de criar um processo no unix eh atraves da clonagem, o processo init chama a funçao de fork clonando a si proprio e criando outro proceso identico, e posteriormente, mudando apenas a estrutura interna daquele processo para cumprir a funcionalidade a qual ele foi chamado

Quando um processo cria outro, estabelece-se uma relação pai-filho. O processo criador é o pai e o novo processo é o filho. Em UNIX, `fork()` cria o filho a partir do processo chamador; depois disso, pai e filho podem continuar executando e seguir caminhos diferentes.

### 7. Estados

Explique os três estados fundamentais apresentados para um processo:

> Rodando: momento protegido do processo para rodar suas tarefas ate que seu tempo acabe

> Pronto: finalizou a execucao do seu processo.

> Bloqueado: esta pronto para ser rodado, porem, esta esperando um evento terminar para poder rodar. seja uma entrada ou saida em outro processo, ou nele mesmo.

- **Rodando:** o processo está utilizando a CPU.
- **Pronto:** o processo pode executar, mas está aguardando a CPU ficar disponível. **Não significa que terminou.**
- **Bloqueado:** o processo não pode continuar naquele momento porque espera um evento, como a conclusão de uma operação de E/S.

O que eh CPU BOUND e IO BOUND

> o cpu bound passa mais tempo usando a cpu, no estado rodando ou no estado pronto ja os IO BOUND tem afinidade com entrada e saida, passam a maior parte do tempo bloqueados causados por eventos de entrada e saida.

### 8. Transições

Explique cada situação:

a) Um processo rodando precisa esperar uma leitura de disco.

> entra no modo bloqueado e espera a leitura de disco terminar.

b) Um processo bloqueado recebe o evento pelo qual estava esperando.

> ao receber o evento, passa para o estado pronto ou ele finaliza ou ele passa para o bloqueado novamente se estiver esperando um novo evento

c) Um processo pronto é escolhido pelo escalonador.

> quando os processos se encontram no modo pronto sao escolhido pelo algoritmo escalnador para serem executados. com isso o SO fa a troca de contexto, e passa para o processo ganhador o uso da dos recurso, ate seu time sliced terminar e o escalonador reeleger outro processo.

d) O processo em execução perde a posse do processador por preempção. A cpu faz uma suspensao temporaria da execução do processo.

---

### troca de contexto

Como funciona a troca de contexto ?

> cada dispositivo tem uma area de memoria chamada vetor de interrupçoes, contendo os endereços de procedimentos de serviços de interrupçoes

A troca de contexto ocorre quando a CPU deixa de executar um processo e passa a executar outro. O sistema salva o estado do processo anterior e restaura o estado do próximo, permitindo que cada um continue sua execução posteriormente.

## Parte 3 — Escalonamento

### 9. Preempção

O que significa um escalonamento ser preemptivo? Qual é a diferença para um escalonamento não preemptivo?

> no escalonamento não preemptivo, a cpu fica vinculada ao processo ate o final, sem chance de ser paralizado ou bloqueado pelo SO, ja o preemptivo cada processo tem um time sliced para operar e quando o tempo acaba o so retira o processador daquele processo e permite que outro seja executado o SO tem um clock pro time sliced chamado clock tick, se o contador chegar a zero a permanencia do processo acaba.

> Ja os preemptivos permitem a interrupcao, ao custo claro, tempo minimo, justiça, etc. porem eles asseguram um melhor uso da cpu mas peca nas programaçao de processos concorrentes. podendo ser enterrompido em tempo arbitrario sem proteçao.

Cite os criterios de escalonamento:

- Justiça
- Eficiencia
- Minimizar tempo de resposta
- minimizar o turnaround (tempo de lançamento ate o termino)
- minimizar waiting time
- maximizar trhoughput (Numero de tarefas executadas em uma unidade de tempo)

> cabe citar que nao eh possivel ter todos os criterios de uma so vez, eles sao em alguns casos inversamente custosos, exemplo, ao maximizar o throughput, a justiça pode ser comprometida, ao minimizar o turnaround pode custar muito da eficiencia.

> Para descobrir qual a melhor decisao de escolha temos algoritimos classicos de escalonamento:

- > First come First Served
  >
- > Round-Robin
  >
- > Prioridade
  >
- > Shortest Job First
  >

### 10. FCFS

Explique o funcionamento do algoritmo **First Come First Served (FCFS)**.

> O primeiro a chegar na ordem de solicitaçoes de uso da CPU leva.

Quais são suas principais vantagens e problemas segundo o módulo?

> Desvantagem eh que ele eh nao preeptivo, ou seja, se chegar algum processo CPU bound, pode criar uma fila enorme de espera, o lado bom eh simples de ser implementado e eficiente, cpu sempre estara ocupada com alguma atividade.

### 11. FCFS — cálculo

Considere:


| Processo | Chegada | Execução |
| -------- | ------: | ---------: |
| P1       |       0 |          8 |
| P2       |       1 |          2 |
| P3       |       2 |          5 |
| P4       |       3 |          4 |

Suponha FCFS e nenhuma chamada bloqueante.

(INICIO - CHEGADA )

Determine:

- > ordem de execução; P1 P2 P3 P4
  >
- > tempo de espera de cada processo; P1 0, P2 7, P3 8, P4 12
  >
- > tempo médio de espera. 6.75
  >

Depois explique por que o algoritmo pode ser injusto nesse cenário.

> justamente pelo tamanho de alguns processos, exemplo, p2, tem um tempo de execuçao de 2, se fosse num escalonamento diferente baseado em tempo de uso de cpu, o P1 seria executado por um tempo, ser parado, o SO chamaria o P2, ele executaria e terminaria pelo tamanho pequeno, e os outros tbm teriam chances de serem finalizados.

### 12. Round-Robin

Explique o funcionamento do **Round-Robin** e o conceito de **quantum**.

> cada processo tem um tempo de uso na cpu. alternancia circular e algoritmo justo.

> quantum = tempo de execucao de processo

### 13. Round-Robin — quantum

Explique o que tende a acontecer quando:

- > o quantum é muito longo; se torna um FCFS
  >

  > o quantum é muito curto. perde varios requisitos como a eficiencia
  >

Por que o custo da troca de contexto precisa ser considerado?

> devido ao tempo, eh bom tirar uma media do tempo de execuçao de todos os processos, assim o custo de troca de contexto precisa ser menor que o tempo de execuçao do programa.

### 14. Prioridades

Como funciona o escalonamento por prioridades? Em que tipo de sistema ele pode ser particularmente relevante?

> Bastante usado em SO em Tempo Real, avalia a prioridade dos processos colocando os mais importantes na frente dos menos. Prioridades podem ser divididas em _estaticas_ ou _dinamincas_.
>
> ESTATICA: processos divididos em classes e cada classe recebe um valor de prioridade
>
> DINAMICAS: O SO analisa os processos atribuindo certos comportamentos, usa isso para definir a fila de execuçao. (Meritocracia dos processos)

> I/O Bound deve possuir prioridade alta
>
> PRIORIDADE DINAMICA: 1/f, f = fracao to quantum de tempo usado na ultima rodada de processo.

### 15. Comparação

Compare FCFS e Round-Robin quanto a:

- > justiça; Round-Robin eh mais justo
  >
- > tempo de resposta; Round-Robin - se estruturado de forma correta, tem melhor tempo de resposta
  >
- > uso da CPU; FCFS - usa a cpu por completo, desde o primeiro processo ate o ultimo.
  >
- > efeito do tempo de troca de contexto. Round-Robin, tem uma melhor troca de contexto
  >

### 16. Shortest Job First

Explique a ideia do **Shortest Job First (SJF)** e por que colocar tarefas curtas antes de tarefas longas pode reduzir determinados tempos médios.

> Projeado para processar lotes
>
> Reduzir o turnaround
>
> Precisa do tempo total de execucao do processo antes de rodar ele
>
> analisa o de menor tempo, e roda eles por ordem de menor tempo

Usado em sistemas iterativos. (Que esperam e executam comandos)

Problema: como definir o tempo de execucao ?

Problema: COmo definir parada ?

## Questão estilo prova

### 17. Simulação de escalonamento

Considere três processos:


| Processo | Chegada | Execução |
| -------- | ------: | ---------: |
| A        |       0 |          6 |
| B        |       0 |          2 |
| C        |       1 |          3 |

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

## Parte 1 — Modelo de processo

### 1. Processo x programa

Explique a diferença entre **programa** e **processo**.

> -- um processo esta relacionado diretamente com a manipulacao das instrucoes na memoria e na cpu, ou seja, o processo eh responsavel por executar tarefas, ja o progama seria de onde os processos recebem as ordem de suas instrucoes. Um programa apenas tem o como fazer, o processo eh o que faz.

Use a ideia de que um programa é passivo e um processo envolve uma atividade em execução.

### 2. Componentes de um processo

Quais informações/estruturas fazem parte do estado de um processo? Cite os elementos apresentados no módulo.

> -- espaços de endereçamento, arquivos abertos, processos filhos, sinas, estistica de uso

> -- contador, apontador de pilha, conjunto de registradores, estados de execuçao.

### 3. Contextos

Segundo a divisão apresentada no material, o processo pode ser entendido em:

- espaço de endereçamento;
- contexto de software;
- contexto de hardware.

Explique o que representa cada parte e como **ambiente** e **execução** se relacionam com elas.

> no espaço de endereçamento refere se as pilhas de instruçoes que sao guardadas na memoria. o contexto de software eh quem vai usar e o de hardware eh o que vai ser executado (material nao explica)

### 4. Heavyweight

Por que o processo tradicional é classificado como _heavyweight_? O que torna a troca de contexto entre processos relativamente pesada?

> -- No heavy cada processo possuiu um unico fluxo de controle e roda de forma independente dos outros.

> -- O sistema opera com varios processos independentes entre si, por isso a troca de contexto eh pesada, a cpu precisa carregar um processo totalmente diferente e completo do qual ela estava rodando anteriormente.

---

## Parte 2 — Criação, hierarquia e estados

### 5. Criação de processos

Por que sistemas de propósito geral precisam de mecanismos para criar processos dinamicamente?

> -- Devido a diversidade de softwares e hardwares que um SO pode operar sobre, ou seja, o SO precisa de diferente maneiras em diferentes maquinas, executar as instruçoes que o usuario indicou para o SO.

> Criando entao processos pais, e processos secundarios, chamados de deamons.

### 6. Hierarquia

Quando um processo cria outro processo, qual é a relação estabelecida entre eles? Explique o conceito de processo pai e filho.

> Como a unica forma de criar um processo no unix eh atraves da clonagem, o processo init chama a funçao de fork clonando a si proprio e criando outro proceso identico, e posteriormente, mudando apenas a estrutura interna daquele processo para cumprir a funcionalidade a qual ele foi chamado

### 7. Estados

Explique os três estados fundamentais apresentados para um processo:

> Rodando: momento protegido do processo para rodar suas tarefas ate que seu tempo acabe

> Pronto: finalizou a execucao do seu processo.

> Bloqueado: esta pronto para ser rodado, porem, esta esperando um evento terminar para poder rodar. seja uma entrada ou saida em outro processo, ou nele mesmo.

O que eh CPU BOUND e IO BOUND

> o cpu bound passa mais tempo usando a cpu, no estado rodando ou no estado pronto ja os IO BOUND tem afinidade com entrada e saida, passam a maior parte do tempo bloqueados causados por eventos de entrada e saida.

### 8. Transições

Explique cada situação:

a) Um processo rodando precisa esperar uma leitura de disco.

> entra no modo bloqueado e espera a leitura de disco terminar.

b) Um processo bloqueado recebe o evento pelo qual estava esperando.

> ao receber o evento, passa para o estado pronto ou ele finaliza ou ele passa para o bloqueado novamente se estiver esperando um novo evento

c) Um processo pronto é escolhido pelo escalonador.

> quando os processos se encontram no modo pronto sao escolhido pelo algoritmo escalnador para serem executados. com isso o SO fa a troca de contexto, e passa para o processo ganhador o uso da dos recurso, ate seu time sliced terminar e o escalonador reeleger outro processo.

d) O processo em execução perde a posse do processador por preempção. A cpu faz uma suspensao temporaria da execução do processo.

---

### troca de contexto

Como funciona a troca de contexto ?

> cada dispositivo tem uma area de memoria chamada vetor de interrupçoes, contendo os endereços de procedimentos de serviços de interrupçoes

## Parte 3 — Escalonamento

### 9. Preempção

O que significa um escalonamento ser preemptivo? Qual é a diferença para um escalonamento não preemptivo?

> no escalonamento não preemptivo, a cpu fica vinculada ao processo ate o final, sem chance de ser paralizado ou bloqueado pelo SO, ja o preemptivo cada processo tem um time sliced para operar e quando o tempo acaba o so retira o processador daquele processo e permite que outro seja executado o SO tem um clock pro time sliced chamado clock tick, se o contador chegar a zero a permanencia do processo acaba.

> Ja os preemptivos permitem a interrupcao, ao custo claro, tempo minimo, justiça, etc. porem eles asseguram um melhor uso da cpu mas peca nas programaçao de processos concorrentes. podendo ser enterrompido em tempo arbitrario sem proteçao.

Cite os criterios de escalonamento:

- Justiça
- Eficiencia
- Minimizar tempo de resposta
- minimizar o turnaround (tempo de lançamento ate o termino)
- minimizar waiting time
- maximizar trhoughtput (Numero de tarefas executadas em uma unidade de tempo)

> cabe citar que nao eh possivel ter todos os criterios de uma so vez, eles sao em alguns casos inversamente custosos, exemplo, ao maximizar o throughput, a justiça pode ser comprometida, ao minimizar o turnaround pode custar muito da eficiencia.

> Para descobrir qual a melhor decisao de escolha temos algoritimos classicos de escalonamento:

- > First come First Served
  >
- > Round-Robin
  >
- > Prioridade
  >
- > Shortest Job First
  >

### 10. FCFS

Explique o funcionamento do algoritmo **First Come First Served (FCFS)**.

> O primeiro a chegar na ordem de solicitaçoes de uso da CPU leva.

Quais são suas principais vantagens e problemas segundo o módulo?

> Desvantagem eh que ele eh nao preeptivo, ou seja, se chegar algum processo CPU bound, pode criar uma fila enorme de espera, o lado bom eh simples de ser implementado e eficiente, cpu sempre em uso

### 11. FCFS — cálculo

Considere:


| Processo | Chegada | Execução |
| -------- | ------: | ---------: |
| P1       |       0 |          8 |
| P2       |       1 |          2 |
| P3       |       2 |          5 |
| P4       |       3 |          4 |

Suponha FCFS e nenhuma chamada bloqueante.

Determine:

- > ordem de execução; P1 P2 P3 P4
  >
- > tempo de espera de cada processo; P1 0, P2 8, P3 10, P4 15
  >
- > tempo médio de espera. 4,75
  >

Depois explique por que o algoritmo pode ser injusto nesse cenário.

> justamente pelo tamanho de alguns processos, exemplo, p2, tem um tempo de execuçao de 2, se fosse num escalonamento diferente baseado em tempo de uso de cpu, o P1 seria executado por um tempo, ser parado, o SO chamaria o P2, ele executaria e terminaria pelo tamanho pequeno, e os outros tbm teriam chances de serem finalizados.

### 12. Round-Robin

Explique o funcionamento do **Round-Robin** e o conceito de **quantum**.

> cada processo tem um tempo de uso na cpu. alternancia circular e algoritmo justo.

> quantum = tempo de execucao de processo

### 13. Round-Robin — quantum

Explique o que tende a acontecer quando:

- > o quantum é muito longo; se torna um FCFS
  >

  > o quantum é muito curto. perde varios requisitos como a eficiencia
  >

Por que o custo da troca de contexto precisa ser considerado?

> devido ao tempo, eh bom tirar uma media do tempo de execuçao de todos os processos, assim o custo de troca de contexto precisa ser menor que o tempo de execuçao do programa.

### 14. Prioridades

Como funciona o escalonamento por prioridades? Em que tipo de sistema ele pode ser particularmente relevante?

> Bastante usado em SO em Tempo Real, avalia a prioridade dos processos colocando os mais importantes na frente dos menos. Prioridades podem ser divididas em _estaticas_ ou _dinamincas_.
>
> ESTATICA: processos divididos em classes e cada classe recebe um valor de prioridade
>
> DINAMICAS: O SO analisa os processos atribuindo certos comportamentos, usa isso para definir a fila de execuçao. (Meritocracia dos processos)

> I/O Bound deve possuir prioridade alta
>
> PRIORIDADE DINAMICA: 1/f, f = fracao to quantum de tempo usado na ultima rodada de processo.

### 15. Comparação

Compare FCFS e Round-Robin quanto a:

- > justiça; Round-Robin eh mais justo
  >
- > tempo de resposta; Round-Robin - se estruturado de forma correta, tem melhor tempo de resposta
  >
- > uso da CPU; FCFS - usa a cpu por completo, desde o primeiro processo ate o ultimo.
  >
- > efeito do tempo de troca de contexto. Round-Robin, tem uma melhor troca de contexto
  >

### 16. Shortest Job First

Explique a ideia do **Shortest Job First (SJF)** e por que colocar tarefas curtas antes de tarefas longas pode reduzir determinados tempos médios.

> Projeado para processar lotes
>
> Reduzir o turnaround
>
> Precisa do tempo total de execucao do processo antes de rodar ele
>
> analisa o de menor tempo, e roda eles por ordem de menor tempo

Usado em sistemas iterativos. (Que esperam e executam comandos)

Problema: como definir o tempo de execucao ?

Problema: COmo definir parada ?

## Questão estilo prova

### 17. Simulação de escalonamento

Considere três processos:


| Processo | Chegada | Execução |
| -------- | ------: | ---------: |
| A        |       0 |          6 |
| B        |       0 |          2 |
| C        |       1 |          3 |

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
