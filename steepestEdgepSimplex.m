% The Simplex Algorithm
% INPUT c, A, b, BASIS / c is a row vector
%matrix = KleeMinty(30)
matrix = Assignment(25);
A = matrix.aMatrixGen(matrix);
b = matrix.bVectorGen(matrix);
c = matrix.costGen(matrix);
Basis = matrix.basisGen(matrix);
% pie
% d = reduced cost
% jE = entering variable index
% jL = leaving variable index
% bbar = current basic solution

time = cputime;
INB = inv(A(:,Basis)); bbar = INB*b;
degen = 0;
for step = 1:10000000
    cB = c(Basis);
    y = cB*INB;
    cbar = c-y*A;
    if min(cbar) >=-1e-10, break,end
    cur_theta = inf;
    for s_iter = 1:length(cbar)
        if cbar(s_iter) <= -1e-10
            d = INB*A(:,s_iter);
            INDEX = find(d>1e-6);
            col_ratio = bbar(INDEX)./d(INDEX);
            [theta,t_iter] = min(col_ratio);
            if theta < cur_theta
                cur_theta = theta;
                s = s_iter;
                t = t_iter;
            end
        end
    end
    d = INB*A(:,s);
    INDEX = find(d>1e-6);
    if isempty(INDEX)
        error('problem is unbounded') 
    end
    if theta < 1e-10
        degen = degen + 1;
    end
    r = INDEX(t);
    Basis(r) = s;
    INB = inv(A(:,Basis));
    bbar = INB*b;
end
disp( 'steepest edge')
disp(cputime - time)
disp(step)
disp(degen)
disp(y*b)