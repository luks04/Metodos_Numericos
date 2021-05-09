syms x;
f = exp(-x); % f(x)
errorT = 1e-11; % Error de tolerancia
a = 2;
h = a-x;
staylor = 0.0;
i = -1;
while (5>i) % Cuando alcance el error de tolerancia STOP
    i = i+1;
    x = 2; % a
    staylor=staylor+eval(diff(f,i))*h^i/factorial(i); % Serie de Taylor
    x = 2.2; % x0
    errorA=abs(eval(eval(diff(f,i+1))*h^(i+1)/factorial(i+1))); 
end

staylor