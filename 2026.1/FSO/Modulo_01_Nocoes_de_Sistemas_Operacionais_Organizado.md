# Módulo 1 — Noções Básicas de Sistemas Operacionais

## 1. Noções básicas

### O que são Sistemas Operacionais?

Um Sistema Operacional (SO) é um programa ou conjunto de programas que atua como parte fundamental do software do computador.

O SO:
- executa em **modo protegido**;
- possui acesso aos recursos de hardware;
- pode executar instruções privilegiadas;
- possui rotinas que executam concorrentemente em resposta a eventos assíncronos.

### Modo protegido e modo usuário

O sistema possui diferentes níveis de execução.

- **Modo protegido:** permite ao SO executar operações privilegiadas e controlar diretamente recursos do hardware.
- **Modo usuário:** utilizado pelas aplicações, com acesso limitado aos recursos e às instruções privilegiadas.

> **Atenção:** modo protegido não significa "modo administrador". É uma distinção relacionada aos níveis de privilégio de execução.

---

## 2. Funções do Sistema Operacional

As duas funções fundamentais do SO são:

1. **Gerenciar recursos**
2. **Fornecer uma abstração da máquina**

### Gerenciamento de recursos

O SO gerencia recursos físicos e abstratos.

**Recursos físicos:**
- processadores;
- memória;
- discos;
- rede.

**Recursos abstratos:**
- processos;
- arquivos.

O SO precisa:
- proteger os recursos;
- controlar quais recursos estão sendo utilizados;
- decidir quem pode acessá-los;
- alocar e liberar recursos.

### Abstração de máquina / máquina estendida

O SO fornece uma abstração do hardware, escondendo sua complexidade e oferecendo uma interface mais simples para as aplicações.

Por exemplo, uma aplicação não precisa controlar diretamente os detalhes físicos de onde os dados serão armazenados no dispositivo. Ela utiliza operações de mais alto nível fornecidas pelo SO, como operações de arquivos.

Exemplos citados no material:
- `fopen`
- `fread`

---

## 3. Multiprogramação

A **multiprogramação** mantém múltiplos programas na memória.

Enquanto um programa está bloqueado esperando uma operação de **E/S (Entrada/Saída)**, outro programa pode utilizar a CPU.

### Ideia principal

Sem multiprogramação:

```text
Programa A → espera E/S → CPU fica ociosa
```

Com multiprogramação:

```text
Programa A → espera E/S
                 ↓
Programa B → utiliza a CPU
```

O objetivo é aproveitar melhor a CPU mantendo outros programas executáveis enquanto um deles espera por E/S.

---

## 4. Spooling

**Spooling** consiste em colocar trabalhos de E/S em uma área intermediária para que um dispositivo mais lento possa processá-los posteriormente.

O material relaciona o mecanismo ao uso de **memória secundária** como armazenamento temporário.

### Exemplo

Uma impressora é um dispositivo relativamente lento.

Em vez de a aplicação ficar esperando a impressora terminar cada trabalho:

```text
Aplicação
   ↓
Spool / fila intermediária
   ↓
Impressora
```

Os trabalhos ficam armazenados temporariamente e são processados posteriormente pelo dispositivo.

---

## 5. Timesharing

**Timesharing** é o compartilhamento da CPU entre diferentes programas/usuários por meio de intervalos de tempo.

Cada programa recebe uma determinada **fatia de tempo (time slice)** para utilizar a CPU.

A ideia é permitir que vários programas compartilhem os recursos do computador de maneira controlada.

---

# Tipos de Sistemas Operacionais

## 6. Sistema monoprogramável

Um sistema **monoprogramável** é voltado para a execução de um único programa por vez.

Os recursos do sistema — como memória, CPU e armazenamento — ficam direcionados à execução desse programa.

---

## 7. Sistema multiprogramável

Um sistema **multiprogramável** permite que vários programas permaneçam no sistema e compartilhem os recursos.

O SO precisa gerenciar os processos concorrentes e o acesso aos recursos.

A multiprogramação permite maior aproveitamento dos recursos, especialmente quando um processo fica bloqueado esperando E/S.

Exemplos/categorias relacionadas no material:
- sistemas Batch;
- sistemas de tempo compartilhado;
- sistemas de tempo real.

---

## 8. Sistemas Batch

Em sistemas **Batch**, a execução acontece sem interação direta do usuário durante o processamento.

As aplicações/trabalhos são organizados em um **lote (batch)** e processados.

### Contexto histórico

