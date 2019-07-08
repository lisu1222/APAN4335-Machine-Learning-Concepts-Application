my.bootstrap.st.error.of.mean <- function(x, B){
  bootstrapped.estimates <- numeric(length = B)
  
  for(b in 1:B){
    x.bootstrapped <- sample(x = x, size = length(x), replace = TRUE)
    bootstrapped.estimates[b] <- mean(x.bootstrapped)
  }
  
  return(sd(bootstrapped.estimates))
}

my.bootstrap.cis.for.mean <- function(x, B, alpha = 0.05){
  all.bootstrapped.values <- sample(x = x, size = B * length(x), replace = TRUE)
  x.bootstrapped <- matrix(data = all.bootstrapped.values, nrow = B)
  
  bootstrapped.estimates <- rowMeans(x = x.bootstrapped)
  
  conf.int <- quantile(x = bootstrapped.estimates, probs = c(alpha/2, 1 - alpha/2))
  return(conf.int)
}

set.seed(19)
x <- rnorm(n = 100, mean = 5, sd = 1.7)
B <- 500

my.bootstrap.st.error.of.mean(x = x, B = B)
my.bootstrap.cis.for.mean(x = x, B = B, alpha = 0.05)
