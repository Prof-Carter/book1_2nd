% sample_linmod.m
% Simulink を利用したブロック線図の結合

[A B C D] = linmod('fbk_block');    % Simulink モデル fbk_block.slx から入力を In1, In2，
sys = ss(A,B,C,D);                  % 出力を Out1, Out2 とした状態空間表現を生成
sys = tf(sys);      % 状態空間表現を伝達関数表現に変換

sysGyr = sys(1,1)   % r(s) (In1) から y(s) (Out1) への伝達関数 Gyr(s)
sysGyd = sys(1,2)   % d(s) (In2) から y(s) (Out1) への伝達関数 Gyd(s)
sysGer = sys(2,1)   % r(s) (In1) から e(s) (Out2) への伝達関数 Ger(s)
sysGed = sys(2,2)   % d(s) (In2) から e(s) (Out2) への伝達関数 Ged(s)