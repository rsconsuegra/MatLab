clc;sw=0;
A=input('Digite Matriz A=');
b=input('Digite vector de terminos independientes=');
x=input('Digite vector semilla=');
w=input('Digite coeficiente de relajación 0<w<1 =');

tol=1e-8;
it=100;

D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);

norma2_b = norm(b);
if (norma2_b == 0.0)
    norma2_b = 1.0;
end

r = b - A * x;
err = norm(r) / norma2_b;
if (err < tol)
    sw=1;
end

b= w*b;
M= w*L+D;
N= -w*U+(1-w)*D;

if(sw==0)
    for iter = 1 : it
        x_1 = x;
        x = M \ (N * x + b); % adjust the aproximation
        %err = norm(x - x_1) / norm(x); % compute error
        err = norm(x_1 - x, 1); % compute error
        if (err <= tol) % check for convergence
            break
        end          
    end
    
else
   dis('Metodo no aplica') 
end

if (err > tol) % no convergence
    disp('No converge');
end 