Nos primeiros sistemas, os trabalhos eram agrupados e processados sequencialmente.

Com a evolução dos sistemas, surgiu a necessidade de evitar que a CPU ficasse ociosa durante as esperas de E/S.

---

## 9. Sistemas de tempo compartilhado

Nos sistemas de **tempo compartilhado**, diferentes programas/usuários compartilham a CPU.

O uso da CPU é controlado por **fatias de tempo (time slices)**.

A troca entre os programas permite que vários usuários/programas tenham a impressão de utilizar o computador simultaneamente.

---

## 10. Sistemas de tempo real

Em sistemas de **tempo real**, o tempo de resposta possui importância fundamental.

O sistema precisa atender **restrições temporais**, ou seja, determinadas operações precisam produzir seus resultados dentro de prazos estabelecidos.

> O ponto central não é simplesmente "ser rápido", mas cumprir as restrições de tempo relevantes para o sistema.

---

## 11. Sistemas monotarefa

Um sistema **monotarefa** é projetado para executar uma única tarefa por vez.

---

## 12. Sistemas multitarefa

Um sistema **multitarefa** permite a execução de mais de uma aplicação/tarefa de forma concorrente.

Isso não significa necessariamente que exista mais de um processador.

A concorrência pode ocorrer por meio do compartilhamento do tempo de CPU.

---

# Estruturas de Sistemas Operacionais

## 13. Sistemas monolíticos

Em um sistema **monolítico**, grande parte das funcionalidades do SO está integrada ao núcleo.

Os componentes possuem forte integração, proporcionando bom desempenho/tempo de resposta, mas com menor isolamento entre os componentes.

O material apresenta uma organização em três níveis:

```text
Procedimento principal
        ↓
Procedimentos de serviço
        ↓
Procedimentos utilitários
```

Os procedimentos de serviço oferecem funcionalidades do sistema, enquanto procedimentos utilitários podem ser compartilhados pelos procedimentos de serviço.

O acesso aos serviços do SO pode ocorrer por meio de uma chamada ao sistema, como uma **SVC (Supervisor Call)**.

### Características importantes

- núcleo grande;
- componentes fortemente integrados;
- bom tempo de resposta;
- menor isolamento entre componentes;
- chamadas aos serviços do SO por mecanismos como SVC.

---

## 14. Sistemas em camadas

Em um sistema em camadas, o SO é organizado em níveis.

Cada camada utiliza os serviços fornecidos pela camada inferior.

A ideia geral é:

```text
Camadas superiores
        ↓
Camadas intermediárias
        ↓
Camadas inferiores
        ↓
Hardware
```

Uma camada superior faz chamadas para a camada imediatamente inferior, até chegar aos níveis responsáveis pela interação com o hardware.

---

# Microkernel, Máquinas Virtuais e Exokernel

## 15. Microkernel

Em uma arquitetura de **microkernel**, apenas uma parte mínima das funcionalidades permanece no núcleo.

Grande parte dos serviços do SO é executada em processos no espaço de usuário.

O núcleo estabelece a comunicação entre esses processos.

A organização possui uma ideia semelhante ao modelo **cliente-servidor**.

### Comunicação

Os processos/servidores se comunicam com o microkernel por meio de **troca de mensagens (message passing)**.

### Vantagem

Como os componentes ficam mais isolados, uma falha em um serviço pode não comprometer o núcleo inteiro.

Exemplo citado no material:

> Se um servidor de arquivos falhar, isso não necessariamente afeta o kernel.

---

# Máquinas Virtuais

## 16. O que são máquinas virtuais?

Uma máquina virtual cria uma representação de uma máquina de hardware sobre uma máquina física.

Isso permite executar diferentes sistemas operacionais de maneira isolada sobre o mesmo hardware físico.

A camada responsável por fornecer essa virtualização é o **monitor de máquina virtual / hypervisor**.

---

## 17. Máquina virtual — Tipo 1

No **Tipo 1**, o hypervisor/monitor executa diretamente sobre o hardware.

Estrutura:

```text
Hardware
   ↓
Hypervisor / Monitor
   ↓
Hardware virtual
   ↓
Guest OS
   ↓
Aplicações
```

Exemplo citado no material:

- ESX Server.

---

## 18. Máquina virtual — Tipo 2

No **Tipo 2**, existe um sistema operacional hospedeiro (**Host OS**) entre o hardware e o hypervisor.

Estrutura:

```text
Hardware
   ↓
Host OS
   ↓
Hypervisor
   ↓
Hardware virtual
   ↓
Guest OS
   ↓
Aplicações
```

