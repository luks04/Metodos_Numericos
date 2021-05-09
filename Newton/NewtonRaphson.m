function y=NewtonRaphson()
clear;
clc;
syms x
f = x^2-2; % Entrada
x0 = 1.5; % Entrada
df = diff(f,1);
errorT = 1e-11;%error de tolerancia
errora = 1;
while errora>errorT
    x = abs(x0);
    fx0 = eval(f);
    dfx0 = eval(df);
    x1 = x0-fx0/dfx0;
    errora =abs(x0-x1);
x0 = x1;
end
y=x0;