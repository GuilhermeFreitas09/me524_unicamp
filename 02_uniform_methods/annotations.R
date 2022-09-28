# inversion method

## exponential

func <- function(u, lambda=0.5){
  
  x = -log(1-u)/lambda
  
  return(x)

}

vec = sapply(runif(1000), func)

hist(vec)

## weibull

func <- function(u, beta=0.5){
  
  x = -(log(1-u))^(1/beta) # ou x = log(1/(1-u))^(1/beta)
  
  return(x)
  
}

vec = sapply(runif(1000), func)

hist(vec)

# rejection method

