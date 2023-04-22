% exercise_06_07_customize_tex.m
% ñ‚ëË 6.7ÅF1 éüíxÇÍóvëfÇÃÉxÉNÉgÉããOê’Ç∆É{Å[Éhê¸ê}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ñ‚ëË 6.7')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ì`íBä÷êî P(s) = 1/(1 + T*s) (T = 10)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

T = 10
sysP = 1/(1 + T*s)

% -------------------------------------------
w = logspace(-3,1,1000);

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ÉJÉbÉgÉIÉtäpé¸îgêî wc [rad/s]')
disp(' ÅiÉQÉCÉìê¸ê}ÇÃê‹ÇÍì_äpé¸îgêîÅj')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wc = 1/T

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gg(wc) [î{], Gp(wc) [deg]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Gg_wc Gp_wc] = bode(sysP,wc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 20*log10(Gg(wc)) [dB]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

20*log10(Gg_wc)

% ----- ÉQÉCÉìê¸ê}ÇÃï`âÊ ---------------------------------

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) 

semilogx([w(1) wc    ], [0 0],                    'Color',[217 83 25]/255,'LineWidth',1.5)
hold on
semilogx([wc   w(end)],-20*log10([wc   w(end)]*T),'Color',[217 83 25]/255,'LineWidth',1.5)

semilogx(w, 20*log10(Gg),  'Color',[0 114 189]/255,'LineWidth',1.5)

semilogx(wc,0,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
semilogx(wc,20*log10(Gg_wc),'o', ...
                 'Color',[0 114 189]/255, ...    
                 'MarkerFaceColor',[0 114 189]/255, ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

ylim([-40 10])

% ----- à ëäê¸ê}ÇÃï`âÊ -----------------------------------

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' à ëäê¸ê}ÇÃê‹ÇÍì_äpé¸îgêî')
disp(' w1 = 1/(5*T), w2 = 5*T [rad/s]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

w1 = 1/(5*T)
w2 = 5/T

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775]) 

semilogx([w(1) w1    ],[  0   0],'Color',[217 83 25]/255,'LineWidth',1.5)
hold on
semilogx([w1   w2    ],[  0 -90],'Color',[217 83 25]/255,'LineWidth',1.5)
semilogx([w2   w(end)],[-90 -90],'Color',[217 83 25]/255,'LineWidth',1.5)

semilogx(w,Gp,'Color',[0 114 189]/255,'LineWidth',1.5)

semilogx(w1,0,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
semilogx(w2,-90,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);

semilogx([w(1) wc],[Gp_wc  Gp_wc],'k')
semilogx([wc   wc],[-105   Gp_wc],'k')
semilogx(wc,Gp_wc,'o', ...
                 'Color',[0 114 189]/255, ...    
                 'MarkerFaceColor',[0 114 189]/255, ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

ylim([-105 15])
set(gca,'YTick',-105:15:15)

% ----- ÉxÉNÉgÉããOê’ÇÃï`âÊ --------------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ÉxÉNÉgÉããOê’';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

nyquist(sysP,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)

xlim([-0.2 1.2])
ylim([-0.8 0.2])
set(gca,'XTick',-0.2:0.2:1.2)
set(gca,'YTick',-0.8:0.2:0.2)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
