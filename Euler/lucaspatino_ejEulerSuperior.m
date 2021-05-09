clear;
clc;
syms w1 w2 t;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
f = exp(2*t)*sin(t)+2*w2-2*w1;
a = 0;
b = 1;
n = 10;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
t = a;
w1 = -0.4;
w2 = -0.6;
z(1,:) = [t,w1];
for i=1:n
    w1 = w1+h*w2;
    fun = eval(f);
    w2 = w2+h*fun;
    t = a+i*h;
    z(i+1,:) = [t,w1];
end
disp(z);
plot(z(:,1),z(:,2));