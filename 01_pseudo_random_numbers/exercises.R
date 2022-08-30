source("01_pseudo_random_numbers/functions.R")

# 2.4

vec = cong_gen(a=1013, c=0, m=1)

get_period(vec) # não foi possível encontrar o período

vec = cong_gen(a=1013, c=0, m=10^5, n=10000)

get_period(vec) # período igual a 5000

vec = cong_gen(a=1013, c=0, m=2^16, n=100000)

get_period(vec) # período igual a 16384

# 2.5

## a

vec = cong_gen(a=29, c=17, m=64)

print(vec)

get_period(vec) # período igual a 64

## b

vec = cong_gen(a=9, c=1, m=64, n = 100000)

print(vec)

get_period(vec) # período igual a 64

## c

vec = cong_gen(a=13, c=0, m=64, n = 10000)

print(vec)

get_period(vec) # período igual a 16

## d

vec = cong_gen(a=11, c=0, m=64, n = 100000)

print(vec)

get_period(vec) # período igual a 16

# 2.6

vec = cong_gen_mult(m=67, a=10, n = 10000)
print(vec)
get_period(vec) # período igual a 33

vec = cong_gen_mult(m=67, a=12, n = 10000)
print(vec)
get_period(vec) # período igual a 66

vec = cong_gen_mult(m=67, a=16, n = 10000)
print(vec)
get_period(vec) # período igual a 33

vec = cong_gen_mult(m=67, a=18, n = 10000)
print(vec)
get_period(vec) # período igual a 66

# 2.7

## (aX_{i-1}+c) mod (r^b + s((aX_{i-1}+c) div r^b)) < (1+s)(r^b - s)
