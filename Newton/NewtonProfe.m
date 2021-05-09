function y=NewtonProfe()
syms x
f = (6*exp(sin(x-5)))/((0.2*(x-5)^2)+(exp(sin(x-5))))-0.5; % Entrada
x0 = 10; % Entrada
df = diff(f,1);
errorT = 1e-11;%error de tolerancia
errora = 1;
while errora>errorT
    x = abs(x0);
    fx0 = eval(f)
    dfx0 = eval(df)
    x1 = x0-fx0/dfx0
    errora =abs(x0-x1);
x0 = x1;
end
y=x0;

