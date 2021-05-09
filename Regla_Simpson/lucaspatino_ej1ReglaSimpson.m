clear;
clc;
syms x;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = 1/(2+cos(x));
% Extremos
a = 0;
b = pi;
% Entero positivo par
n = 32;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
xi0 = eval(subs(f,a))+eval(subs(f,b));
xi1 = 0; % Suma de f(x2i-1);
xi2 = 0; % Suma de f(x2i);

for i=1:n-1
    x = a+(i*h);
    if mod(i,2) == 0
        xi2 = xi2 + eval(f);
    else
        xi1 = xi1 + eval(f);
    end
end

fun = @(x) 1./(2+cos(x));
q = integral(fun,0,pi);
fprintf('Resultado integral:');
disp(q);
xi = h/3*(xi0+(2*xi2)+(4*xi1));
fprintf('Aproximación integral por la regla de Simpson:');
disp(xi);