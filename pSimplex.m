% The Simplex Algorithm
% INPUT c, A, b, BASIS / c is a row vector
%matrix = KleeMinty(30)
matrix = Assignment(2)
A = matrix.aMatrixGen(matrix)
b = matrix.bVectorGen(matrix)
c = matrix.costGen(matrix)
Basis = matrix.basisGen(matrix)
% pie
% d = reduced cost
% jE = entering variable index
% jL = leaving variable index
% bbar = current basic solution


INB = inv(A(:,Basis)); bbar = INB*b;
degen = 0;
for step = 1:10000
    cB = c(Basis);
    y = cB*INB;
    cbar = c-y*A;
    [cmin,s] = min(c-y*A);
    if cmin >=-1e-10, break,end
    d = INB*A(:,s); 
    INDEX = find(d>1e-6); 
    if isempty(INDEX)
        error('problem is unbounded') 
    end
    RATIO = bbar(INDEX)./d(INDEX);
    [theta,t] = min(RATIO);
    if theta < 1e-10
        degen = degen + 1;
    end
    r = INDEX(t);
    Basis(r) = s;
    INB = inv(A(:,Basis));
    bbar = INB*b;
end
disp( A)
disp(step)