% sample_step_sym_customize_tex.m
% �P�ʃX�e�b�v�����̌v�Z�ƕ`��F�� 3.13
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

syms t real         % ���ԕϐ� t �̒�`
syms s              % ���v���X���Z�q�̒�`

ut = sym(1)         % u(t) = 1 �̒�`
us = laplace(ut)    % u(t) = 1 �̃��v���X�ϊ�

Ps = 10/(s^2 + 2*s + 10)    % �`�B�֐� P(s) �̒�`
ys = Ps*us                  % y(s)
ys = partfrac(ys)           % y(s) �𕔕���������

yt = ilaplace(ys)           % y(s) �̋t���v���X�ϊ��F�P�ʃX�e�b�v����

dyt = diff(yt,t);           % dy(t)/dt
dyt = simplify(dyt)         % dy(t)/dt �̒P����

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
fplot(yt,[0 5],'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
grid on

set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:1.2)