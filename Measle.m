% Hien Le
% Jun 29 2017

function [S,I,V,t] = SIVR(S0,I0,V0,t0,p,beta,mu,sigma,c,n)

S = zeros(n, 1);
I = zeros(n, 1);
V = zeros(n, 1);
t = zeros(n, 1);

S(1, 1) = S0;
I(1, 1) = I0;
V(1, 1) = V0;
t(1, 1) = t0;

for i = 1:n
    
    r1 = rand;
    r2 = rand;
    
    alpha1 = beta*I(i,1)*S(i,1)/N;
    alpha2 = alpha1 + sigma*beta*V(i,1)*I(i,1)/N;
    alpha3 = alpha2 + c*I(i,1);
    alpha4 = alpha3 + (1-p)*mu*S(i,1);
    alpha5 = alpha4 + p*mu*I(i,1);
    alpha6 = alpha5 + (1-p)*mu*I(i,1);
    alpha7 = alpha6 + p*mu*V(i,1);
    alpha8 = alpha7 + p*mu*(N-I(i,1)-S(i,1)-V(i,1));
    alpha9 = alpha8 + (1-p)*mu*(N-I(i,1)-S(i,1)-V(i,1));
    
    tau = -log(r1)/alpha9;
    
    t(i+1,1) = t(i,1)+tau;
    
    if(0 <= r2 && r2 < (alpha1/alpha9))
        
        S(i+1, 1) = S(i, 1) - 1;
        I(i+1, 1) = I(i, 1) + 1;
        R(i+1, 1) = R(i, 1);
        
    elseif ((alpha1/alpha0) <= r2 && r2 < (alpha2/alpha0))
        
        S(i+1, 1) = S(i, 1);
        I(i+1, 1) = I(i, 1) + 1;
        R(i+1, 1) = R(i, 1) - 1;
        
    elseif (alpha2/alpha0 <= r2 && r2 < alpha3/alpha0)
        
        I(i+1, 1) = I(i, 1) - 1;
        S(i+1, 1) = S(i, 1) + 1;
        
    else
        
        I(i+1, 1) = I(i, 1);
        S(i+1, 1) = S(i, 1) + 1;
        
    end;

end;