Exemplo citado no material:

- VMware Workstation.

### Host OS x Guest OS

- **Host OS:** sistema operacional que está executando diretamente sobre o computador físico.
- **Guest OS:** sistema operacional executado dentro da máquina virtual.

---

# Exokernel

## 19. O que é Exokernel?

O **Exokernel** é um kernel minimalista cujo objetivo principal é realizar a **multiplexação segura e a proteção dos recursos de hardware**.

Em vez de fornecer diretamente abstrações tradicionais de alto nível, o Exokernel deixa grande parte dessas abstrações para o espaço de usuário.

### Ideia principal

```text
Hardware
   ↓
Exokernel
   ↓
LibOS / aplicações
```

O kernel concentra-se em:
- proteger os recursos;
- dividir/multiplexar os recursos entre os programas;
- permitir acesso seguro ao hardware.

### LibOS

As abstrações tradicionais podem ser implementadas por bibliotecas no espaço de usuário, chamadas de **LibOS (Library Operating System)**.

---

# Containers

## 20. O que são containers?

Containers fornecem **isolamento em nível de processo**.

Diferentemente das máquinas virtuais, containers **não possuem um kernel próprio**.

Eles compartilham o **kernel do sistema operacional hospedeiro**.

### Mecanismos de isolamento

O material cita recursos como:

- **namespaces**
- **cgroups**
- **SELinux**

Esses mecanismos ajudam a isolar processos e controlar os recursos utilizados pelos containers.

### Estrutura simplificada

```text
Hardware
   ↓
Host OS / Kernel
   ↓
┌──────────────┬──────────────┐
│ Container A  │ Container B  │
│ processos    │ processos    │
│ bibliotecas  │ bibliotecas  │
└──────────────┴──────────────┘
```

Cada container pode possuir seu próprio conjunto de bibliotecas e componentes de espaço de usuário, mas todos compartilham o kernel do hospedeiro.

### Containers x Máquinas Virtuais

| Característica | Máquina Virtual | Container |
|---|---|---|
| Kernel próprio | Sim | Não |
| Compartilha kernel do host | Não | Sim |
| Isolamento | Máquina/OS virtualizado | Processo |
| Custo de virtualização | Maior | Menor |
| Pode executar OS completamente diferente do host | Sim | Não, devido ao kernel compartilhado |

### Limitação importante

Como os containers compartilham o kernel do hospedeiro, uma instabilidade no kernel pode afetar todos os containers.

---

# Pontos que merecem atenção na prova

## Diferenças fundamentais

### Abstração de máquina x gerenciamento de recursos

**Abstração de máquina:**
> Esconde a complexidade do hardware e fornece uma interface mais simples.

**Gerenciamento de recursos:**
> Controla, protege, aloca e libera os recursos físicos e abstratos do sistema.

---

### Multiprogramação x Timesharing

**Multiprogramação:**
> Mantém vários programas disponíveis e aproveita a CPU enquanto outro espera E/S.

**Timesharing:**
> Compartilha a CPU por fatias de tempo entre programas/usuários.

---

### Monoprogramável x Multiprogramável

**Monoprogramável:**
> Um programa por vez.

**Multiprogramável:**
> Vários programas compartilham os recursos do sistema.

---

### Monotarefa x Multitarefa

**Monotarefa:**
> Uma tarefa por vez.

**Multitarefa:**
> Mais de uma tarefa pode executar de forma concorrente.

---

### Microkernel x Monolítico

**Monolítico:**
> Grande parte dos serviços está integrada ao kernel.

**Microkernel:**
> O kernel mantém apenas as funções essenciais e muitos serviços executam no espaço de usuário.

---

### Máquina virtual x Container

**Máquina virtual:**
> Virtualiza uma máquina completa e pode executar um guest OS próprio.

**Container:**
> Isola processos, mas compartilha o kernel do host.

---

### Hypervisor Tipo 1 x Tipo 2

**Tipo 1:**

```text
Hardware
↓
Hypervisor
↓
Guest OS
```

**Tipo 2:**

```text
Hardware
↓
Host OS
↓
Hypervisor
↓
Guest OS
```

---

### Exokernel x Microkernel

**Microkernel:**
> Minimiza as funções do kernel e desloca serviços do SO para o espaço de usuário, usando comunicação entre processos.

**Exokernel:**
> Minimiza o kernel concentrando-se principalmente na proteção e multiplexação segura do hardware, deixando abstrações tradicionais para o espaço de usuário/LibOS.
