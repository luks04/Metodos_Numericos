clear;
clc;

fprintf("La ecuación diferencial (1+t)y''-y'+5y = e^t*cos(3t)\n");
fprintf("Donde 0<= t <=2 con y'(0)=-4 , y(0)=2\n");
fprintf("Es de grado 3 y es posible resolverla con los métodos de Euler y de Runge Kutta");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Euler %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms w1 w2 t;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = (exp(t)*cos(3*t)+w2-5*w1)/(1+t);
a = 0;
b = 2;
n = 10;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
t = a;
w1 = 2;
w2 = -4;
z(1,:) = [t,w1];
for i=1:n
    w1 = w1+h*w2;
    fun = eval(f);
    w2 = w2+h*fun;
    t = a+i*h;
    z(i+1,:) = [t,w1];
end
fprintf('La ecuación diferencial dada se trata de la siguiente forma (exp(t)*cos(3*t)+w2-5*w1)/(1+t)\n');
fprintf('para obtener un resultado aproximado por el método de Euler\n');
fprintf('\nEuler\n');
disp(z);
subplot(2,2,1);
plot(z(:,1),z(:,2));
title('Euler');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Runge Kutta %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms w1 w2 t;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = (exp(t)*cos(3*t)+w2-5*w1)/(1+t);
a = 0;
b = 2;
n = 10;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
t = a;
w1 = 2;
w2 = -4;
z(1,:) = [t,w1];
for i=1:n
    k11 = h*w2;
    k12 = h*w2;
    k13 = h*w2;
    k14 = h*w2;
    w1 = w1+(k11+2*k12+2*k13+k14)/6;
    w = w1;
    k21 = h*eval(f);
    t = t+h/2;
    w1 = w1 + k21/2;
    k22 = h*eval(f);
    w1 = w + k22/2;
    k23 = h*eval(f);
    w1 = w + k23;
    t = t+h/2;
    k24 = h*eval(f);
    w2 = w2+(k21+2*k22+2*k23+k24)/6;
    
    t = a+i*h;
    z(i+1,:) = [t,w1];
end
fprintf('La ecuación diferencial dada se trata de la misma forma\n');
fprintf('para obtener un resultado aproximado por el método de Runge Kutta el cual suaviza\n');
fprintf('la curva graficada por el método de Euler y se obtiene un resultado más preciso\n');
fprintf('\nRunge Kutta\n');
disp(z);
subplot(2,2,2);
plot(z(:,1),z(:,2));
title('Runge Kutta');