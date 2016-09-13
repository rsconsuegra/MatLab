clc;
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

L=eye(n);

D = zeros(n,1);

for i=1:n
    D(i)=A(i,i)-L(i,1:i-1).^2*D(1:i-1);
    for j=i+1:n
        L(j,i)=(A(j,i)-L(j,1:i-1).*L(i,1:i-1)*D(1:i-1))/D(i);
    end
end

D=diag(D);

L
D
L'