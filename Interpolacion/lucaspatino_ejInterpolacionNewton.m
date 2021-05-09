clear;
clc;
syms x;
x=[0.1 0.3 0.5 0.7 0.9 1.1 1.3]; % Entrada
fx0=[0.9975 0.97763 0.93847 0.88120 0.80752 0.71962 0.62009]; % Entrada
xi=1.3; % Valor con el que se evalua el polinomio
n=length(x);
b=zeros(n);
b(:,1)=fx0(:);

% Obtención de la tabla de diferencias finitas por el metodo de diferencias divididas 
% disp('obtención de la tabla de diferencias finitas')
for j = 2:n
    for i=1:n-j+1
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end   
end
% Calcula el dato interpolado
x1=1;
yi=b(1,1);
for j=1:n-1
    x1=x1.*(xi-x(j));
    yi=yi+b(1,j+i)*x1;
end    
% Construcción del polinomio
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    signo='';
    if b(1,j)>=0
        signo='+';
    end
    x1='';
    for i=1:j-1
        signo2='';
        if xx(i)>=0
            signo2='+';
        end
        x1=strcat(x1,'*(x',signo2,num2str(xx(i)),')');
    end    
    p=strcat(p,signo,num2str(b(1,j)),x1);
end
y = inline(p);
disp('El valor de "y" interpolado es igual a:'),disp(yi);
disp('El polinomio es:'),disp(y);

plot(x,fx0,'*'), hold on
plot(x,fx0)


% clear;
% clc;
% syms x;
% 
% x0 = [0.1 0.3 0.5 0.7 0.9 1.1 1.3]; % Entrada
% fi = [0.9975 0.97763 0.93847 0.88120  0.80752 0.71962 0.62009]; % Entrada
% 
% % DETERMINANTES
% fx = 0;
% dfi = [];
% d2fi = [];
% d3fi = [];
% d4fi = [];
% d5fi = [];
% d6fi = [];
% for i=1:(length(x0)-1)
%     d = (fi(i+1)-fi(i))/(x0(i+1)-x0(i));
%     dfi = [dfi d];
% end
% for i2=1:(length(dfi)-1)
%     d = dfi(i2+1)-dfi(i2)/(x0(i+1)-x0(i));
%     d2fi = [d2fi d];
% end
% for i3=1:(length(d2fi)-1)
%     d = d2fi(i3+1)-d2fi(i3)/(x0(i+1)-x0(i));
%     d3fi = [d3fi d];
% end
% for i4=1:(length(d3fi)-1)
%     d = d3fi(i4+1)-d3fi(i4)/(x0(i+1)-x0(i));
%     d4fi = [d4fi d];
% end
% for i5=1:(length(d4fi)-1)
%     d = d4fi(i5+1)-d4fi(i5)/(x0(i+1)-x0(i));
%     d5fi = [d5fi d];
% end
% for i6=1:(length(d5fi)-1)
%     d = d5fi(i6+1)-d5fi(i6)/(x0(i+1)-x0(i));
%     d6fi = [d6fi d];
% end
% 
% % VECTOR FINAL
% vf = [];
% for g=1:(length(x0))
%     vf = [vf fi(g)];
%     if(g<length(dfi))
%         vf = [vf dfi(g)];
%     end
%     if(g<length(d2fi))
%         vf = [vf d2fi(g)];
%     end
%     if(g<length(d3fi))
%         vf = [vf d3fi(g)];
%     end
%     if(g<length(d4fi))
%         vf = [vf d4fi(g)];
%     end
%     if(g<length(d5fi))
%         vf = [vf d5fi(g)];
%     end
%     if(g<length(d6fi))
%         vf = [vf d6fi(g)];
%     end
% end
% % % % fi
% % % % dfi
% % % % d2fi
% % % % d3fi
% % % % d4fi
% % % % d5fi
% % % % d6fi
% % % % vf
% for k=1:length(vf)
%     Lx = 1;
%     for j=1:length(x0)
%         Lx = Lx*(x-x0(j));
%     end
%     fx = fx+vf(k)*Lx;
% end  
% y = fx;
% eval(subs(fx,1.3))
% 
% % fi(1) + 
% % for k=1:length(vf)
% %     Lx = 1;
% %     if(k==1)
% %         vf = fi;
% %     elseif(k==2)
% %         vf = d2fi;
% %     elseif(k==3)
% %         vf = d3fi;
% %     elseif(k==4)
% %         vf = d4fi;
% %     elseif(k==5)
% %         vf = d5fi;
% %     elseif(k==6)
% %         vf = d6fi;
% %     end
% %             
% %     for j=1:length(x0)
% %         Lx = Lx*(x-x0(j));
% %     end
% %     fx = fx+vf(k)*Lx;
% % end  
% y = fx;
% eval(subs(fx,1.3))