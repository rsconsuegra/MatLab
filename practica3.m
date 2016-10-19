clc
x=input('Digitee x');
y=input('Digitee y');

[P L]=lagran(x,y);
[P N]=newtonpoly(x,y);
subplot(2,2,1);plot(x,y,'Or');hold on;
ejex=[min(x)-1:0.1:max(x)+1];
plot(ejex,polyval(P,ejex))
subplot(2,2,3)
plot(L)
subplot(2,2,4)
plot(N)

subplot(2,2,2)
for i=1:length(x)
   t=taylor(poly2sym(P),'ExpansionPoint',x(i),'Order',3);
   ezplot(t);hold on    
end















