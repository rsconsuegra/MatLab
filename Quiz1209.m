clear all;clc;
A=input('digite la matriz de coeficientes A[]=');
b=input('digite el vector COLUMNA b de terminos independientes=');
a=tril(A);
x=sprogresiva(a,b)
a=triu(A);
x=sregresiva(a,b)