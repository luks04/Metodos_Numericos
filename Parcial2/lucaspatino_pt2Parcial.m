% Biseccion
clear;
clc;
syms x;
f = (6*exp(sin(x-5)))/((0.2*(x-5)^2)+(exp(sin(x-5))))-0.5; % f(x)
% Se utiliza la derivada de la función para encontrar la raíz del punto máximo
df = diff(f,1); % f'
a = 3; % 3 Unidades Producidas?
b = 9; % 9 Unidades Producidas?
errorT = 1e-14; % Error de tolerancia
xi = (a+b)/2;
errorA = abs(b-a);
n = ceil(log((b-a)/errorT)/log(2));
while (errorA>errorT)
   x = xi;
   fxi = eval(df);
   x = a;
   fa = eval(df);
   if(fa*fxi<=0)
       b = xi;
   else
       a = xi;
   end
   xi = (a+b)/2;
   errorA = abs(b-a);
end
fprintf('La raíz es ≈');
disp(xi);

fprintf('a) ¿Cuál es el número de unidades producidas que generen una demanda máxima?\n');
fprintf('Entonces \n\tDemanda = max cuando, \n\tUnidades producidas =');
disp(round(xi));