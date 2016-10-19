function [ x ] = Eliminacion_gaussiana_permutacion( A, b )
%Algoritmo eliminacion gaussiana
%A= input ('matriz cuadrada A: ')
%b= input ('vector de terminos independientes b: ')
[n,q]=size(A);

for i=1:n-1;
    for k=i+1:n;
        if A(k,i)~=0;
            p=k;
        end
    end
    if p~=1;
        for j=1:n;
            aux=A(i,j);
            A(i, j)=A(p, j);
            A(p, j)=aux;
        end
        aux=b(i);
        b(i)=b(p);
        b(p)=aux;
    end
    for k=i+1:n ;
        m=A(k,i)/A(i,i);
        for j= i+1:n;
            A(k,j)= A(k,j)-m*A(i,j);
        end
        A(k,i)=0;
        b(k)=b(k)-m*b(i);
    end
end
x=zeros(n,1);
disp(A);
A

disp(b);
for i=n:-1:1;
    aux=0;
    for j=i+1:n
        aux=aux+A(i,j)*x(j);
    end
    x(i)=(b(i)-aux)/A(i,i);
end
disp (x)