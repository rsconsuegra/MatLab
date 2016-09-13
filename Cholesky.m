clc;sw=true;sw1=true;
while sw==true
    A=input('Digita la matriz cuadrada con los coeficientes del sistema. A=');
    [nf, nc]=size(A);
    if nf~=nc
        disp('ERROR! La matriz tine que ser cuadrada.');
    elseif(isequal(A,A'))
        sw=false;n=nf;
    else
        disp('ERROR! La matriz tine que ser simetrica.');
    end
end
%pd=eig(A);if min(pd)>0 disp('A es definida positiva') ...
for i=1:n
    if det(A(1:i,1:i))<=0
        sw1=false;break;
    end
end
L=zeros(n);
if sw1==true
    L(1,1)=sqrt(A(1,1));
    for i=2:n
        for j=1:i
            if j-i==0
                L(i,j)=sqrt(A(i,j)-sum(L(i,1:i-1).^2));
            else
                L(i,j)=(A(i,j)-sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
            end
        end
    end
    L
else
    disp('La matriz no es Definida Positiva, no aplica el Algoritmo de Cholesky');
end

