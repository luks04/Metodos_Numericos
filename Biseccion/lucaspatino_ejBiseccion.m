syms x;
f = exp(x)-2; % Entrada
a = 0; % Entrada
b = 1; % Entrada
errorT = 10e-8; % Error de tolerancia
xi = (a+b)/2;
errorA = abs(b-a);
n = ceil(log((b-a)/errorT)/log(2));
for i=1:n
   x = xi;
   fxi = eval(f);
   x = a;
   fa = eval(f);
   if(fa*fxi<=0)
       b = xi;
   else
       a = xi;
   end
   xi = (a+b)/2;
end
y = xi;
% Mostrar
disp("El algoritmo se repite "+ n +" veces hasta llegar al error de tolerancia");
disp("La raíz es ");
y