% exercise_03_12_01.m
% 問題 3.12：問題 3.4 (1) の伝達関数に対する時間応答

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' 問題 3.12　<===　問題 3.4 (1)')
disp('==================================================')

sysP = 3/(s + 2)

y1 = impulse(sysP,t);
figure(1)
plot(t,y1)
title('インパルス応答')

y2 = step(sysP,t);
figure(2)
plot(t,y2)
title('単位ステップ応答')

u  = t;
y3 = lsim(sysP,u,t);
figure(3)
plot(t,y3)
title('単位ランプ応答')

for i = 1:3
    figure(i)
    xlabel('t [s]')
    ylabel('y(t)')
    grid on
end

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


