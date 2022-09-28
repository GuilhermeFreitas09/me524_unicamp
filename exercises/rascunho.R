# 6

'

0 - Defina um vetor de tamanho N
1 - Faça k = N
2 - Gere uma amostra j da geométrica
3 - Arrume os valores do vetor até a posição j
4 - Se j = N, pare o programa e retorne o vetor. C.c,
    faça k = k - j e volte ao passo 2.

Esse algoritmo é eficiente pois não precisamos gerar v.a por v.a

'

## Geométrica

func_geo <- function(p) {
    u <- runif(1)
    x <- as.integer(log(u) / log(1 - p)) + 1
    return(x)
}

## Bernoulli

n <- 25
sample <- c()
len <- n
qtd <- 0

while (len > 0) {
    j <- func_geo(p <- 0.8) # j iterações para conseguir o primeiro sucesso

    if (j <= len) {
        vec <- rep(0, j)
        vec[j] <- 1
    }else {
        vec <- rep(0, len)
    }

    sample <- append(sample, vec)

    qtd <- qtd + 1

    len <- len - j # já amostramos j variáveis

}

print(paste("Quantidade necessária:", qtd))

table(sample)

print(sample)