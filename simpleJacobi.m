
function xvecs = simpleJacobi(A,b,x0,iters)
%
n = size(A,1); xvecs = zeros(n,iters+1);
xvecs(:,1) = x0; 

xold = x0; xnew = 0*xold;

for k = 1:iters     

    for i = 1:n
        s = b(i);
        for j = [1:i-1 i+1:n]
            s = s - A(i,j)*xold(j);
        end
        xnew(i) = s/A(i,i);
    end
    xvecs(:,k+1) = xnew;  
    xold = xnew;

end
        
        
