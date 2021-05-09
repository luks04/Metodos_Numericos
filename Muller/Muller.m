function y=Muller()
syms x
f = x^3-13*x-12;
errorT = 1e-5; % Error de tolerancia
x0 = 4.5;
x1 = 5.5;
x2 =5;
i=1;
errora(1) = 1;

while(errora(i)>errorT)
    h0=x1-x0;
    h1=x2-x1;
    if h1 == 0 || h0 == 0
        break
    else
    x = [x0 x1 x2]
    fx = eval(f);
    d0 = (fx(2)-fx(1))/h0
    d1 = (fx(3)-fx(2))/h1
    %hallando las constantes
    a=(d1-d0)/(h1+h0);
    b=a*h1+d1;
    c=fx(3);
    raizd=sqrt(b*b-4*a*c);
    end
    %-----------------------------------------------------%
    if abs (b+raizd)> abs(b-raizd)
        den=b+raizd;
    else
        den=b-raizd;
    end
    %-----------------------------------------------------%
    dxr=-2*c/den;
    xr(i)=x2+dxr;
    et=abs((xr-x2)/xr);
    x0=x1;
    x1=x2;
    x2=xr(i);   
    i=i+1; 
    errora(i)=et*100;  
end
   %para agregar a la tabla de valores hallados
   fprintf(' -----------------------------------\n');
   fprintf(' Los resultados obtenidos son:\n');
    fprintf(' -----------------------------------\n');
   fprintf('| i            x2(i)   Error aprox(i)| \n');
for j=1:i-1;
    fprintf('|%2d \t %11.3d \t %11.3d| \n',j-1,xr(j),errora(j));
end

