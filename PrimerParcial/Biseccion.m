%Metodo de Biseccion Por Alfonso Mancilla
clc;sw=1;syms x;format short;
 f=inline(input('Digita la función NO lineal f='));
 ezplot(f(x));hold on;
 
while sw==1
    a=input('Digita el límite inferior del intervalo a=');
    b=input('Digita el límite superior del intervalo b=');
    if f(a)*f(b)<0
        sw=0;
    else
        disp('La función digitada no satisface el teorema de Bolzano en el intervalo dado');
    end
end

tol=input('Digita la tolerancia tol=');

if isempty(tol)
    tol=10^-5;
end

k=1;a(k)=a;b(k)=b;B=zeros(1,8);
%%Metodo
while sw==0
    c(k)=(b(k)+a(k))/2;
    if f(c(k))==0
        break;
    else
        if(f(a(k))*f(c(k))) < 0
            a(k+1) = a(k);
            b(k+1) = c(k);
        else
            a(k+1) = c(k);
            b(k+1) = b(k);
        end
        Ea = abs(c(k) - a(k));
        B(k,:)=[k a(k) c(k) b(k) f(a(k)) f(c(k)) f(b(k)) Ea];
        if Ea <= tol
           sw=1;
        else
            k=k+1;
        end    
    end
end
%%

if(i==100)
    disp('Metodo NO converge, cambie semilla');
else
    fprintf('El punto x=%6.10f ES una solución del sistema\n',c(k))
    plot(c(k),0,'Or');
    fprintf('%s\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s \n','It','A','C','B','F(A)','F(B)','F(C)','Error')
    fprintf('%d\t%12.6f\t%12.6f\t%12.6f\t%12.6f\t%12.6f\t%12.6f\t%12.6f \n',B')
end
