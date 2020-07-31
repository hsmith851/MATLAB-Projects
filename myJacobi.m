
function [xvecs,N,P] = myJacobi(A,b,x0,iters)
%
n = size(A,1); xvecs = zeros(n,iters+1);
xvecs(:,1) = x0; 

D = diag(diag(A)); 
L = tril(A,-1); U = triu(A,1);

N = D; P = -(L+U);

for k = 1:iters     
    xk   = xvecs(:,k);
    xkp1 = N\(P*xk+b);
    xvecs(:,k+1) = xkp1;
end
        
        
