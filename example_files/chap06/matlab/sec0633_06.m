% sec0631_06.m
% �����v�f�̃{�[�h���}�i�} 6.12�j�ƃx�N�g���O�Ձi�} 6.11 (c)�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �����v�f P(s) = T*s  �̃{�[�h���}')
disp('==================================================')

Ts = tf('s');
sysP = Ts;

% ============================================
% �} 6.12 �̕`�� 
% ============================================

wT = logspace(-2,2,1000);

[Gg Gp] = bode(sysP,wT);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------
figure(1)
semilogx(wT,20*log10(Gg))
grid on

xlabel('\omega{T}')
ylabel('20log_{10}{G}_{g}(\omega) [dB]')
title('P(s) = Ts')

ylim([-40 40])
set(gca,'YTick',-40:20:40)

% -------------------------------------------
figure(2)
semilogx(wT,Gp)
grid on

xlabel('\omega{T}')
ylabel('{G}_{p}(\omega) [deg]')
title('P(s) = Ts')

ylim([-180 180])
set(gca,'YTick',-180:90:180)


% ============================================
% �} 6.11 (b) �̕`�� 
% ============================================
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

figure(3)
nyquist(sysP,options)

xlim([-4 4])
set(gca,'XTick',-4:1:4)
ylim([-3 3])
set(gca,'YTick',-3:1:3)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
