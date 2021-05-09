clear;
clc;
syms w t;

%%%%%%%%%%%%%%%%% Entradas %%%%%%%%%%%%%%%%%%%%%%%
fun = w-t^2+1;
a = 0;
b = 2;
n = 10;
alpha = 0.5;
%%%%%%%%%%%%%%%%% Algoritmo %%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/n;
t = a;
w = alpha;
% z(1,:) = [t,w];

for i=1:n
    f = eval(fun);
    w = w+h*f;
    t = a+i*h;
    disp(t);
    disp(w);
    % z(i+1,:) = [t,w];
end

% plot(z);
