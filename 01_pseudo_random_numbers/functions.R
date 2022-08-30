# Função para obter o período

get_period <- function(vec){
  
  # Função que calcula o período de uma sequência de números
  # pseudo aleatórios (não necessariamente gerados por geradores congruenciais)
  
  i = 2; n = length(vec)
  
  if(sum(vec==vec[1]) < 2){
    return("Não foi possível encontrar o período para essa série. Tente aumentar o tamanho do vetor.")
  }
  
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
    return(paste("Periodo igual a ", i-1, sep = ""))
  }else{
    return("Não foi possível encontrar o período para essa série. Tente aumentar o tamanho do vetor.")
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
