function z=Integraldoble()
syms x y
f = exp(x+y);
d = x^2;
c = x^3;
%a = 0;
%b = pi;
a= 0.1;
b = 0.5;
n= 30;
m = 10;
h = (b-a)/n;
J1 = 0;
J2 = 0;
J3 = 0;
for i=0:n
    x = a+h*i;
    HX = (eval(d)-eval(c))/m;
    y = eval(d);
    K11 = eval(f) ;
    y = eval(c);
    K22 = eval(f);
    K1 = K11 + K22;
    K2 = 0;
    K3 = 0;
        for j=1:m-1
            y = eval(c) + j*HX;
            Q = eval(f);
            if rem(j,2)==0
                K2 = K2 + Q;        
            else
                K3 = K3 + Q;
            end    
        end
   L = (K1 + 2*K2 + 4*K3)*HX/3;
   if i == 0 || i == n
        J1 = J1 + L;        
      else
         if rem(i,2)==0
            J2 = J2 + L;
         else
            J3 = J3 + L; 
        end
   end   
end
J = (J1 + 2*J2 + 4*J3)*h/3
    z=J;
   %para agregar a la tabla de valores hallados
   fprintf(' -----------------------------------\n');
   fprintf(' Los resultados obtenidos son:\n');
   fprintf(' -----------------------------------\n');
   fprintf('|     XI        | \n');
   fprintf('| %11.3d   | \n',J);
end