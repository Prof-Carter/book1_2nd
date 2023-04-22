% example_06_01b.m
% —á 6.1Fƒ‰ƒvƒ‰ƒX•ÏŠ·‚É‚æ‚éü”g”‰“š‚ÌŒvZ‚Æü”g”‰“š‚Ì•`‰æ
% ySymbolic Math Toolbox ‚ª•K—vz

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' —á 6.1 ')
disp('==================================================')

syms s
syms t real
syms w real
syms A real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(t) = A*sin(w*t) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = A*sin(w*t)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(s) = L[u(t)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

us = laplace(ut)

[num_us den_us] = numden(us);
p = solve(den_us,s);

us = num_us/((s - p(1))*(s - p(2)))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s) = P(s)u(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s) = h/(s + 1) + k1/(s - p1) + k2/(s - p2)')
disp('      = h/(s + 1) + k1/(s - jw) + k2/(s + jw)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

h = subs((s + 1)*ys,s,-1);
h = simplify(h)

disp(' ')
p1 = p(2)
k1 = subs((s - p(2))*ys,s,p(2));
k1 = simplify(collect(k1))

disp(' ')
p2 = p(1)
k2 = subs((s - p(1))*ys,s,p(1));
k2 = simplify(collect(k2))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = h*exp(-1*t) + k1*exp(p1*t) + k2*exp(p2*t)
yt = simplify(yt,'Steps',100);
yt = simplify(yt,'Steps',100)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' yapp(t)Fü”g”‰“š ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yapp = k1*exp(p1*t) + k2*exp(p2*t)
yapp = simplify(yapp,'Steps',100)

% ---------------------------------------------------------------
figure(1)
set(gcf,'Position',[100 100 900 300]) 
subplot('Position',[0.1 0.2 0.8 0.7])

fplot(subs(ut,[A w],[1 0.1]),[0 80])
hold on
fplot(subs(yt,[A w],[1 0.1]),[0 80])
fplot(subs(yapp,[A w],[1 0.1]),[0 80])
hold off

grid on

xlabel('t [s]')
ylabel('u(t), y(t), {y}_{app}(t)')
title('A = 1, \omega = 0.1 [rad/s]')

legend('u(t)','y(t)','{y}_{\rm app}(t)')

% ---------------------------------------------------------------
figure(2)
set(gcf,'Position',[100 100 900 300]) 
subplot('Position',[0.1 0.2 0.8 0.7])

fplot(subs(ut,[A w],[1 10]),[0 4])
hold on
fplot(subs(yt,[A w],[1 10]),[0 4])
fplot(subs(yapp,[A w],[1 10]),[0 4])
hold off

grid on

xlabel('t [s]')
ylabel('u(t), y(t), {y}_{app}(t)')
title('A = 1, \omega = 10 [rad/s]')

legend('u(t)','y(t)','{y}_{\rm app}(t)')

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('southwest')

