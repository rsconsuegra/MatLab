
syms x 
g=input('Digite Función G(x)(Recuerde, G(x)+x=F(x))=');
t=input('Digite invervalo para graficar [li ls]:');

ezplot(g,t); hold on;
grid on

error=100;   %se inicializa el error en 100%
r=input('Ingrese el estimado de la raiz: ');
a=1;

while (a==1)
    if(abs(subs(diff(g),linspace(t(1),t(2),10000)))<1)
        break
    else
        disp('Metodo no converge en ese intervalo')
        t=input('Digite invervalo donde pertenece la raiz [li ls]:');
        r=input('Ingrese el estimado de la raiz: ');
    end
end
clear ('a','t')

while abs(error)>0.0000000001
    aux=r;     
    r=subs(g,r);  
    error=((r-aux)/(r))*100; 
end

r = double(r)
