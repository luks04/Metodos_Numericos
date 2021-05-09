syms x;
f = 1/(x-2); % f(x)
errorT = 10e-10; % Error de tolerancia
a = 5;
h = a-x;
staylor = 0.0;
i = -1;
while (5>i) % Cuando alcance el error de tolerancia STOP
    i = i+1;
    x = 5; % a
    staylor=staylor+eval(diff(f,i))*h^i/factorial(i); % Serie de Taylor
    x = 5.5; % x0
    errorA=abs(eval(eval(diff(f,i+1))*h^(i+1)/factorial(i+1))); 
end

staylor