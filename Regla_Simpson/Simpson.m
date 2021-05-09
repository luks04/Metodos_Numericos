function y=Simpson()
syms x
%f = 1/(2+cos(x));
f = exp(x)/((1-x^2)^(1/2));
%a = 0;
%b = pi;
a = 0;
b = 0.9;
n= 32;
h = (b-a)/n;
x = [a,b];
fx = eval(f);
XI0 = fx(1)+fx(2);
XI1 = 0;% suma de las partes impares
XI2 = 0;% suma de las partes pares
for i=1:n-1 
    x = a+h*i;
    if rem(i,2)==0
        XI2 = XI2 + eval(f);        
    else
       XI1 = XI1 + eval(f);
    end
    XI = h*(XI0 + 2*XI2 + 4*XI1)/3;
    y=XI;
end
   %para agregar a la tabla de valores hallados
   fprintf(' -----------------------------------\n');
   fprintf(' Los resultados obtenidos son:\n');
    fprintf(' -----------------------------------\n');
   fprintf('        | XI | \n');
    fprintf('| %11.3d | \n',XI);
end
