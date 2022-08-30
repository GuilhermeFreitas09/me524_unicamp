source("01_pseudo_random_numbers/functions.R")

list.files()

# Geradores congruenciais

test <- cong_gen()

get_period(test)

test <- cong_gen(m=63)

get_period(test)

# Gerador congruencial multiplicativo

test <- cong_gen_mult()

get_period(test)

test <- cong_gen_mult(m=16, a=4)

get_period(test)











