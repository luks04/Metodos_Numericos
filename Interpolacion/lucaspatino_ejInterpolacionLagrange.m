clear;
clc;
syms x;

x0 = [0 10 30 50 70 90]; % Entrada
fx0 = [1.792 1.308 0.801 0.549 0.406 0.317]; % Entrada
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
    eval(subs(poli,x0(i)))
end
y = eval(subs(poli,57));

x = x0;
z = eval(poli);
p = linspace(0,2,7);
plot(x,z,'*'), hold on
plot(x,z)