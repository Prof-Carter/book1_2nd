% example_07_01b_customize_tex.m
% 例 7.1：ナイキストの安定判別法（図 7.4）
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.1 ')
disp('==================================================')

syms s
syms w real
syms kP real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s - 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s - 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' C(s) = kP ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = kP

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(s) = P(s)C(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ls = Ps*Cs

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(jw) = a + jb ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw = subs(Ls,s,j*w)
a = real(Ljw)
b = imag(Ljw)

% ------------------------------------------------------
figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

num = 0;
for kP_val = [0.5 1 2]
    a_val = subs(a,kP,kP_val);
    b_val = subs(b,kP,kP_val);

    num = num + 1;
    if num == 1
        line_color = [  0 114 189]/255;
    elseif num == 2
        line_color = [217  83  25]/255;
    else
        line_color = [237 177  32]/255;
    end
    h(num) = fplot(a_val, b_val,[1e-5 1e1],'Color',line_color,'LineWidth',1.5);
    hold on
    fplot(a_val, b_val,[1e1  1e3],'Color',line_color,'LineWidth',1.5)

    fplot(a_val,-b_val,[1e-5 1e1],'--','Color',line_color,'LineWidth',1.5)
    fplot(a_val,-b_val,[1e1  1e3],'--','Color',line_color,'LineWidth',1.5)
end

% ------------------------------------------------------
figure(1)

plot(-1,0,'r+','LineWidth',2,'MarkerSize',10)
hold off

legend(h,{'${k}_{\rm P} = 0.5$','${k}_{\rm P} = 1$','${k}_{\rm P} = 2$'}, ...
          'Interpreter','latex','FontSize',16, ...
          'Location','eastoutside')

xlim([-2.2 0.2])
set(gca,'XTick',-2:0.5:0)
ylim([-1.2 1.2])
set(gca,'YTick',-1:0.5:1)

axis square
grid on

set(gca,'FontSize',14,'FontName','Arial')

xlabel('実軸','FontSize',16,'FontName','MS UI Gothic')
ylabel('虚軸','FontSize',16,'FontName','MS UI Gothic')

movegui('north')
