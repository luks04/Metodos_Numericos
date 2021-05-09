% Muller
clear;
clc;
syms x;
f = (6*exp(sin(x-5)))/((0.2*(x-5)^2)+(exp(sin(x-5))))-0.5; % f(x)
errorT = 1e-14; % Error de tolerancia
x0 = 0; % 0 Unidades Producidas?
x1 = 5; % 5 Unidades Producidas?
x2 = 10; % 10 Unidades Producidas?
i=1;
errora(1) = 1;

while(errora(i)>errorT)
    h0=x1-x0;
    h1=x2-x1;
    if h1 == 0 || h0 == 0
        break
    else
    x = [x0 x1 x2];
    fx = eval(f);
    d0 = (fx(2)-fx(1))/h0;
    d1 = (fx(3)-fx(2))/h1;
    % Hallando las constantes
    a=(d1-d0)/(h1+h0);
    b=a*h1+d1;
    c=fx(3);
    raizd=sqrt(b*b-4*a*c);
    end
    %-----------------------------------------------------%
    if abs (b+raizd)> abs(b-raizd)
        den=b+raizd;
    else
        den=b-raizd;
    end
    %-----------------------------------------------------%
    dxr=-2*c/den;
    xr(i)=x2+dxr;
    et=abs((xr-x2)/xr);
    x0=x1;
    x1=x2;
    x2=xr(i);   
    i=i+1; 
    errora(i)=et*100;  
end
   % Para agregar a la tabla de valores hallados
   fprintf(' -----------------------------------\n');
   fprintf(' Los resultados obtenidos son:\n');
    fprintf(' -----------------------------------\n');
   fprintf('| i            x2(i)   Error aprox(i)| \n');
for j=1:i-1
    fprintf('|%2d \t %11.3d \t %11.3d| \n',j-1,xr(j),errora(j));
end

fprintf('\n');
fprintf('La raíz es ≈');
% Se toma el último valor de la tabla
disp(xr(j));

fprintf('a) ¿Cuál es el número de unidades producidas que generen demanda D=0?\n');
fprintf('Entonces \n\tDemanda = 0 cuando, \n\tUnidades producidas =');
disp(ceil(xr(j)));