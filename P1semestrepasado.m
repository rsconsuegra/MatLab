A=input('Matirz A');
[~,n]=size(A);

U=zeros(n,n);
k=1;
for i=1:n
    for j=1:n
        U(i,j)=n-k;
        k=k+1;
    end
    m=n-1;
    k=k-m;
end
triu(U)

P=eye(n)

%P(:,1:n)=P(:,[n 1:(n-1)])

for i=1:n-1
    P(:,[i n]) = P(:,[n i]);
end


L=P*A\U




















