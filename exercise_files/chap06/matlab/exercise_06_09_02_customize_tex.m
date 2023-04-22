% exercise_06_09_02_customize_tex.m
% –â‘è 6.9 (2)Fƒ{[ƒhü}‚ÌÜ‚êü‹ß—

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' –â‘è 6.9 (2)')
disp('==================================================')

for i = 1:4
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------------------
w = logspace(-2,2,10000);
n = length(w);

s = tf('s');

% -------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ”÷•ª—v‘fFP1(s) = T1*s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T1 = 1
sysP1 = T1*s

% ----- P1(s) ‚Ìƒ{[ƒhü} --------------------

for i = 1:n
    Gg1_app(i) = T1*w(i);
    Gp1_app(i) = 90;
end

figure(1)
semilogx(w,20*log10(Gg1_app),'LineWidth',1.5)
hold on

figure(2)
semilogx(w,Gp1_app,'LineWidth',1.5)
hold on

% -------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 1 Ÿi‚İ—v‘fFP2(s) = 1 + T2*s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T2 = 1
sysP2 = 1 + T2*s

disp(' ')
disp('------------------------------------')
disp(' P2(s) ‚ÌƒQƒCƒ“ü}‚ÌÜ‚ê“_Špü”g” wg2')
disp('------------------------------------')

wg2 = 1/T2

disp(' ')
disp('------------------------------------')
disp(' P2(s) ‚ÌˆÊ‘Šü}‚ÌÜ‚ê“_Špü”g” wp2')
disp('------------------------------------')

wp2 = [1/(5*T2)  5/T2]
log10_wp2 = log10(wp2);

% ----- P2(s) ‚Ìƒ{[ƒhü}‚ÌÜ‚êü‹ß— --------------------

for i = 1:n
    if w(i) < wg2
        Gg2_app(i) = 1;
    else
        Gg2_app(i) = w(i)*T2;
    end
    
    if w(i) < wp2(1)
        Gp2_app(i) = 0;
    elseif w(i) < wp2(2)
        Gp2_app(i) = 90/(log10_wp2(2) - log10_wp2(1))*(log10(w(i)) - log10_wp2(1));
    else
        Gp2_app(i) = 90;
    end
end

figure(1)
semilogx(w,20*log10(Gg2_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp2_app,'LineWidth',1.5)

% -------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ”ä—á—v‘fFP3(s) = K3')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

K3 = 1/10
sysP3 = K3;
sysP3 = tf(sysP3)

% ----- P3(s) ‚Ìƒ{[ƒhü} --------------------

for i = 1:n
    Gg3_app(i) = K3;
    Gp3_app(i) = 0;
end

figure(1)
semilogx(w,20*log10(Gg3_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp3_app,'LineWidth',1.5)

% -------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 1 Ÿ’x‚ê—v‘fFP4(s) = 1/(1 + T4*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T4 = 10
sysP4 = 1/(1 + T4*s)

disp(' ')
disp('------------------------------------')
disp(' P4(s) ‚ÌƒQƒCƒ“ü}‚ÌÜ‚ê“_Špü”g” wg4')
disp('------------------------------------')

wg4 = 1/T4

disp(' ')
disp('------------------------------------')
disp(' P4(s) ‚ÌˆÊ‘Šü}‚ÌÜ‚ê“_Špü”g” wp4')
disp('------------------------------------')

wp4 = [1/(5*T4)  5/T4]
log10_wp4 = log10(wp4);

% ----- P4(s) ‚Ìƒ{[ƒhü}‚ÌÜ‚êü‹ß— --------------------

for i = 1:n
    if w(i) < wg4
        Gg4_app(i) = 1;
    else
        Gg4_app(i) = 1/(w(i)*T4);
    end
    
    if w(i) < wp4(1)
        Gp4_app(i) = 0;
    elseif w(i) < wp4(2)
        Gp4_app(i) = -90/(log10_wp4(2) - log10_wp4(1))*(log10(w(i)) - log10_wp4(1));
    else
        Gp4_app(i) = -90;
    end
end

figure(1)
semilogx(w,20*log10(Gg4_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp4_app,'LineWidth',1.5)

% ----- P(s) = P1(s)*P2(s)*P3(s)*P4(s) ‚ÌƒQƒCƒ“ü}‚ÌÜ‚êü‹ß— -------

sysP = zpk(sysP1*sysP2*sysP3*sysP4)

% -------------------------------------------------------
figure(1)
semilogx(w,20*log10(Gg1_app)...
          +20*log10(Gg2_app)...
          +20*log10(Gg3_app)...
          +20*log10(Gg4_app),':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-80 20])
set(gca,'YTick',-80:20:20)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

title('ƒQƒCƒ“ü}‚ÌÜ‚êü‹ß—','FontSize',16,'FontName','MS Gothic')

legend({'${P}_{1}(s) = s$',...
        '${P}_{2}(s) = 1 + s$',...
        '${P}_{3}(s) = 1/10$',...
        '${P}_{4}(s) = 1/(1 + 10s)$',...
        '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s){P}_{4}(s)$'},...
        'Location','south',...
        'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(2)
semilogx(w,Gp1_app...
          +Gp2_app...
          +Gp3_app...
          +Gp4_app,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-120 120])
set(gca,'YTick',-120:30:120)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('ˆÊ‘Šü}‚ÌÜ‚êü‹ß—','FontSize',16,'FontName','MS Gothic')

grid on

% =======================================================
% =======================================================

% ----- P1(s), P2(s), P3(s), P4(s), P(s) ‚Ìƒ{[ƒhü} -----

[Gg1 Gp1] = bode(sysP1,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

[Gg2 Gp2] = bode(sysP2,w);
Gg2 = Gg2(:,:);
Gp2 = Gp2(:,:);

[Gg3 Gp3] = bode(sysP3,w);
Gg3 = Gg3(:,:);
Gp3 = Gp3(:,:);

[Gg4 Gp4] = bode(sysP4,w);
Gg4 = Gg4(:,:);
Gp4 = Gp4(:,:);


% -------------------------------------------------------
figure(3)
semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,20*log10(Gg2),'LineWidth',1.5)
semilogx(w,20*log10(Gg3),'LineWidth',1.5)
semilogx(w,20*log10(Gg4),'LineWidth',1.5)

semilogx(w,20*log10(Gg1)+20*log10(Gg2)+20*log10(Gg3)+20*log10(Gg4),':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-80 20])
set(gca,'YTick',-80:20:20)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

title('ƒQƒCƒ“ü}','FontSize',16,'FontName','MS Gothic')

grid on

% -------------------------------------------------------
figure(4)
semilogx(w,Gp1,'LineWidth',1.5)
hold on

semilogx(w,Gp2,'LineWidth',1.5)
semilogx(w,Gp3,'LineWidth',1.5)
semilogx(w,Gp4,'LineWidth',1.5)

semilogx(w,Gp1+Gp2+Gp3+Gp4,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-120 120])
set(gca,'YTick',-120:30:120)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('ˆÊ‘Šü}','FontSize',16,'FontName','MS Gothic')

grid on

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
