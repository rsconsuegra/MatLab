clc;%Factorización PA=LU por AmancillA
sw=0;
while sw==0
    A = input('Digite matriz cuadrada A [ ; ; ... ; ]= ');
    if size(A,1)==size(A,2)
        sw=1;
    else
        disp('Recuerda, la matriz tiene que ser cuadrada!');
    end
end
n = size(A,1);
L = eye(n);U = A;P = L;

for j=1:n-1
    pivote = U(j,j);
    if pivote ~= 0;
        for i=j+1:n
            L(i,j)= U(i,j)/pivote;
            U(i,:)= U(i,:)-L(i,j)*U(j,:);
        end
    else
         p=find(U(j+1:n,j)~=0,1);    
         if isempty(p)
             disp('La matriz A no admite factorización LU')
         else
             U([j p],:)=U([p j],:);P([j p],:)=P([p j],:);
             j=j-1;
         end
    end
end
L
U
P
PA=P*A
LU=L*U
