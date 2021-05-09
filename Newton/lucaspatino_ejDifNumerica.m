clear;
clc;
syms x;

f = x*exp(x);
zita = 2.2;

x0 = [2 2.1 2.2]; % Entrada
fx0 = [14.778112 17.148957 19.855030]; % Entrada
poli = 0;
Lx = 1;
for i=1:length(x0)
    Lx = 1;
    for j=1:length(x0)
        if j ~= i
            Lx = Lx*(x-x0(j))/(x0(i)-x0(j));
        end
    end
    poli = poli+fx0(i)*Lx;
    eval(subs(poli,x0(i)));
end
% Punto a
fprintf('Punto a \n polinomio = ');
disp(poli);

x = x0;
z = eval(poli);
p = linspace(0,2,7);
plot(x,z,'*'), hold on
plot(x,z)

dddfx0 = diff(f,3);
ddddfx0 = diff(f,4);

h = 0.1;

% Punto b
fprintf('\nPunto b');
dfx0 = (1/2*h)*(-(3*eval(subs(f,2)))+(4*eval(subs(f,2+h)))-(eval(subs(f,2+(2*h)))))+(((h*h)/3)*eval(subs(dddfx0,zita)));
disp(dfx0);

% Punto c
fprintf('\nPunto c');
ddfx0 = (1/(h*h))*((eval(subs(f,2-h)))-(2*eval(subs(f,2)))+(eval(subs(f,2+h))))-(((h*h)/3)*eval(subs(ddddfx0,zita)));
disp(ddfx0);



