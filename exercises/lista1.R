# 1

set.seed(21)

func <- function(v) {
    return(
        ifelse(v < 1/3, 1, 2)
    )
}

## a

vec <- runif(n=100)

table(sapply(vec, func)) / 100

## b

vec <- runif(n=1000)

table(sapply(vec, func))/1000

## c

vec <- runif(n=10000)

table(sapply(vec, func))/10000

# 2

' # nolint

X (amostra) dado P(X)

'

func  <- function(vec) {

    u <- runif(1)
    n <- length(vec)

    for(i in 1:n){

        mn <- ifelse(i == 1, 0, sum(vec[1:(i-1)])) # mínimo
        mx <- sum(vec[1:i]) # máximo

        if(u >= mn & u < mx){
            break
        }
    }

    return(i)
}


n <- 10000
vec <- rep(0, n)

for (i in 1:n) {
    vec[i] <- func(c(1/6, 1/3, 1/2))
}

table(vec) / n

# 3

n <- 10000
vec <- rep(0, n)

for(i in 1:n){
    vec[i] <- func(c(0.3, 0.2, 0.35, 0.15))
}

table(vec) / n

print(vec)

# 4

## Função para gerar a permutação

func <- function(vec) {
    n <- length(vec)
    for (k in seq(n, 1, -1)){
        u <- runif(1)
        i <- as.integer(k * u) + 1
        rec <- vec[k]
        vec[k] <- vec[i]
        vec[i] <- rec
    }
    return(vec)
}

## Simulação

n <- 10000
vec0 <- 1:100
hits <- rep(0, n)

for (i in 1:n) {

    vec <- func(vec0)
    hits[i] <- sum(vec == vec0)

}

print(paste("media:", mean(hits)))
print(paste("var:", var(hits)))

hist(hits)

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

# 7

