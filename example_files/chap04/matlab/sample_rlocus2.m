% sample_rlocus2.m
% 根軌跡：例 4.10

close all
clear
format compact

s = tf('s');
sysPCd = 1/((s + 1)*(s + 4)*(s + 7));

figure(1); rlocus(sysPCd)

% 最近のバージョン用
axis_x = findall(gcf,'String','実軸 (秒^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (秒^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% 古いバージョン用 (R2018a など）
axis_x = findall(gcf,'String','実軸 (seconds^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (seconds^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');