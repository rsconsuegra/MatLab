%secante
clc;clear all;syms x;format long;
f=inline(input('Digite la función F= ','s'));
set(ezplot(f),'color','m');hold on;

xk=input('Digite el intervalo inicial xk=[x1 x2] ');

xk(1,3)=abs(xk(2)-xk(1));

tol=input('Digite la tolerancia tol=');

if(isempty (tol))
    tol=10^-5;
end
for i=2:100
    xk(i,1)=xk(i-1,2);
    m=(f(xk(i,1))-f(xk(i-1,1)))/(xk(i,1)-xk(i-1,1));%Pendiente de la recta secante
    xk(i,2)=xk(i,1)-f(xk(i,1))/m;%Reemplazamos en Newton-Raphson 2D,  f'(xk(i-1,1)) por m
    Ea=abs(xk(i,2)-xk(i,1));
    xk(i,3)=Ea;
    if Ea<=tol
        break;
    end
end
if(i==100)
    disp('Metodo NO converge, cambie semilla');
else
    fprintf('El punto x=%6.10f ES una solución del sistema\n',xk(i,2))
    plot(xk(i,2),f(xk(i,2)),'Om');
    fprintf('%14s   %14s   %14s\n','Valor a','Valor b','Error')
    fprintf('%12.8f   %12.8f   %12.8f\n',xk(:,1),xk(:,2),xk(:,3))
end
