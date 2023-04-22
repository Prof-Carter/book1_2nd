% example_03_04.m
% 例 3.4：単位インパルス関数（デルタ関数） f(t) = δ(t) のラプラス変換
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 3.4：単位インパルス関数（デルタ関数）f(t) = δ(t)')
disp(' 　　　　のラプラス変換')
disp('==================================================')

syms s
syms t real
syms e real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ インパルス関数 delta_e(t) = 1/e (0 <= t <= e)')
disp('+ 　　　　　　　（t < 0, e < t では delta_e(t) = 0）')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

delta_e(t) = 1/e

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 定義式に基づくインパルス関数 delta_e(t) のラプラス変換')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Delta_e(s) = ∫ delta_e(t)*exp(-s*t) dt')
disp('+                      （積分区間：0 <= t <= e）')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Delta_e(s) = int(delta_e(t)*exp(-s*t),t,0,e)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 定義式に基づく単位インパルス関数（デルタ関数）δ(t) の')
disp('+ ラプラス変換 F(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ F(s) = limit Delta_e(s)')
disp('+        e->0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F(s) = limit(Delta_e(s),e,0)
