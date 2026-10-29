
close all;
x = input("Enter a sequence :- ");
for i=0:length(x)-1
    fprintf("%d *z^-%d  +",x(i+1),i);
end
