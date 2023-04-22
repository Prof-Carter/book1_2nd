% hurwitz_sym.m
% フルビッツの安定判別法（簡略化した条件）

alpha = coeffs(Delta,s);

N = length(alpha);
n = N - 1;

% ===== 条件 I =======================
disp('----- 条件 I：a_i > 0 ------')
for i = 0:n
    str = ['a', num2str(i), '= alpha(i+1)'];
    eval(str)
end

cond_A = ' ';
for i = 0:n
    if i == 0
        cond_A = strcat(cond_A,['simplify(a' num2str(i) '> 0)']);
    else
        cond_A = strcat(cond_A,[' & simplify(a' num2str(i) '> 0)']);
    end
end

% ===== 条件 II =======================
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

disp('----- フルビッツ行列 H ------')
H

if mod(n,2) == 0
    i_min = 3; i_max = n - 1;
else
    i_min = 2; i_max = n - 1;
end

disp('----- 条件 II：H_i > 0 ------')
for i = i_min:2:i_max
    h = det(H(1:i,1:i));
    str = ['H', num2str(i), '= h'];
    eval(str)
end
if n == 2
    disp('不要')
end

cond_B = ' ';
for i = i_min:2:i_max
    if i == i_min
        cond_B = strcat(cond_B,['simplify(H' num2str(i) '> 0)']);
    else
        cond_B = strcat(cond_B,[' & simplify(H' num2str(i) '> 0)']);
    end
end

% ===== 安定条件=======================
disp('----- 安定条件------')
if cond_B == ' '
    cond = simplify(eval(cond_A))
else
    cond = simplify(eval(cond_A) & eval(cond_B))
end

