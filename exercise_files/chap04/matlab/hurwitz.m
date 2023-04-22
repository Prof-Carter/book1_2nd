% hurwitz.m
% 簡略化したフルビッツの安定判別法

N = length(denP);
n = N - 1;

alpha = flip(denP);
if denP(1) < 0
    alpha = - alpha;
end

if alpha > 0
    for i = 1:n
        for j = 1:n
            k = (N - 1) + (i - 1) - 2*(j - 1);

            if k >= 1 & k <= N
                H(i,j) = alpha(k);
            else
                H(i,j) = 0;
            end
        end
    end

    fprintf('\n---------------------\n')
    fprintf('フルビッツ行列：\n')
    H

    if mod(n,2) == 0
        i_min = 3; i_max = n - 1;
    else
        i_min = 2; i_max = n - 1;
    end

    flag = 0;
    for i = i_min:2:i_max
        h = det(H(1:i,1:i));
        str = ['H', num2str(i), '= h'];
        
        fprintf('\n---------------------\n')
        fprintf('小行列式：\n')
        eval(str)

        if h <= 0
            flag = 1;
        end
    end

    if flag == 0
        fprintf('\n---------------------\n')
        fprintf('安定性の判別：\n')
        fprintf(' 安定である\n');
    else
        fprintf('\n---------------------\n')
        fprintf('安定性の判別：\n')
        fprintf(' 安定ではない');
        fprintf(' ---> 条件 I を満足するが，条件 II を満足しない\n');
    end
else
    fprintf('\n---------------------\n')
    fprintf('安定性の判別：\n')
    fprintf(' 安定ではない');
    fprintf(' ---> 条件 I を満足しない\n');
end