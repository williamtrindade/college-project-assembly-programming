; Implemente um programa que calcula o valor do n-ésimo número de Fibonacci,
; dado um número n em uma posição de memória. O resultado deve ser impresso na saída.

JMP start

numero:    DB 4         ; posição de memória com n (exemplo)
resultado: DB 0         ; onde o resultado será armazenado

;---------------------------------------------
; Início do programa
;---------------------------------------------

start:
    MOV A, [numero]      ; A = n
    CMP A, 0
    JZ fib_zero          ; se n == 0
    CMP A, 1
    JZ fib_um            ; se n == 1

    ; inicializa
    MOV B, 0             ; f0 = 0
    MOV C, 1             ; f1 = 1
    MOV D, 2             ; contador i = 2

loop_fib:
    CMP D, [numero]      ; compara i com n
    JA fim_fib           ; se i > n, termina
    MOV A, B
    ADD A, C             ; A = f0 + f1
    MOV B, C             ; f0 = f1
    MOV C, A             ; f1 = novo valor
    INC D
    JMP loop_fib

fim_fib:
    MOV [resultado], C   ; salva o resultado
    JMP imprime

fib_zero:
    MOV [resultado], 0
    JMP imprime

fib_um:
    MOV [resultado], 1
   JMP imprime

;converte o [numero] em ascii e imprime na saída
imprime:

MOV A, [resultado]
DIV 10
MUL 10
MOV B, [resultado]
SUB B, A
ADD B, 48
MOV [234], B ;escreve o 1º digito

;extrai o 2º dígito
DIV 10 ;divido por 10 para voltar a ter 21
MOV [resultado], A ;salvo no número, pois vamos precisar do REG_A
DIV 10    ;calculo do resto -> divide por 10
MUL 10 	  ;multiplica por 10
MOV B, [resultado]
SUB B, A  ; subtraio do numero original
ADD B, 48 ; transformo o dígito em ascii
MOV [233], B

;extrai o 3º dígito
DIV 10
ADD A, 48
MOV [232], A
HLT
	