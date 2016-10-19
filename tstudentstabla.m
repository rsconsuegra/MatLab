clc;clear all; close all;
p=[0 0.95:-0.05:0.05]; k=[0 1:9];
nf=length(k);nc=length(p);
T=zeros(nf,nc);
T(1,:)=p;
T(:,1)=k;

for i=2:nf 
    for j=2:nc
    T(i,j)=abs(tinv(T(1,j),T(i,1)));
    end
end

plot(T(2:end,2:end))