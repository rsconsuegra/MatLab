clc;clear all;close all

k=input('Digite k');
lambda=input('digite lambda')
f=@(x)(k/lambda*(x./lambda).^(k-1).*exp((-x/lambda).^k));
ejex=0:0.1:5;
y=f(ejex);

plot(ejex,y)

for i=1:length(ejex)
   v(i)=quad(f,0,ejex(i)); 
end

figure
plot(ejex,v)