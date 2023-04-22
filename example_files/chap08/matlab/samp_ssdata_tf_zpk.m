% samp_ssdata_tf_zpk.m
% 状態空間表現の係数行列の抽出
% 状態空間表現から伝達関数表現への変換

arm_ss      % arm_ss.m の実行

disp(' ')
disp('--- 状態空間表現の係数行列の抽出 ---')
[A B C D] = ssdata(sys)

disp(' ')
disp('--- 状態空間表現から伝達関数表現への変換 ---')
sysP = tf(sys)


disp(' ')
disp('--- 状態空間表現から伝達関数表現への変換 ---')
disp('--- （零点/極/ゲインモデル） ---')
sysP = zpk(sys)
