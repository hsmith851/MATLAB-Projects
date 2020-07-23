function [a,p] = mylu(a)
%
%  MY_LU compute LU decompostion with partial pivoting
%
n = size(a,1);
p = (1:n)';         % initialize pivot vector

for k = 1:n-1
    [~,pind] = max(abs(a(p(k:n),k)));  % find pivot index
    pind    = pind+k-1;                % account for offset
    pval    = p(k);                    % pivot vec interchage
    p(k)    = p(pind);                
    p(pind) = pval;                 
    for i = k+1:n                      % GE row loop 
        m = a(p(i),k)/a(p(k),k);       % multiplier
        a(p(i),k) = m;                 % store multiplier
        for j = k+1:n                         
            a(p(i),j) = a(p(i),j)-m*a(p(k),j);
        end               
    end                                  
end
        
