function y=BiseccionProfe()
syms x
f = (6*exp(sin(x-5)))/((0.2*(x-5)^2)+(exp(sin(x-5))))-0.5;
a = 2;
b = 8;
errorT = 1e-11;%error de tolerancia
n = ceil(log((b-a)/errorT)/log(2));
xi = (a+b)/2;
for i=1:n
    x = xi;
    fxi = eval(f);
    x = a;
    fa = eval(f);
    if (fxi*fa<=0)
        b=xi;
    else 
        a=xi;
    end
xi = (a+b)/2;
end
y=xi;

