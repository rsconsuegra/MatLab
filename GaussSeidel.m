clc;sw=0;
A=input('Digite Matriz A=');

%%Criterio de Convergencia del metodo:
%% Si es estrictamente dominante diagonal, o simetrica y definida positiva, el metodo aplica.
if(sum(abs(diag(A)))<sum(sum(abs(A),2)'-diag(abs(A))') || (min(eig(A))<=0 && isempty(A-A')))
    warning('No se puede aplicar el metodo')
    sw=1;
end

if(sw==0)
    b=input('Digite Vector de terminos independientes b=');
    x=input('Digite vector semilla x0=');

    err=1;
    tol=1e-8;
    maxit=40;
    D=diag(A);
    A=A-diag(D);
    D=1./D;  %We need the inverses
    n=length(x);
    x=x(:); %Make sure x is a column vector
    xn=x;
    for j=1:maxit
        for k=1:n
            x(k)=(b(k)-A(k,:)*x)*D(k);
        end
        error=norm(x-xn);
        xn=x;
        if (error<tol)
            break
        end
    end
    x
end