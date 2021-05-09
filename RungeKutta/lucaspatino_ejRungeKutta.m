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
w1 = -0.4; % alpha 1
w2 = -0.6; % alpha 2
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
disp(z);
plot(z(:,1),z(:,2));