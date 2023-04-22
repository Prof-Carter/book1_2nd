% arm_trans.m
% 鉛直面を回転するアーム系の伝達関数

disp('アーム角度の平衡点を入力して下さい');      % コマンドウィンドウへの表示
ye = input('ye = ');            % y(t) の平衡点 ye をコマンドウィンドウで入力
ue = M*l*g*sin(ye)              % u(t) の平衡点 ue

numP = 1;                       % 伝達関数 P(s) の分子多項式 N(s)
denP = [J c M*l*g*cos(ye)];     % 伝達関数 P(s) の分母多項式 D(s)
sysP = zpk(tf(numP,denP))       % 伝達関数 P(s) = N(s)/D(s) の定義
pole(sysP)                      % 伝達関数 P(s) の極
