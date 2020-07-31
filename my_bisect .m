function [root,vals,numiters,ierr] = my_bisect(f,a,b,tol,itermax)
%
% MY_BISECT:  [root,vals,iternums,ierr] = my_bisect(f,a,b,tol,itermax)
%
%        f - a declared anonymous function, e.g. 'f = @(x) x.^2 - 3';
%        a - one endpoint of the initial interval 
%        b - the other endpoint of the initial interval
%        tol - stopping critera 
%        itermax - maximum number of iterations
%
% Output: root     - approximate root of f
%         vals     - a history of the iterations
%         numiters - number of iterations
%         ierr     - error flag:  0 - no error
%                                1 - f(a)*f(b) >= 0
%                                2 - itermax reached


format long e

ierr = 0;
a_cur = a; fa = f(a_cur);
b_cur = b; fb = f(b_cur);

if (fa*fb >= 0)
   root = []; vals = []; numiters = []; ierr = 1;
   disp('Error:  f(a)*f(b) >= 0 ')
   return
end

numiters = ceil(log2((b-a)/tol));

if (numiters > itermax)
   root = []; vals = []; ierr = 2;
   disp('Error: numiters exceeds itermax ')
   return
end
    
vals = zeros(numiters,2);

for i = 1:numiters
    x_cur = (a_cur+b_cur)/2; 
    fx = f(x_cur); 
    vals(i,1) = x_cur;  vals(i,2) = fx;
    if (fa*fx >= 0)
       a_cur = x_cur;
       fa = fx;
    else
       b_cur = x_cur;
       fb = fx;
    end 
end

disp(' ')
disp('            x_n                       f(x_n) ')
disp('    ------------------------------------------------ ')
disp(vals)
disp(' ')

root = x_cur;
      
         