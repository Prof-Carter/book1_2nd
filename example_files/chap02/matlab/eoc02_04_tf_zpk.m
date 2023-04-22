% eoc02_04_tf_zpk.m
% 関数 tf, zpk で定義されたモデルの変換

clear
format compact

sysP1 = tf([4 8],[1 2 -15 0])   % 伝達関数 P1(s) を関数 tf により定義
sysP2 = zpk(sysP1)              % 関数 tf で定義した伝達関数 P1(s) を関数 zpk での表現に変換
sysP3 = tf(sysP2)               % 関数 zpk で定義した伝達関数 P2(s) を関数 tf での表現に変換