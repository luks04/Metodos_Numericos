function y=Taylor()
syms x
f = cos(x); % f(x)
errorT = 1e-11; % Error de tolerancia
x = pi/3;
x0 = pi/4;
h = x0-x;
serieTaylor = 0.0;
i = 0;
errorA = 0.1;
while(errorA>errorT) % Cuando alcance el error de tolerancia STOP
     serieTaylor = serieTaylor+eval(diff(f,i))*h^i/factorial(i);
     errorA = abs(eval(diff(f,i))*h^(i)/factorial(i));
     i = i+1;
end
y = serieTaylor;

