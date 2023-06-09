% example_04_10b.m
% 例 4.10：根軌跡の性質の利用
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 4.10 ')
disp('==================================================')

close all
clear
format compact

syms s
syms K real

Ps  = 1/((s + 1)*(s + 4)*(s + 7));
Cds = 1;
Cs  = K*Cds;

[Np  Dp]  = numden(Ps);
[Nc  Dc]  = numden(Cs);

% *******************************************************
nn = 5;
mm = 4;

for i = 1:nn
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% *******************************************************
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 性質１ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('----- P(s)*Cd(s) -----')
PCds = Ps*Cds
[num den] = numden(PCds);

disp('----- P(s)*Cd(s) の極 pi -----')
den_coeffs = coeffs(den,s, 'All');

if length(den_coeffs) > 1
    p = roots(den_coeffs)
else
    p = []
end

disp('----- P(s)*Cd(s) の零点 zi -----')
num_coeffs = coeffs(num,s, 'All');

if length(num_coeffs) > 1
    z = roots(num_coeffs)
else
    z = []
end

disp('----- P(s)*Cd(s) の極の数 n -----')
n = length(den_coeffs) - 1

disp('----- P(s)*Cd(s) の零点の数 m -----')
m = length(num_coeffs) - 1

for i = 1:nn
    figure(i)
    plot(real(p),imag(p),'x','LineWidth',1.5,'MarkerSize',12,'Color',[232  71  70]/255)
    hold on
    plot(real(z),imag(z),'o','LineWidth',1.5,'MarkerSize',10,'Color',[232  71  70]/255)
end

% *******************************************************
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 性質２ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

point = [];

num = 0;
for i = 1:n
   if imag(p(i)) == 0
       num = num + 1;
       point(num) = p(i);
   end
end
for i = 1:m
   if imag(z(i)) == 0
       num = num + 1;
       point(num) = z(i);
   end
end

disp('----- 実軸上の極もしくは零点 -----')
point = sort(point,'descend')

disp('----- 実軸上で根軌跡の一部となるのは -----')
for i = 1:2:length(point)-1
    fprintf(' %3.2e 〜 %3.2e の区間 \n', point(i+1),point(i))
end
if mod(length(point),2) == 1
    fprintf(' -∞ 〜 %3.2e の区間 \n', point(end)) 
end

for j = 2:mm
    figure(j)
    hold on
    for i = 1:2:length(point)-1  
        plot([point(i) point(i+1)],[0 0],'LineWidth',1.5,'Color',[  0 112 192]/255)
    end
    if mod(length(point),2) == 1   
        plot([-1e10 point(end)],[0 0],'LineWidth',1.5,'Color',[  0 112 192]/255)
    end
end

% *******************************************************
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 性質３ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

st = (1/(n - m))*(sum(p) - sum(z));

disp('----- 漸近線の始点 -----')
fprintf(' (%f, 0) \n',st)

i = 0;
for ell = 0:n-1
    i = i + 1;
    phi(i) = sym((2*ell + 1)*pi/(n - m));
end

disp('----- 漸近線の勾配 -----')
phi

R = 12;  % 描画する漸近線の中心からの半径

for j = 3:nn
    figure(j)
    for i = 1:n
        plot([st st+R*cos(phi(i))],R*sin(phi(i))*[0 1],'Color',[1 1 1]*0.5)
        hold on
    end
end

% *******************************************************
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 性質４ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('----- d(1/(P(s)Cd(s)))/ds -----')
inv_PCds = diff(1/PCds,s);
inv_PCds = collect(inv_PCds,s)

disp('----- d(1/(P(s)Cd(s)))/ds = 0 の解 -----')
sol = solve(inv_PCds,s);
sol = sort(sol,'descend')
double(sol)

disp('----- 実軸上の根軌跡の合流点もくくは分岐点 -----')
sol2 = [];

num2 = 0;
for kk = 1:length(sol)
    if imag(sol(kk)) == 0
        for i = 1:2:length(point)-1
            if point(i+1) < sol(kk) && sol(kk) < point(i)
               fprintf(' (%f, 0) \n',sol(kk))

               num2 = num2 + 1;
               sol2(num2) = sol(kk);
               break
            end
        end
    end
end

if mod(length(point),2) == 1
    if imag(sol(end)) == 0
        if sol(end) < point(end)
           fprintf(' (%f, 0) \n',sol(end))

           num2 = num2 + 1;
           sol2(num2) = sol(end);
        end
    end
end

for i = 4:nn
    figure(i)
    plot(real(sol2),imag(sol2),'*','LineWidth',1.5,'MarkerSize',12,'Color',[228 131  18]/255)
    hold on
end

% *******************************************************
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 性質５ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

hurwitz_sym     % hurwitz_sym.m の実行

disp(' ')
disp('----- K > 0 を考慮した安定条件 -----')
sol = solve(cond & K > 0, K,'ReturnConditions',true);
condition = subs(sol.conditions,K)

% ---------------------
s = tf('s');
sysP  = 1/((s + 1)*(s + 4)*(s + 7));
sysCd = 1;

sysPCd = sysP*sysCd;

r = rlocus(sysPCd);

figure(nn)
for i = 1:n
    plot(real(r(i,:)),imag(r(i,:)),'LineWidth',1.5,'Color',[  0 112 192]/255)
    hold on
end

% Figure(5) の根軌跡にマーカを再描画
plot(real(p),imag(p),'x','LineWidth',1.5,'MarkerSize',12,'Color',[232  71  70]/255)
plot(real(z),imag(z),'o','LineWidth',1.5,'MarkerSize',10,'Color',[232  71  70]/255)
plot(real(sol2),imag(sol2),'*','LineWidth',1.5,'MarkerSize',12,'Color',[228 131  18]/255)

% *******************************************************
for i = 1:nn
    figure(i)
    hold off
    grid on
    axis square
    
    xlim([-12 4])
    ylim([-8 8])
    set(gca,'XTick',-12:2:4)
    set(gca,'YTick',-8:2:8)
    xtickangle(0)
    
    set(gca,'FontName','Arial','FontSize',14)
    
    xlabel('実軸','FontName','MS Gothic','FontSize',16)
    ylabel('虚軸','FontName','MS Gothic','FontSize',16)
end

figure(1); title('性質１','FontName','MS Gothic','FontSize',16)
figure(2); title('性質２','FontName','MS Gothic','FontSize',16)
figure(3); title('性質３','FontName','MS Gothic','FontSize',16)
figure(4); title('性質４','FontName','MS Gothic','FontSize',16)
figure(5); title('性質５','FontName','MS Gothic','FontSize',16)

figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
figure(4); movegui('south')
figure(5); movegui('southeast')


