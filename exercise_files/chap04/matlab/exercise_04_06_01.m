% exercise_04_06_01.m
% –â‘è 4.6 (1)Fª‹OÕ‚Ì«¿‚Ì—˜—p
% ySymbolic Math Toolbox ‚ª•K—vz

disp(' ')
disp('==================================================')
disp(' –â‘è 4.6 (1) ')
disp('==================================================')

close all
clear
format compact

syms s
syms K real

Ps  = 1/(s*(s + 1)*(s + 2)*(s + 3));
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
disp(' «¿‚P ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('----- P(s)*Cd(s) -----')
PCds = Ps*Cds
[num den] = numden(PCds);

disp('----- P(s)*Cd(s) ‚Ì‹É pi -----')
den_coeffs = coeffs(den,s, 'All');

if length(den_coeffs) > 1
    p = roots(den_coeffs)
else
    p = []
end

disp('----- P(s)*Cd(s) ‚Ì—ë“_ zi -----')
num_coeffs = coeffs(num,s, 'All');

if length(num_coeffs) > 1
    z = roots(num_coeffs)
else
    z = []
end

disp('----- P(s)*Cd(s) ‚Ì‹É‚Ì” n -----')
n = length(den_coeffs) - 1

disp('----- P(s)*Cd(s) ‚Ì—ë“_‚Ì” m -----')
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
disp(' «¿‚Q ')
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

disp('----- À²ã‚Ì‹É‚à‚µ‚­‚Í—ë“_ -----')
point = sort(point,'descend')

disp('----- À²ã‚Åª‹OÕ‚Ìˆê•”‚Æ‚È‚é‚Ì‚Í -----')
for i = 1:2:length(point)-1
    fprintf(' %3.2e ` %3.2e ‚Ì‹æŠÔ \n', point(i+1),point(i))
end
if mod(length(point),2) == 1
    fprintf(' -‡ ` %3.2e ‚Ì‹æŠÔ \n', point(end)) 
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
disp(' «¿‚R ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

st = (1/(n - m))*(sum(p) - sum(z));

disp('----- ‘Q‹ßü‚Ìn“_ -----')
fprintf(' (%f, 0) \n',st)

i = 0;
for ell = 0:n-1
    i = i + 1;
    phi(i) = sym((2*ell + 1)*pi/(n - m));
end

disp('----- ‘Q‹ßü‚ÌŒù”z -----')
phi

R = 12;  % •`‰æ‚·‚é‘Q‹ßü‚Ì’†S‚©‚ç‚Ì”¼Œa

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
disp(' «¿‚S ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('----- d(1/(P(s)Cd(s)))/ds -----')
inv_PCds = diff(1/PCds,s);
inv_PCds = collect(inv_PCds,s)

disp('----- d(1/(P(s)Cd(s)))/ds = 0 ‚Ì‰ğ -----')
sol = solve(inv_PCds,s);
sol = sort(sol,'descend')
double(sol)

disp('----- À²ã‚Ìª‹OÕ‚Ì‡—¬“_‚à‚­‚­‚Í•ªŠò“_ -----')
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
disp(' «¿‚T ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

hurwitz_sym     % hurwitz_sym.m ‚ÌÀs

sol = solve(cond & K > 0,'ReturnConditions',true);

disp(' ')
disp('----- K > 0 ‚ğl—¶‚µ‚½ˆÀ’èğŒ -----')
condition = subs(sol.conditions,K)

% ---------------------

s = tf('s');
sysP  = 1/(s*(s + 1)*(s + 2)*(s + 3));
sysCd = 1;

sysPCd = sysP*sysCd;

r = rlocus(sysPCd);

figure(nn)
for i = 1:n
    plot(real(r(i,:)),imag(r(i,:)),'LineWidth',1.5,'Color',[  0 112 192]/255)
    hold on
end

% Figure(5) ‚Ìª‹OÕ‚Éƒ}[ƒJ‚ğÄ•`‰æ
plot(real(p),imag(p),'x','LineWidth',1.5,'MarkerSize',12,'Color',[232  71  70]/255)
plot(real(z),imag(z),'o','LineWidth',1.5,'MarkerSize',10,'Color',[232  71  70]/255)
plot(real(sol2),imag(sol2),'*','LineWidth',1.5,'MarkerSize',12,'Color',[228 131  18]/255)

% *******************************************************
for i = 1:nn
    figure(i)
    hold off
    grid on
    axis square
    
    xlim([-6 2])
    ylim([-4 4])
    set(gca,'XTick',-6:1:2)
    set(gca,'YTick',-4:1:4)
    xtickangle(0)
    
    set(gca,'FontName','Arial','FontSize',14)
    
    xlabel('À²','FontName','MS Gothic','FontSize',16)
    ylabel('‹•²','FontName','MS Gothic','FontSize',16)
end

figure(1); title('«¿‚P','FontName','MS Gothic','FontSize',16)
figure(2); title('«¿‚Q','FontName','MS Gothic','FontSize',16)
figure(3); title('«¿‚R','FontName','MS Gothic','FontSize',16)
figure(4); title('«¿‚S','FontName','MS Gothic','FontSize',16)
figure(5); title('«¿‚T','FontName','MS Gothic','FontSize',16)

figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
figure(4); movegui('south')
figure(5); movegui('southeast')

% figure(1); exportgraphics(gcf,'exercise_04_06_01_1.pdf')
% figure(2); exportgraphics(gcf,'exercise_04_06_01_2.pdf')
% figure(3); exportgraphics(gcf,'exercise_04_06_01_3.pdf')
% figure(4); exportgraphics(gcf,'exercise_04_06_01_4.pdf')
% figure(5); exportgraphics(gcf,'exercise_04_06_01_5.pdf')
