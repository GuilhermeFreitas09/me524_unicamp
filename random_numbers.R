# Funções auxiliares

get_period <- function(vec){
  
  # Função que calcula o período de uma sequência de números
  # pseudo aleatórios (não necessariamente gerados por geradores congruenciais)
  
  i = 2; n = length(vec)
  
  found = FALSE
  
  while(i <= n){
    k = vec[i]
    if (k == vec[1]) {
      j = 2*(i - 1)
      if (sum(vec[1:(i-1)] == vec[i:j]) == i-1) {
        found = TRUE
        break
      }
    }
    i = i + 1
  }
  
  if(found){
    print(paste("Periodo igual a ", i-1, sep = ""))
  }
}

# Geradores congruenciais

cong_gen <- function(a = 22, m = 61, c = 5, x1 = 1, n = 1000){
  
  # Gerador congruencial do tipo X_n+1 = (a*X_n + c)%m
  
  vec <- rep(0, n); vec[1] <- x1
  
  for (i in 2:n) {
    vec[i] <- (a*vec[i-1] + c)%%m
  }

  plot(x=vec[1:(n-1)], y=vec[2:n]);
  
  return(vec)
}

test <- cong_gen()

get_period(test)

test <- cong_gen(m=63)

get_period(test)

# Gerador congruencial multiplicativo

cong_gen_mult <- function(m = 13, a = 2, x1 = 1, n = 1000){
  
  # Gerador congruencial do tipo X_n+1 = (a*X_n)%m
  # x1 != 0
  
  vec <- rep(0, n); vec[1] <- x1
  
  for (i in 2:n) {
    vec[i] <- (a*vec[i-1])%%m
  }
  
  plot(x=vec[1:(n-1)], y=vec[2:n]);
  
  return(vec)
}

test <- cong_gen_mult()

get_period(test)

test <- cong_gen_mult(m=16, a=4)

get_period(test)


