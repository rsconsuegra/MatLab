A=input('Digite A');

while sw==0
    A = input('Digite matriz cuadrada A [ ; ; ... ; ]= ');
    if size(A,1)==size(A,2)
        sw=1;
    else
        disp('Recuerda, la matriz tiene que ser cuadrada!');
    end
end

n = size(A,1);

%% método de ortogonalización de Gram-Schmidt
Q=zeros(n);
Q(:,1)=A(:,1)./norm(A(:,1));
for i=2:n
    orto=zeros(n,1);
    for j=i:-1:2
        orto=orto+(dot(Q(:,j-1),A(:,i))/norm(Q(:,j-1))^2)*Q(:,j-1);
    end
     Q(:,i)=((A(:,i))-orto);
     Q(:,i)=Q(:,i)./norm(Q(:,i));
end

R=Q'*A;

Q
R