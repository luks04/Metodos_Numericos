clear;
clc;

fprintf('Al ser una integral impropia, no es posible evaluar la integral en el punto b=1');
fprintf('\npuesto que f = exp(1)/(sqrt(1-(1)^2))');
fprintf('\n           f = exp(1)/(sqrt(1-1))');
fprintf('\n           f = exp(1)/(sqrt(0))');
fprintf('\n           f = exp(1)/0');
fprintf('\n           f = inf');
fprintf('\nEs por esto que es necesario resolver la integral por el método de Simpson Compuesta\n');

syms x;
%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = exp(x)/(sqrt(1-x^2));
% Extremos
a = 0;
b = 0.99808;
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

fun = @(x) exp(x)./((1-x.^2).^(1./2));
q = integral(fun,0,1);
fprintf('\nResultado integral por función de Matlab:');
disp(q);
xi = h/3*(xi0+(2*xi2)+(4*xi1));
fprintf('El área aproximada bajo la curva de la función exp(x)/(sqrt(1-x^2))\n');
fprintf('resulta por el método de Simpson Compuesta es:');
disp(xi);