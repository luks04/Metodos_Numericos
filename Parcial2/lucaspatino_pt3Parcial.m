% Interpolacion Lagrange
clear;
clc;
syms x;

x0 = [-2.5 1 2 4 5.5 7 9 11]; % Entrada
fx0 = [-3.66 0 -0.75 2.83 5.7 3.56 -2.72 -3.05]; % Entrada
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
fprintf('a) Calcular el polinomio de interpolación.\n');
fprintf('\tPolinomio: ');
disp(poli);

% Gráfica
x = x0;
z = eval(poli);
p = linspace(0,2,7);
plot(x,z,'*'), hold on
plot(x,z)

fprintf('b) ¿Hay pérdida o ganancia  para un interés de 4 puntos?\n');
fprintf('\tSi el valor de f(x) evaluado en x=4 es mayor a 0 entonces hay ganancias\n');
fprintf('\tSi el valor de f(x) evaluado en x=4 es menor a 0 entonces hay pérdidas\n');
val = eval(subs(poli,4));
fprintf('\tf(4) = ');
disp(val);
fprintf('\t');
if(val > 0)
    disp('Hay ganancias');
else
    disp('Hay pérdidas');
end
fprintf('\n');

% Newton Raphson
% Se utiliza la derivada del polinomio encontrado para encontrar la raíz del punto máximo
f = diff(poli,1);
x0 = 5.5; % Empezar desde 5.5 de Interés porque con este valor se obtiene el valor más alto en la tabla
df = diff(f,1);
errorT = 1e-10; % Error de tolerancia
errora = 1;
while errora>errorT
    x = abs(x0);
    fx0 = eval(f);
    dfx0 = eval(df);
    x1 = x0-fx0/dfx0;
    errora =abs(x0-x1);
x0 = x1;
end

fprintf('c) ¿Para Qué valores del interés se puede estimar un valor de perdida o ganancia máximo?  Utilice el polinomio de interpolación, con un error de tolerancia de 1e-10. \n');
fprintf('La raíz es ≈');
disp(x0);
fprintf('\tSe obtiene un valor de ganancia máximo para un valor de interés de:');
disp(x0);