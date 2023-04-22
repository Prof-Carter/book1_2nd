% sample_bode4_customize_tex.m
% ゲイン線図と位相線図を別々のフィギュアウィンドウとした
% ボード線図（図 6.20，グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

w = logspace(-2,2,1000);
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
semilogx(w,20*log10(Gg),'LineWidth',1.5)
ylim([-80 20])
set(gca,'YTick',-80:20:20)
set(gca,'FontSize',14,'FontName','Arial')
grid on
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])
semilogx(w,Gp,'LineWidth',1.5)
ylim([-225 45])
set(gca,'YTick',-225:45:45)
set(gca,'FontSize',14,'FontName','Arial')
grid on
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
