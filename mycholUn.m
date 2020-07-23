function U = mycholUn(A)
%

n = size(A,1); U = zeros(n);

for j = 1:n
for i = 1:j-1
s = A(i,j);
for k = 1:i-1
s = s - U(k,i)*U(k,j);
end
U(i,j) = s/U(i,i);
end
s = A(j,j);
for k = 1:j-1
s = s - U(k,j)^2;
end
U(j,j) = sqrt(s);
end