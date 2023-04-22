% example_06_06_customize_tex.m
% —á 6.6F‚Ÿ—v‘f‚Ìƒ{[ƒhü}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' —á 6.6 ')
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
disp(' 1 Ÿ’x‚ê—v‘fFP1(s) = 1/(1 + T1*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T1 = 1
sysP1 = 1/(1 + T1*s)

disp(' ')
disp('------------------------------------')
disp(' P1(s) ‚ÌƒQƒCƒ“ü}‚ÌÜ‚ê“_Špü”g” wg1')
disp('------------------------------------')

wg1 = 1/T1

disp(' ')
disp('------------------------------------')
disp(' P1(s) ‚ÌˆÊ‘Šü}‚ÌÜ‚ê“_Špü”g” wp1')
disp('------------------------------------')

wp1 = [1/(5*T1)  5/T1]
log10_wp1 = log10(wp1);

% ----- P1(s) ‚Ìƒ{[ƒhü}‚ÌÜ‚êü‹ß— --------------------

for i = 1:n
    if w(i) < wg1
        Gg1_app(i) = 1;
    else
        Gg1_app(i) = 1/(w(i)*T1);
    end
    
    if w(i) < wp1(1)
        Gp1_app(i) = 0;
    elseif w(i) < wp1(2)
        Gp1_app(i) = (-90)/(log10_wp1(2) - log10_wp1(1))*(log10(w(i)) - log10_wp1(1));
    else
        Gp1_app(i) = -90;
    end
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

T2 = 10
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
disp(' ”ä—á—v‘fFP3(s) = K')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

K = 1/100;
sysP3 = K;
sysP3 = tf(sysP3)

for i = 1:n
    Gg3_app(i) = K;
    Gp3_app(i) = 0;
end

% ----- P3(s) ‚Ìƒ{[ƒhü} ------------------------------

figure(1)
semilogx(w,20*log10(Gg3_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp3_app,'LineWidth',1.5)

% -------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ‚Ÿ—v‘fFP(s) = P1(s)*P2(s)*P3(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP = zpk(sysP1*sysP2*sysP3)

% ----- P(s) = P1(s)*P2(s)*P3(s) ‚ÌƒQƒCƒ“ü}‚ÌÜ‚êü‹ß— -----

figure(1)
semilogx(w,20*log10(Gg1_app)...
          +20*log10(Gg2_app)...
          +20*log10(Gg3_app),':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-60 40])
set(gca,'YTick',-60:20:40)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

title('ƒQƒCƒ“ü}‚ÌÜ‚êü‹ß—','FontSize',16,'FontName','MS Gothic')

legend({'${P}_{1} = 1/(1 + s)$',...
        '${P}_{2} = 1 + 10s$',...
        '${P}_{3} = 1/100$',...
        '$P = {P}_{1}{P}_{2}{P}_{3}$'},...
        'Location','northeast',...
        'Interpreter','latex','FontSize',14)

grid on

% ----- P(s) = P1(s)*P2(s)*P3(s) ‚ÌˆÊ‘Šü}‚ÌÜ‚êü‹ß— -----

figure(2)
semilogx(w,Gp1_app...
          +Gp2_app...
          +Gp3_app,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-120 120])
set(gca,'YTick',-90:45:90)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('ˆÊ‘Šü}‚ÌÜ‚êü‹ß—','FontSize',16,'FontName','MS Gothic')

grid on

% =======================================================
% =======================================================

% ----- P1(s), P2(s), P3(s), P(s) ‚Ìƒ{[ƒhü} ------------------

[Gg1 Gp1] = bode(sysP1,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

[Gg2 Gp2] = bode(sysP2,w);
Gg2 = Gg2(:,:);
Gp2 = Gp2(:,:);

[Gg3 Gp3] = bode(sysP3,w);
Gg3 = Gg3(:,:);
Gp3 = Gp3(:,:);

% -------------------------------------------------------
figure(3)
semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,20*log10(Gg2),'LineWidth',1.5)
semilogx(w,20*log10(Gg3),'LineWidth',1.5)

semilogx(w,20*log10(Gg1)+20*log10(Gg2)+20*log10(Gg3),':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-60 40])
set(gca,'YTick',-60:20:40)

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

semilogx(w,Gp1+Gp2+Gp3,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-120 120])
set(gca,'YTick',-90:45:90)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('ˆÊ‘Šü}','FontSize',16,'FontName','MS Gothic')

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
