% example_04_09.m
% 例 4.9：根軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.9 ')
disp('==================================================')

s = tf('s');

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 P(s) = 5/(s^2 + 2s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP  = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ コントローラ C(s) = k Cd(s)')
disp('+ 　　　　　　 Cd(s) = 1, k = kP')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysCd = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s)Cd(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysPCd = sysP*sysCd

% =====================================================
% 根軌跡
% =====================================================

figure(1)
rlocus(sysPCd)

% 古いバージョン用（R2018a など）
axis_x = findall(gcf,'String','実軸 (seconds^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (seconds^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% 最近のバージョン用
axis_x = findall(gcf,'String','実軸 (秒^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (秒^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% =====================================================
% 単位ステップ応答
% =====================================================

t = 0:0.001:5;

for kP = [0.5 2 5]
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    sysGyr = minreal(sysL/(1 + sysL));
    
    y = step(sysGyr,t);
    
    figure(2)
    plot(t,y)
    hold on
end

figure(2)
hold off

xlabel('t [s]')
ylabel('y(t)')

legend('kP = 0.5','kP = 2','kP = 5')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

    