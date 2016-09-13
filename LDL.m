A=input('Digite A')
[n,m]=size(A);
if n~=m || n<0
    error('A must be a square matrix');
end
L = zeros(n,n);
for i = 1:n
    L(i,i)=1;
end

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