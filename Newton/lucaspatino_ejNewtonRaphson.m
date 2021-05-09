syms x;
f = ((1-x)*((3+x)^(1/2)))/(x*(x+1)^(1/2)*(5^(1/2)))-3.06; % Entrada
x0 = 0.2; % Entrada
errorT = 10e-5; % Error de tolerancia
errorA = 0.1;
while (errorA>errorT)
    x = x0;
    f0 = eval(f);
    fx = eval(diff(f,1));
    x1 = x-(f0/fx);
    x0 = x1;
    errorA = abs(x0-x1);
end
y = x1;
disp("La raíz es ");
y