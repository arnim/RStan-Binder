data { 
  int<lower=1> n;
  vector[n] x;
}
parameters {
  real mu;
  vector<lower=0>[n] lambda;
} 
transformed parameters {
  vector[n] sigma;
  
  for (i in 1:n)
    sigma[i] <- inv_sqrt(lambda[i]);
}
model {
  mu ~ normal(0, 30); // sqrt(1000) 
  lambda ~ gamma(.001, .001);
  x ~ normal(mu, sigma);
}
