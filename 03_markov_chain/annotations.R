log_exp_target = function(x){
  return(dexp(x,rate=1, log=TRUE))
}


asyMCMC = function(log_target, niter, startval, proposalsd){
  x = rep(0,niter)
  x[1] = startval     
  for(i in 2:niter){
    currentx = x[i-1]
    proposedx = rnorm(1,mean=currentx,sd=proposalsd) 
    A = exp(log_target(proposedx) - log_target(currentx))
    if(runif(1)<A){
      x[i] = proposedx       # accept move with probabily min(1,A)
    } else {
      x[i] = currentx        # otherwise "reject" move, and stay where we are
    }
  }
  return(x)
}


z1=easyMCMC(log_exp_target, 1000,3,1)
z2=easyMCMC(log_exp_target, 1000,1,1)
z3=easyMCMC(log_exp_target, 1000,5,1)

plot(z1,type="l")
lines(z2,col=2)
lines(z3,col=3)


