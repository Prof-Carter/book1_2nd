% margin_arm_pid_cont_customize.m
% ���g�����`�ɂ��A�[���n�� PID ����
% �i�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

v = ver('MATLAB');
if v.Release < "(R2021a)"
    disp('****************************')
    disp('R2021a �ȍ~�œ��삵�܂�')
    disp('****************************')
else

    arm_para
    
    s = tf('s');
    sysP = 1/(J*s^2 + c*s + M*g*l);
    
    t = 0:0.001:1.5;
    w = logspace(-2,3,1000);
    
    % -----------------------------------
    options1 = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ
    
    options1.Xlabel.String = '�p���g��';            % �����̃��x��
    options1.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��
    
    options1.Title.FontSize     = 14;  % �^�C�g���̃t�H���g�T�C�Y
    options1.Xlabel.FontSize    = 16;  % �����̃��x���̃t�H���g�T�C�Y
    options1.YLabel.FontSize    = 16;  % �c���̃��x���̃t�H���g�T�C�Y
    options1.TickLabel.FontSize = 14;  % ���̃t�H���g�T�C�Y
    
    % -----------------------------------
    options2 = timeoptions;            % ���ԉ����̃I�v�V�����ꗗ
    
    options2.Title.String = '�X�e�b�v����';
    
    options2.Title.FontSize     = 14;
    options2.XLabel.FontSize    = 16;
    options2.YLabel.FontSize    = 16;
    options2.TickLabel.FontSize = 14;
    
    % -----------------------------------
    for i = 1:7
        figure(i)
        subplot('Position',[0.15 0.15 0.775 0.775])
    end
    
    % -----------------------------------
    for i = 1:3
        if i == 1
            kP = 5.75; TI = 0.75; TD = 0.026;
            Tf = 0;
            line_type = 'b--';
        elseif i == 2
            kP = 5.75; TI = 0.75; TD = 0.026;
            Tf = TD/2;
            line_type = 'r-';
        else
            kP = 5.75; TI = 0.75; TD = 0;
            Tf = 0;
            line_type = 'g-.';
        end
        
        sysC = kP*(1 + 1/(TI*s) + TD*s/(1 + Tf*s));
        figure(7); bode(sysC,w,options1,line_type); hold on

        sysL = minreal(sysP*sysC);
        figure(i); margin(sysL,options1)
    
        h = findobj(gcf,'type','Line');   % Line �Ƃ������O�̃I�u�W�F�N�g������
        set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX
        
        ax = findall(gcf,'type','Axes');
        set(ax(2),'Xlim',[1e-2 1e3])	% �����ڐ��͈�
        set(ax(2),'Ylim',[-200 -25])    % �ʑ��F�c���ڐ��͈�
        set(ax(3),'Ylim',[-80 60])      % �Q�C���F�c���ڐ��͈�
    
        set(ax(2),'Ytick',-180:45:0)      % �ʑ��F�c���ڐ�
        set(ax(3),'Ytick',-80:20:60)      % �Q�C���F�c���ڐ�
    
        sysS = minreal(   1/(1 + sysL));
        sysT = minreal(sysL/(1 + sysL));
    
        figure(4); step(sysT,t,options2,line_type); hold on    
        figure(5); bodemag(sysS,w,options1,line_type); hold on    
        figure(6); bodemag(sysT,w,options1,line_type); hold on
    end
    
    figure(4); hold off
    ylim([0 1.5])
    
    figure(5); hold off; grid on
    ylim([-60 20])
    
    figure(6); hold off; grid on
    ylim([-60 20])
    
    for i = 4:7
        figure(i)
        h = findobj(gcf,'type','Line');   % Line �Ƃ������O�̃I�u�W�F�N�g������
        set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX
    
        [~, hobj, ~, ~] = legend({'PID (Tf = 0)','PID (Tf = TD/2)','PI'}, ...
                                  'FontSize',14,'FontName','Arial');
        hh = findobj(hobj,'type','Line');
        set(hh,'LineWidth',1.5)
    end
    
    figure(4); set(legend,'Location','southeast')
    figure(5); set(legend,'Location','southeast')
    figure(6); set(legend,'Location','southwest')
    figure(7); set(legend,'Location','northwest')
    
    % -----------------------------------
    figure(1); movegui('northwest')
    figure(2); movegui('north')
    figure(3); movegui('northeast')
    figure(4); movegui('southwest')
    figure(5); movegui('south')
    figure(6); movegui('southeast')
    figure(7); movegui('center'); grid on

end