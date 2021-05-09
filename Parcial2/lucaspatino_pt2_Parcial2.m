clear;
clc;

fprintf('La siguiente es una integral doble evaluada en puntos fijos en a,b y c\n');
fprintf('mientras que el punto d varía dependiendo del valor de x.\n');
fprintf('Este ejercicio se resuelve mediante el algoritmo de integral múltiple\n');
fprintf('asignando correctamente los valores para a,b,c, y d.\n');

syms x y;
%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = sqrt(x+y); % f(x)
% Extremos
a = 0;
b = 1;
c = 0; % c
d = x; % d(x)
% Enteros positivos
n = 30;
m = 10;
% %%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
j1 = 0;
j2 = 0;
j3 = 0;
for i=0:n
    x = a+h*i;
    hx = (eval(d)-c)/m;
    y = eval(d);
    k11 = eval(f) ;
    y = c;
    k22 = eval(f);
    k1 = k11 + k22;
    k2 = 0;
    k3 = 0;
        for j=1:m-1
            y = c + j*hx;
            q = eval(f);
            if rem(j,2)==0
                k2 = k2 + q;        
            else
                k3 = k3 + q;
            end    
        end
   l = (k1 + 2*k2 + 4*k3)*hx/3;
   if i == 0 || i == n
        j1 = j1 + l;        
      else
         if rem(i,2)==0
            j2 = j2 + l;
         else
            j3 = j3 + l; 
        end
   end   
end
fun = @(x,y) sqrt(x+y);
ymin = 0;
ymax = @(x) x;
integ = integral2(fun,a,b,ymin,ymax);
fprintf('\nResultado integral por función de Matlab:');
disp(integ);

j = (j1 + 2*j2 + 4*j3)*h/3;
fprintf('El área aproximada bajo la curva de la función anterior resulta por el algoritmo de integral múltiple:');
disp(j);