syms x;
a = pi/3;
f = cos(x);
h = x-a;
x = a;
n = 5;
staylor = 0.0;
for i=0:n
    staylor = staylor + eval(diff(f,i))*h^i/factorial(i); % Serie de Taylor
end

x = pi/4; % x0
eval(staylor)
error_absoluto = abs(eval(staylor)-cos(pi/4))
error_relativo = abs((eval(staylor)-cos(pi/4))/cos(pi/4))
