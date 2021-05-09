function y=InterpolacionLagrange()
clear;
clc;
syms x;

x0 = [0.1 0.3 0.5 0.7 0.9 1.1 1.3]; % Entrada
fx0 = [0.9975 0.97763 0.93847 0.88120  0.80752 0.71962 0.62009]; % Entrada
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
y = poli;

x = x0;
z = eval(poli);
p = linspace(0,2,7);
plot(x,z,'*'), hold on
plot(x,z)
