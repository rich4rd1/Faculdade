# Questões de Revisão — Processos UNIX

## Parte 1 — UNIX e processos

### 1. Família UNIX
Como o módulo caracteriza o termo UNIX atualmente? Cite exemplos de famílias/sistemas apresentados.

### 2. Linux x GNU/Linux
Explique a distinção apresentada entre Linux e GNU/Linux.

### 3. PID e PPID
O que significam:
- PID;
- PPID?

Qual é a relação entre eles?

### 4. ps
Para que serve o comando `ps`? O que podemos descobrir observando PID, PPID e comando associado a um processo?

---

## Parte 2 — Criação de processos

### 5. system()
O que acontece quando um programa C utiliza `system()` para executar um comando?

Por que o material não recomenda essa abordagem como mecanismo geral de criação de processos?

### 6. fork()
Explique o que acontece quando um processo chama `fork()`.

Inclua:
- criação do processo filho;
- cópia das informações do processo;
- PID/PPID;
- ponto de continuação da execução;
- diferença no retorno da função.

### 7. Pai e filho
Considere:

```c
pid_t pid = fork();

if (pid == 0) {
    printf("filho\n");
} else {
    printf("pai\n");
}
```

Explique por que as duas mensagens podem ser executadas após uma única chamada a `fork()`.

### 8. Ordem de execução
No exemplo anterior, é possível garantir que "pai" será impresso antes de "filho"?

Justifique em termos de escalonamento.

---

## Parte 3 — Carga de executáveis

### 9. fork + exec
Depois de um `fork()`, pai e filho inicialmente continuam associados ao mesmo programa.

Como é possível fazer o processo filho executar um programa diferente?

Explique o papel da família de chamadas `exec`.

### 10. Conceito
Qual é a diferença conceitual entre:
- criar/clonar um processo;
- substituir o programa que esse processo está executando?

---

## Parte 4 — Sinais e término

### 11. Sinais
O que são sinais no contexto de processos UNIX?

Para que eles podem ser utilizados?

### 12. SIGTERM x SIGKILL
Qual é a diferença entre:
- `SIGTERM`;
- `SIGKILL`?

Qual deles pode ser ignorado pelo processo?

### 13. Término voluntário
Quais são as duas formas apresentadas para um processo terminar voluntariamente?

### 14. exit()
Qual é a convenção apresentada para:
- `exit(0)`;
- `exit(1)`?

---

## Parte 5 — wait e processos zumbis

### 15. wait()
Para que serve `wait()`?

O que acontece com o processo pai se o filho ainda não terminou?

### 16. Status de término
Para que servem:
- `WIFEXITED`;
- `WEXITSTATUS`?

### 17. Processo zumbi
O que é um **processo zumbi**?

Explique por que um processo filho pode permanecer nesse estado mesmo depois de terminar sua execução.

### 18. Remoção do zumbi
O que acontece quando o processo pai finalmente chama `wait()`?

Explique o que acontece com:
- informações de término;
- processo filho;
- retorno de `wait()`.

---

## Questão estilo prova

### 19. Simulação de fork
Considere:

```c
printf("A\n");
fork();
printf("B\n");
```

Quantas vezes "B" pode ser impresso? Explique por quê.

### 20. Fork em sequência
Considere:

```c
fork();
fork();
```

Quantos processos podem existir ao final, desconsiderando falhas de `fork()`?

Explique o raciocínio passo a passo.

### 21. Fork + exec
Um processo pai cria um filho com `fork()`. O filho deve executar um programa chamado `programa2`, enquanto o pai deve continuar executando seu código original.

Explique conceitualmente a sequência de operações necessária.

### 22. Pai sem wait
Um processo pai cria um filho. O filho termina rapidamente, mas o pai continua executando sem chamar `wait()`.

Qual estado o filho pode assumir? Por quê?

---

## Questão de distinção

### 23. Diferencie claramente

a) PID e PPID;

b) `fork()` e `exec`;

c) `SIGTERM` e `SIGKILL`;

d) término do processo e `wait()`;

e) processo terminado e processo zumbi.

### 24. Verdadeiro ou falso — justifique

a) "`fork()` cria um novo processo que começa necessariamente na primeira linha do programa."

b) "Após `fork()`, o processo filho pode executar um programa diferente usando `exec`."

c) "SIGKILL pode ser ignorado pelo processo."

d) "Um processo pai pode bloquear em `wait()` aguardando seu filho."

e) "Um processo zumbi ainda está executando seu código normalmente."

f) "Depois que o pai coleta o status do filho com `wait()`, o filho pode ser removido da tabela de processos."
