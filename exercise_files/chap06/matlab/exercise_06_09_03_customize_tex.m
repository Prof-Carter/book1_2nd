% exercise_06_09_03_customize_tex.m
% ��� 6.9 (3)�F�{�[�h���}�̐܂���ߎ�

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.9 (1)')
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
disp(' 1 ���x��v�f�FP1(s) = 1/(1 + T1*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T1 = 1
sysP1 = 1/(1 + T1*s)

disp(' ')
disp('------------------------------------')
disp(' P1(s) �̃Q�C�����}�̐܂�_�p���g�� wg1')
disp('------------------------------------')

wg1 = 1/T1

disp(' ')
disp('------------------------------------')
disp(' P1(s) �̈ʑ����}�̐܂�_�p���g�� wp1')
disp('------------------------------------')

wp1 = [1/(5*T1)  5/T1]
log10_wp1 = log10(wp1);

% ----- P1(s) �̃{�[�h���}�̐܂���ߎ� --------------------
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
disp(' �����v�f�FP(s) = P1(s)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP = zpk(sysP1^4)

% ----- P(s) = P1(s)*P2(s) �̃Q�C�����}�̐܂���ߎ� -------
figure(1)
semilogx(w,20*log10(Gg1_app)*4,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-160 20])
set(gca,'YTick',-160:20:20)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

title('�Q�C�����}�̐܂���ߎ�','FontSize',16,'FontName','MS Gothic')

legend({'${P}_{1}(s) = 1/(1 + s)$',...
        '$P(s) = {P}_{1}(s)^4$'},...
        'Location','southwest',...
        'Interpreter','latex','FontSize',14)

grid on

% ----- P(s) = P1(s)*P2(s) �̈ʑ����}�̐܂���ߎ� ---------
figure(2)
semilogx(w,Gp1_app*4,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-390 30])
set(gca,'YTick',-360:45:0)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('�ʑ����}�̐܂���ߎ�','FontSize',16,'FontName','MS Gothic')

grid on

% =======================================================
% =======================================================

% ----- P1(s), P(s) �̃{�[�h���} -------------------------

[Gg1 Gp1] = bode(sysP1,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

% -------------------------------------------------------
figure(3)
semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,20*log10(Gg1)*4,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-160 20])
set(gca,'YTick',-160:20:20)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

title('�Q�C�����}','FontSize',16,'FontName','MS Gothic')

grid on

% -------------------------------------------------------
figure(4)
semilogx(w,Gp1,'LineWidth',1.5)
hold on

semilogx(w,Gp1*4,':','LineWidth',1.5)
hold off

xlim([1e-2 1e2])
set(gca,'XTick',logspace(-2,2,5))
ylim([-390 30])
set(gca,'YTick',-360:45:0)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

title('�ʑ����}','FontSize',16,'FontName','MS Gothic')

grid on

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
