syms x;
f = ((1-x)*((3+x)^(1/2)))/(x*(x+1)^(1/2)*(5^(1/2)))-3.06; % Entrada
x0 = 0.193; % Entrada
g = (3.06/(((3+x)/(5*(x+1)))^(1/2))-((1/x)-(x+1)));
errorT = 10e-5; % Error de tolerancia
errorA = 0.1;
while (errorA>errorT)
    x = x0;
    x1 = eval(g);
    x0 = x1;
    errorA = abs(x1-x0);
end
y = x1;
disp("La raíz es ");
y