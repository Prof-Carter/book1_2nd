% exercise_06_07.m
% –â‘è 6.7F1 Ÿ’x‚ê—v‘f‚ÌƒxƒNƒgƒ‹‹OÕ‚Æƒ{[ƒhü}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' –â‘è 6.7')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' “`’BŠÖ” P(s) = 1/(1 + T*s) (T = 10)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

T = 10
sysP = 1/(1 + T*s)


% -------------------------------------------
w = logspace(-3,1,1000);

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ƒJƒbƒgƒIƒtŠpü”g” wc [rad/s]')
disp(' iƒQƒCƒ“ü}‚ÌÜ‚ê“_Špü”g”j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wc = 1/T

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gg(wc) [”{], Gp(wc) [deg]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Gg_wc Gp_wc] = bode(sysP,wc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 20*log10(Gg(wc)) [dB]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

20*log10(Gg_wc)

% ----- ƒQƒCƒ“ü}‚Ì•`‰æ ---------------------------------

figure(1)
semilogx([w(1) wc    ], [0 0],'r')
hold on
semilogx([wc   w(end)],-20*log10([wc   w(end)]*T),'r')

semilogx(w, 20*log10(Gg),'b')

semilogx(wc,0,'ro');
semilogx(wc,20*log10(Gg_wc),'bo');
hold off

grid on

xlabel('\omega [rad/s]')
ylabel('20log_{10}Gg(\omega) [dB]')

% ----- ˆÊ‘Šü}‚Ì•`‰æ -----------------------------------

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ˆÊ‘Šü}‚ÌÜ‚ê“_Špü”g”')
disp(' w1 = 1/(5*T), w2 = 5*T [rad/s]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

w1 = 1/(5*T)
w2 = 5/T

figure(2)
semilogx([w(1) w1    ],[  0   0],'r')
hold on
semilogx([w1   w2    ],[  0 -90],'r')
semilogx([w2   w(end)],[-90 -90],'r')

semilogx(w,Gp,'b')

semilogx(w1,0,'ro');
semilogx(w2,-90,'ro');

semilogx(wc,Gp_wc,'bo');
hold off

grid on

xlabel('\omega [rad/s]')
ylabel('Gp(\omega) [deg]')


% ----- ƒxƒNƒgƒ‹‹OÕ‚Ì•`‰æ --------------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ƒxƒNƒgƒ‹‹OÕ';

figure(3)
nyquist(sysP,options)
ylim([-1 0.5])

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')