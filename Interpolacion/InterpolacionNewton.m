function y=InterpolacionNewton() 
clear;
clc;
syms x;
%x=[0.1 0.3 0.5 0.7 0.9 1.1 1.3]; % Entrada
%fx0=[0.9975 0.97763 0.93847 0.88120 0.80752 0.71962 0.62009]; % Entrada

x = [-2.5 1 2 4 5.5 7 9 11]; % Entrada
fx0 = [-3.66 0 -0.75 2.83 5.7 3.56 -2.72 -3.05]; % Entrada

xi=1.3; % Valor con el que se evalua el polinomio
n=length(x);
b=zeros(n);
b(:,1)=fx0(:);

% Obtención de la tabla de diferencias finitas por el metodo de diferencias divididas 
% disp('obtención de la tabla de diferencias finitas')
for j = 2:n
    for i=1:n-j+1
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end   
end
% Calcula el dato interpolado
x1=1;
yi=b(1,1);
for j=1:n-1
    x1=x1.*(xi-x(j));
    yi=yi+b(1,j+i)*x1;
end    
% Construcción del polinomio
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    signo='';
    if b(1,j)>=0
        signo='+';
    end
    x1='';
    for i=1:j-1
        signo2='';
        if xx(i)>=0
            signo2='+';
        end
        x1=strcat(x1,'*(x',signo2,num2str(xx(i)),')');
    end    
    p=strcat(p,signo,num2str(b(1,j)),x1);
end
p
y = inline(p);
disp('El valor de "y" interpolado es igual a:'),disp(yi);
disp('El polinomio es:');

plot(x,fx0,'*'), hold on
plot(x,fx0)