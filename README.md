# 🧮 Fibonacci em Assembly

Este programa implementa o cálculo do **n-ésimo número da sequência de Fibonacci** em Assembly.  
O valor de `n` é lido de uma posição de memória (`numero`), e o resultado é armazenado em outra (`resultado`), sendo posteriormente convertido para ASCII e exibido na saída.

---

## 📘 Descrição do Programa

A sequência de Fibonacci é definida como:

```
F(0) = 0  
F(1) = 1  
F(n) = F(n-1) + F(n-2), para n ≥ 2
```

O programa segue essa definição e executa o cálculo de forma iterativa, utilizando registradores para armazenar os dois últimos valores da sequência.

---

## 🧩 Estrutura de Memória

| Símbolo     | Tipo | Descrição                                      |
|--------------|------|-----------------------------------------------|
| `numero`     | DB   | Posição de memória onde está o valor de `n`   |
| `resultado`  | DB   | Posição de memória onde será salvo o resultado|

Exemplo:
```asm
numero:    DB 4         ; n = 4
resultado: DB 0
```

---

## ⚙️ Fluxo do Programa

1. **Leitura de n**
   - O programa lê o valor de `n` de `[numero]`.

2. **Casos base**
   - Se `n == 0` → resultado = 0  
   - Se `n == 1` → resultado = 1

3. **Cálculo iterativo**
   - Inicializa:
     ```
     f0 = 0
     f1 = 1
     i = 2
     ```
   - Enquanto `i <= n`, calcula `f = f0 + f1` e atualiza os valores:
     ```
     f0 = f1
     f1 = f
     ```

4. **Armazenamento**
   - O valor final (`f1`) é salvo em `[resultado]`.

5. **Conversão e Impressão**
   - O número é convertido para seus dígitos ASCII e escrito em memória (endereços 232, 233 e 234) simulando a saída.

---

## 🧠 Registradores Utilizados

| Registrador | Função                            |
|--------------|----------------------------------|
| `A`          | Acumulador principal             |
| `B`          | Armazena `f0` e auxilia na saída |
| `C`          | Armazena `f1`                    |
| `D`          | Contador de iteração (`i`)       |

---

## 🖨️ Impressão na Saída

A rotina `imprime:` converte o número calculado em **dígitos ASCII** e os armazena nas posições:
```
[232] → Centena
[233] → Dezena
[234] → Unidade
```

Isso permite visualizar o resultado em formato de caracteres (ex: “021” para o valor 21).

---

## 💻 Exemplo de Execução

**Entrada:**
```asm
numero: DB 4
```

**Processo:**
```
F(0)=0, F(1)=1, F(2)=1, F(3)=2, F(4)=3
```

**Saída:**
```
[resultado] = 3
```

**ASCII gerado:**
```
[232]='0'
[233]='0'
[234]='3'
```

---

## 🧾 Instruções Principais Usadas

| Instrução | Função                                   |
|------------|------------------------------------------|
| `MOV`      | Move dados entre registradores/memória   |
| `ADD`      | Soma valores                            |
| `SUB`      | Subtrai valores                         |
| `CMP`      | Compara valores                         |
| `JZ` / `JA`| Saltos condicionais                     |
| `INC`      | Incrementa registrador                  |
| `DIV`, `MUL` | Divisão e multiplicação para conversão |
| `HLT`      | Finaliza o programa                     |

---

## 🧪 Observações

- O programa foi escrito em Assembly genérico (padrão de didática para microprocessadores simulados).  
- Pode ser adaptado facilmente para simuladores como **EMU8086**, **MARIE**, ou outros ambientes educacionais semelhantes.
- O trecho de impressão é simbólico — em um ambiente real, você pode precisar adaptar para chamadas de sistema (ex: `INT 21h` no DOS).

---

## ✍️ Autor

**William Trindade**  
Projeto acadêmico em Assembly — cálculo de Fibonacci com saída em ASCII.
