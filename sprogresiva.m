function [x] = sprogresiva(a,b)
    n1=size(a);
    n=n1(1);
    x=zeros(1,n);
    for i=1:1:n
        suma=0;
        for j=1:1:i-1
            suma=suma+a(i,j)*x(j);
        end
        x(i)=(b(i)-suma)/a(i,i);
    end
end


