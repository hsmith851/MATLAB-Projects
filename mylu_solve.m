
function x = mylu_solve(a,p,b)
%
n = length(p);
x = zeros(n,1); z = zeros(n,1);

% forward sub solve Lz=b  l_(i,i) = 1
z(1) = b(p(1));
for i = 2:n
    s = 0;
    for j = 1:i-1
        s = s+a(p(i),j)*z(j);
    end
    z(i) = b(p(i))-s;
end

% back sub solve Ux=z
x(n) = z(n)/a(p(n),n);
for i = n-1:-1:1
    s = z(i);
    for j = i+1:n
        s = s-a(p(i),j)*x(j);
    end
    x(i) = s/a(p(i),i);
end