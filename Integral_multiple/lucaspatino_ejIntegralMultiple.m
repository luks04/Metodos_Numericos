clear;
clc;
syms x y;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = exp(x/y); % f(x)
% Extremos
a = 0.1;
b = 0.5;
c = x^3; % c(x)
d = x^2; % d(x)
% Enteros positivos
n = 10;
m = 10;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
j1 = 0;
j2 = 0;
j3 = 0;

for i=0:n
    x = a+(i*h);
    hx = (eval(d)-eval(c))/m;
    y = eval(c);
    f1 = eval(f);
    y = eval(d);
    f2 = eval(f);
    k1 = f1+f2;
    k2 = 0;
    k3 = 0;
    for j=1:m-1
        y = eval(c)+j*hx;
        q = eval(f);
        if mod(j,2) == 0
            k2 = k2+q;
        else
            k3 = k3+q;
        end
    end
    l = ((k1+(2*k2)+(4*k3))*hx)/3;
    if i==0 || i==n
        j1 = j1+l;
    else
        if mod(j,2) == 0
            j2 = j2+l;
        else
            j3 = j3+l;
        end
    end
end

j = ((j1+(2*j2)+(4*j3))*h)/3;

fun = @(x,y) exp(x./y);
ymin = @(x) x.^3;
ymax = @(x) x.^2;
integ = integral2(fun,a,b,ymin,ymax);
fprintf('Resultado integral:');
disp(integ);

fprintf('Resultado del algoritmo:');
disp(j);