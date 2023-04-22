% sample_bode4.m
% ゲイン線図と位相線図を別々のフィギュアウィンドウとした
% ボード線図（図 6.20）

clear
format compact

sysP = tf([1],[1 0.5 1])
w = logspace(-2,2,1000);
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);  Gp = Gp(:,:);

figure(1);  semilogx(w,20*log10(Gg))
ylim([-80 20]);  set(gca,'YTick',-80:20:20)
grid on
xlabel('\omega [rad/s]');  ylabel('Gain [dB]')

figure(2);  semilogx(w,Gp)
ylim([-225 45]);  set(gca,'YTick',-225:45:45)
grid on
xlabel('\omega [rad/s]');  ylabel('Phase [deg]')

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')