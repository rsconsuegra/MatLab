%Gauss Seidel
clc;sw=0;

A=input('Digite Matriz A=');

%%Criterio de Convergencia del metodo:
%% Si es estrictamente dominante diagonal, o simetrica y definida positiva, el metodo aplica.
if(sum(abs(diag(A)))<sum(sum(abs(A),2)'-diag(abs(A))') || (min(eig(A))<=0 && isempty(A-A')))
    warning('No se puede aplicar el metodo')
    sw=1;
end

%Metodo:
if(sw==0)
	b=input('Digite Vector de terminos independientes b=');
	x0=input('Digite vector semilla x0=');
	
	La=tril(A);
	U=triu(A)-diag(diag(A));
	T=-La\U;
	C=La\b;
	error=1;
	tol=1e-8;
	while(error>=tol)
        	xn=T*x0+C;
        	%%Criterio de parada: Normal vectorial. 
        	error=norm(xn-x0);
		x0=xn;
	end
    	x0
end
