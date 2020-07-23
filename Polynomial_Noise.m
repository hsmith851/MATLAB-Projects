
figure(1)
graphsetup

x = 0.9999975:0.000000125:1.0000015;   x = x';

y1 = (x-1).^3;
y2 = x.^3 - 3*x.^2 + 3*x -1;
y3 = ((x-3).*x+3).*x-1;

plot(x,y1,'*',x,y2,'p',x,y3,'+','Markersize',10)

axis([0.9999975 1.0000015 -6e-16 6e-16])
legend('(x-1)^3','x^3-3*x^2+3*x-1','((x-3)*x+3)*x-1', ...
       'Location','NorthWest')
title('Noise in Polynomial Evaluation')
xlabel('\fontsize{20} x')

save2pdf('Noise_Poly_Eval.pdf',1,300)



