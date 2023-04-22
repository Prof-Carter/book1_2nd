% sample_residue2.m
% •”•ª•ª”•ª‰ğ‚ÆŠÔ‰“š

close all
clear
format compact

numY = 2; 
denY = [1 4 4 0];
[k,p] = residue(numY,denY)

t = 0:0.01:10;
y = k(1)*exp(p(1)*t) + k(2)*t.*exp(p(2)*t) + k(3)*exp(p(3)*t);

figure(1)
plot(t,y)
xlabel('time [s]')
ylabel('y(t)')
grid on
