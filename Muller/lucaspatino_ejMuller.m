clear;
clc;
syms x;
f = (x^3)-(13*x)-12; % Entrada
x0 = 4.5; % Entrada
x1 = 5.5; % Entrada
x2 = 5; % Entrada
%errorT = (10e-8)*100; % Error de tolerancia
errorT = 5;
%errorR = 100;
errorR = 8;
while (errorR>errorT)
    fx0 = subs(f,x0);
    fx1 = subs(f,x1);
    fx2 = subs(f,x2);
    h0 = x1-x0;
    h1 = x2-x1;
    d0 = (fx1-fx0)/(h0);
    d1 = (fx2-fx1)/(h1);

    a = (d1-d0)/(h1-h0);
    b = (a*h1)+d1;
    c = fx2;

    dis = sqrt((b^2)-(4*a*c));
    x3 = x2 - ((2*c)/(b+dis));
    %errorR = abs((x3-x2)/x3)*100; % Entra en ciclo infinito
    errorR = errorR - 1;
    x0=x1;
    x1=x2;
    x2=x3;
end
eval(x0)
eval(x1)
eval(x2)