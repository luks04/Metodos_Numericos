function y=Biseccion()
syms x;
f = ((1-x)*((3+x)^(1/2)))/(x*(x+1)^(1/2)*(5^(1/2)))-3.06; % Entrada
a = 0; % Entrada
b = 1; % Entrada
errorT = 1e-11; % Error de tolerancia
xi = (a+b)/2;
errorA = abs(b-a);
n = ceil(log((b-a)/errorT)/log(2));
while (errorA>errorT)
   x = xi;
   fxi = eval(f);
   x = a;
   fa = eval(f);
   if(fa*fxi<=0)
       b = xi;
   else
       a = xi;
   end
   xi = (a+b)/2;
   errorA = abs(b-a);
end
% x = -10:0.1:10;
% z = eval(f);
% grid on;
% plot(x,z)
y = xi;