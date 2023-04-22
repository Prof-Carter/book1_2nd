% example_03_17_customize_tex.m
% 例 3.17：零点と過渡特性
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.17 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t real
syms k real

disp(' ')
disp('==================================================')
disp('+ P(s) = (ks + 2)/((s + 1)(s + 2))')
disp('==================================================')

Ps = (k*s + 2)/((s + 1)*(s + 2))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = sym(1)         % もしくは以下のように記述
us = laplace(ut)    % us = 1/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s) を部分分数分解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 単位ステップ応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% ----- グラフの描画 ----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

for value_k = -1:3
    fplot(subs(yt,k,value_k),[0 5],'LineWidth',1.5)
    hold on
end

figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)

grid on

xlim([0 5])
ylim([-0.25 1.25])
set(gca,'XTick',0:1:5)
set(gca,'YTick',-0.25:0.25:1.25)

legend({'$k=-1$','$k=0$','$k=1$','$k=2$','$k=3$'}, ...
        'Interpreter','latex','FontSize',16, ...
        'Location','southeast')
        