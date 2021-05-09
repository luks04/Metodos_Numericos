function y=Trapecio()
syms x;
f = (log10(1+x))/x;
a = 1;
b = 2;
n= 62;
h = (b-a)/n;
x = [a,b];
fx = eval(f);
XI0 = fx(1)+fx(2);
XI1 = 0;% suma de las funciones entre los extremos
for i=1:n-1 
    x = a+h*i;
     XI1 = XI1 + eval(f);
end
  XI = h*(XI0 + 2*XI1)/2;
    y=XI;
   %para agregar a la tabla de valores hallados
   fprintf(' -----------------------------------\n');
   fprintf(' Los resultados obtenidos son:\n');
   fprintf(' -----------------------------------\n');
   fprintf('|     XI        | \n');
   fprintf('| %11.3d   | \n',XI);
end