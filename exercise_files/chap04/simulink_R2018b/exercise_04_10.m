% exercise_04_10.m
% 問題 4.10：Simulink を利用した目標値応答と外乱応答の描画

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % 目標値 r(t) = rc = 1，外乱 d(t) = dc = 0
sim('exercise_04_10_sim_fbk')       % Simulink モデル exercise_04_10_sim_fbk.slx の実行

figure(1)                           % Figure 1 を指定
plot(t,y)                           % 目標値応答 y(t) を描画
xlabel('t [s]'); ylabel('y(t)')     % 横軸のラベル，縦軸のラベル
title('r(t) = 1, d(t) = 0')         % タイトル

% ---------------------------------------
rc = 0;  dc = 1;                    % 目標値 r(t) = rc = 0，外乱 d(t) = dc = 1
sim('exercise_04_10_sim_fbk')       % Simulink モデル exercise_04_10_sim_fbk.slx の実行

figure(2)                           % Figure 2 を指定
plot(t,y)                           % 外乱応答 y(t) を描画
xlabel('t [s]'); ylabel('y(t)')     % 横軸のラベル，縦軸のラベル
title('r(t) = 0, d(t) = 1')         % タイトル

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
