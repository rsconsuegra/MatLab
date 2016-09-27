function [ C,D] = newtonpoly(X,Y)
n=length(X);
D=zeros(n,n);
D(:,1)=Y';

for j=2:n
    for k=j:n
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
    end
end

C=D(n,n);

for k=(n-1):-1:1
    C=conv(C,poly(X(k)));
    m=length(C);
    C(m)=C(m)+D(k,k);
end

ezplot(poly2sym(C),[min(X)-1 max(X)+1]);
hold on;plot(X,Y,'Or');hold off;
end

