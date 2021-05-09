clear;
clc;
syms x;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = (log10(1+x))/x;
% Extremos
a = 1;
b = 2;
% Entero positivo par
n = 62;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
xi = 0;
for i=1:n-1
    xi =xi+(h/2)*(eval(subs(f,(a+(i-1)*h)))+eval(subs(f,(a+(i)*h))));
end

fun = @(x) (log10(1+x))./x;
q = integral(fun,1,2);
fprintf('Resultado integral:');
disp(q);
fprintf('Aproximación integral por la regla del trapecio:');
disp(xi);