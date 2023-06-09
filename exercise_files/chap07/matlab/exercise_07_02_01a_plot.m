% exercise_07_02_01a_plot.m
% 問題 7.2 (1)：開ループ伝達関数のベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 7.2 (1)：簡略化されたナイキストの安定判別法 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 　　　　　　　　　                1        ')
disp(' 制御対象の伝達関数 P(s) = -----------------')
disp(' 　　　　　　　　　        (s + 1)^2 (s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/((s + 1)^2*(s + 2))

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

w = logspace(-3,2,1000);

num = 0;
for kP = 14:4:22
    num = num + 1;
    
    sysC = kP
    sysL = sysP*sysC
    
    for i = 1:2
        figure(i)
        nyquist(sysL,w,options)

        hold on
    end
end

% -----------------------------------
figure(1)
hold off
legend('kP = 14','kP = 18','kP = 22')

xlim([-4 12])
ylim([-8 4])

% -----------------------------------
figure(2)
hold off
legend('kP = 14','kP = 18','kP = 22')

xlim([-3 1])
ylim([-3 1])

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

