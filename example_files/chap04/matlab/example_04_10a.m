% example_04_10a.m
% 例 4.10：根軌跡の性質の利用（根軌跡の描画のみ）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.10 ')
disp('==================================================')

s = tf('s');
sysP  = 1/((s + 1)*(s + 4)*(s + 7));
sysCd = 1;

sysPCd = sysP*sysCd;

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

t = 0:0.001:2.5;

for kP = [150 300 440]
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

legend('kP = 150','kP = 300','kP = 440')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
    