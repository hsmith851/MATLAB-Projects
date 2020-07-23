function x = mytrige(a,b,c,f)
n = length(b); % determine system size
x = zeros(n,1); % allocate x
for i = 1:n-1 % forward eliminatiosweep GE
m = a(i+1)/b(i); % compute multiplier
b(i+1) = b(i+1)-m*c(i); % b (but not c) is affected in row operation
f(i+1) = f(i+1)-m*f(i); % row op applied to RHS
end
x(n) = f(n)/b(n); % back substitution
for i = n-1:-1:1
x(i) = (f(i)-c(i+1)*x(i+1))/b(i)
end
