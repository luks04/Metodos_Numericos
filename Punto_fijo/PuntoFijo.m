function y=PuntoFijo()
syms x;
f = x^2-2; % Entrada
x0 = 1.41; % Entrada
g = (2/(x-1))-(x/(x-1)); % Entrada
errorT = 10e-5; % Error de tolerancia
errorA = 0.1;
while (errorA>errorT)
    x = x0;
    x1 = eval(g);
    x0 = x1;
    errorA = abs(x1-x0);
end
y = x1;