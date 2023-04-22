% sample_residue1.m
% •”•ª•ª”•ª‰ğ‚ÆŠÔ‰“š

close all
clear
format compact

numY = [4 5];
denY = [1 3 2];
[k,p] = residue(numY,denY)

t = 0:0.01:10;
y = k(1)*exp(p(1)*t) + k(2)*exp(p(2)*t);

figure(1)
plot(t,y)
xlabel('time [s]')
ylabel('y(t)')
grid on
