# Questões de Revisão — Módulo 3: Threads

## Parte 1 — Conceito

### 1. Processo x thread

Explique a ideia central de que **processos agrupam recursos** enquanto **threads representam execução**.

> processsos agurpam recursos threads sao focadas em multiplas execuçoes com um grau de independencia entre elas

### 2. Lightweight

Por que threads também são chamadas de _lightweight processes_?

> Devido a sua troca de contexto ser mais leve, o escalonamento perde um grande volume de complexidade.

### 3. Compartilhamento

Em um processo com várias threads, o que é compartilhado entre elas e o que permanece individual?

> As variaveis das threads sao globais, elas as compartilham e podem ate alterar algo que outra esta fazendo. Porem cada uma tem sua pilha de memoria para guardar seus procedimentos, tempos, contexto de execuçao e descritores de arquivos diferentes umas das outras.

Inclua:

- espaço de endereçamento;
- variáveis globais;
- descritores de arquivos;
- contexto de execução;
- pilha.

### 4. Troca de contexto

Por que a troca de contexto entre threads do mesmo processo pode ser mais leve do que entre processos tradicionais?

> Processos tradicionais, ao sofrerem a troca de contexto, o SO tem que recarregar todo o contexto do novo processo, pilha de memoria, variaveis, execuçoes regras etc. ja as threads nao, cada um delas ja faz o armazenamento desses metodos de execuçao consigo, logo, econmiza tempo do ecalonador.

### 5. Independência

Por que duas threads do mesmo processo não são tão independentes quanto dois processos diferentes?

> porque as threads ainda pertencem a um nucleo de processo, por isso, sua execuçao ainda esta atrelada a daquele processo, diferentemente do processo que cada um tem seu proprio bloco de processamento.

---

## Parte 2 — Estados e controle

### 6. Estados de uma thread

Explique os estados:

- > Rodando; sua vez de usar a cpu
- > Pronto; terminado ou esperando para ser escalonado novamente
- > Bloqueado. esperando alguma atividade ser finalizada para ser executado

Dê um exemplo de transição causada por espera de entrada e outro causado pelo término do tempo de posse da CPU.

Uma thread ou processo pode ficar esperando uma entrada de teclado para finalizar a chamada e o uso da CPU, enquanto isso, se for um escalonador de time-sliced, quando o tempo dessa atividade nao acontecer dentro do quantum que aquele processo ganhou, ele perdera sua vez de rodar e tera que fazer outra chamada ao escalonador.

### 7. Pilha

Por que cada thread precisa possuir sua própria pilha mesmo compartilhando o espaço de endereçamento com as outras threads?

> Para guardar seu proprio contexto de software e de hardware.

### 8. Operações de controle

Explique o papel de:

- `thread_create`; cria uma nova thread
- `thread_exit`; finaliza uma thread
- `thread_yield`. instrui uma thread a auto-desistir de ser processada

---

## Parte 3 — Por que utilizar threads?

### 9. Concorrência

Por que múltiplas threads podem ser vantajosas quando um programa realiza várias operações bloqueantes?

> devido a troca de contexto leve que a threads tem, menos custo, menos processamento, mais rapidez e menos dependencias.

### 10. Exemplo

Um programa precisa:

- ler dados de rede;
- processar um arquivo;
- receber informações do SO.

Explique como threads podem simplificar a organização desse programa.

> Ao inves de mandar um processo fazer 3 operaçoes diferentes, brigar por sua vaga no escalonador, pelo uso da cpu, talvez a depender ser expulso do uso da cpu varias vezes para terminar uma atividade ou pior, criar uma linha de processamento muito longa causando gargalo. Seria mais facil e dinamico, criar threds para cada atividade, assim, elas que tem uma troca de contexto mais simples, podem realizar as mesmas tarefas mais rapido e no final devolver apenas , variaveis, contextos, ou indicaçoes de memoria e disco para o processo.

### 11. Problemas

Por que transformar um programa monothread em multithread pode ser difícil?

Considere especificamente:

- variáveis globais;
- dados compartilhados;
- escalonamento;
- chamadas bloqueantes.

---

## Parte 4 — Implementação

### 12. Threads em modo usuário

Explique como funciona a implementação de threads em modo usuário e cite uma vantagem e uma desvantagem apresentadas no módulo.

### 13. Chamada bloqueante

Por que uma chamada bloqueante do sistema pode ser especialmente problemática em uma implementação de threads em modo usuário?

### 14. Threads em modo kernel

Explique o que muda quando o kernel é responsável por criar, escalonar e terminar threads.

### 15. Comparação

Compare threads de usuário e threads de kernel quanto a:

- custo de troca de contexto;
- tratamento de bloqueios;
- responsabilidade do escalonador.

### 16. Modelo híbrido

Explique o objetivo da arquitetura híbrida e como um processo pode possuir várias threads de kernel e, por sua vez, várias threads de usuário.

---

## Parte 5 — Modelos de execução

### 17. Thread dinâmica x estática

Qual é a diferença entre:

- thread dinâmica;
- thread estática?

### 18. Dispatcher/Worker

Explique o modelo **Despachante/Trabalhador**.

Em um servidor web, por que pode ser útil separar a recepção das requisições do processamento delas?

### 19. Modelo Time

Explique como funciona o modelo Time e como as threads obtêm tarefas.

### 20. Pipeline

Explique o modelo Pipeline e a principal desvantagem relacionada a uma thread muito mais lenta que as outras.

---

## Parte 6 — Condições de corrida

### 21. Condição de corrida

O que é uma **condição de corrida** e por que o escalonador torna a ordem de execução imprevisível?

### 22. Simulação

Considere `x = 0` e duas threads executando:

```text
Thread A:
x = x + 1

Thread B:
x = x + 1
```

Explique por que o resultado não pode ser analisado apenas olhando para as duas linhas de código.

Descreva uma possível sequência de LOAD/INC/STORE que cause perda de atualização.

### 23. Seção crítica

O que é uma **seção/região crítica**? Por que ela normalmente pode envolver mais de uma instrução?

### 24. Exclusão mútua

O que significa garantir exclusão mútua? Quais propriedades uma boa solução de exclusão mútua deve possuir segundo o módulo?

---

## Questão estilo prova

### 25. Situação-problema

Um processo possui três threads. Todas compartilham uma variável global `contador`. Cada thread executa um laço que incrementa o contador milhares de vezes.

Explique:

1. por que o resultado pode ser diferente do esperado;
2. que conceito está envolvido;
3. qual mecanismo é necessário para proteger a região crítica;
4. por que o SO não resolve automaticamente esse problema entre threads do mesmo processo.

### 26. Verdadeiro ou falso — justifique

a) "Threads de um mesmo processo possuem necessariamente espaços de endereçamento independentes."

b) "Cada thread possui sua própria pilha."

c) "Threads compartilham variáveis globais."

d) "Uma thread bloqueada pode permitir que outra thread seja executada."

e) "Uma condição de corrida ocorre porque a ordem de execução concorrente pode afetar o resultado."

f) "O modelo Pipeline é sempre eficiente independentemente da velocidade de cada etapa."
