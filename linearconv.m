clc 
clear all
close all
x=[1 4 13];
x=x';

h=[2 1 -1];
z=zeros(1,7);
z(3:5)=h(3:-1:1);
y=[];
for i=1:5
    y1=z(1,6-i:8-i)*x;
    y=[y,y1];
end
disp(y)
