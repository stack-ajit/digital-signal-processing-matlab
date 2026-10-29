clc;
xn=input("Please enter the sequence :- ");
N=input("Please enter the number of points :- ");

Xk=dft(xn,N);
disp("The dft is:");
disp(Xk);

M=input("Please enter the number of points :- ");
Xi=idft(Xk,M);
disp("The idft is:");
disp(Xi);

MagXk=abs(Xk);
PhaseXk=angle(Xk);

k=0:N-1;

subplot(2,1,1);
stem(k,MagXk);
title("Sequence");
xlabel("frequency");
ylabel("magnitude")

subplot(2,1,2);
stem(k,PhaseXk);
title("phase plot");
xlabel("frequency");
ylabel("phase");

function[Xk]=dft(xn,N)
l=length(xn);
if(l>N)
    fprintf("N should be greater than l");
end
x=[xn,zeros(1,N-l)];
for k=0:1:N-1
    for n=0:1:N-1
        p=exp(-1i*2*pi*n*k/N);
            W(k+1,n+1)=p;
    end
end
disp("the transformation matrix is as follows :-");
disp(W);
Xk=W*(x.');
end

function[Xk]=idft(xn,N)
l=length(xn);
if(l>N)
    fprintf("N should be greater than l");
end
x=[xn,zeros(1,N-l)];
for k=0:1:N-1
    for n=0:1:N-1
        p=exp(1i*2*pi*n*k/N);
            W(k+1,n+1)=p/N;
    end
end
disp("the transformation matrix is as follows :-");
disp(W);
Xk=W*(x.');
end