% exercise_04_08_plot_customize_tex.m
% 問題 4.8：単位ステップ外乱に対する定常値

close all
clear
format compact

figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

disp(' ')
disp('==================================================')
disp(' 問題 4.7')
disp('==================================================')

s = tf('s');

t = 0:0.001:10;

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP = 5/(s^2 + 2*s + 2);

for i = 1:3
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ コントローラ C(s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    if i == 1
        kP = 2;
        sysC = kP

    elseif i == 2
        kP = 5;
        sysC = kP

    elseif i == 3    
        kP = 2;
        kI = 1.25;       
        sysC = (kP*s + kI)/s
    end
    
    disp(' ')
    disp('--------------------------------------------------')
    disp('+ Gyd(s) = P(s)/(1 + P(s)*C(s))')
    disp('--------------------------------------------------')
    
    sysL   = minreal(sysP*sysC);
    sysGyd = minreal(sysP/(1 + sysL))
    
    % ----- グラフの描画 --------------------------------
    y = step(sysGyd,t);

    figure(1)
    plot(t,y,'LineWidth',1.5)
    hold on
end

figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)

grid on

legend({'$C(s) = 2$','$C(s) = 5$','$C(s) = (2s + 1.25)/s$'}, ...
        'Interpreter','latex','FontSize',16)

xlim([0 10])
ylim([-0.25 0.75])
set(gca,'XTick',0:1:10)
set(gca,'YTick',-0.25:0.25:0.75)

movegui('north')


