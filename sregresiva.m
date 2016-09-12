function [x] = sregresiva(a,b)
    n1=size(a);
    n=n1(1);
    x=zeros(1,n);
    for i=n:-1:1
        suma=0;
        for j=i+1:1:n
            suma=suma+a(i,j)*x(j);
        end
        x(i)=(b(i)-suma)/a(i,i);
    end
end

