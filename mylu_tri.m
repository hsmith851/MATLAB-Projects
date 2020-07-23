function x = mylu_tri(a,p,b,f)
% f = right hand side
%function x = mylu_solve(a,p,b)
n = length(a); %Length or array
x = zeros(n,1); %Array of zeros
for i = 1:n-1; %forward-sub
s = a(i+1)/p(i); %S is defined here as a multiplier
p(i+1) = p(i+1)-s*b(i); %Row operation for p value
f(i+1) = f(i+1)-s*f(i); %Row operation for f right hand side
end
x(n) = f(n)/p(n); %Back sub solve Ux=z
for i = n-1:-1:1; %For loop for back subtraction
x(i) = (f(i)-b(i+1)*x(i+1))/p(i); %Right Hand Side
end


