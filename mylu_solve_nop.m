function x = mylu_solve_nop(a,b)
%
%  MYLU_SOLVE_NOP solves Ax=b where
%  A = LU, stored 'logically' in a 
%
n = size(a,1); x = zeros(n,1); z = zeros(n,1);

z(1) = b(1);   
for i = 2:n        % forward-sub solve Lz = b
    s = b(i);     
    for j = 1:i-1
        s = s-a(i,j)*z(j);
    end
    z(i) = s;
end

x(n) = z(n)/a(n,n);
for i = n-1:-1:1    % back-sub solve Ux = z
    s = z(i);
    for j = i+1:n
        s = s-a(i,j)*x(j);
    end
    x(i) = s/a(i,i);
end
