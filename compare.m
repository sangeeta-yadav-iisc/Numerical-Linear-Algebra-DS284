function compare()

X = [1 0 1;0 -2 0;1 -2 0];
I = eye(size(X));

%% Classic Gram Schmidt
[Q,R] = gs(X)
qrerr_gs = norm(Q*R-X,inf)/norm(X,inf);
ortherr_gs = norm(Q'*Q-I,inf);

%% Modified Gram Schmidt
[Q,R] = mgs(X)
qrerr_mgs = norm(Q*R-X,inf)/norm(X,inf);
ortherr_mgs = norm(Q'*Q-I,inf);


%% Report results 
fprintf('QR error\n')
fprintf('Classic:     %10.3e\n',qrerr_gs)
fprintf('Modified:    %10.3e\n',qrerr_mgs)

fprintf('\n')
fprintf('Orthogonality error\n')
fprintf('Classic:     %10.3e\n',ortherr_gs)
fprintf('Modified:    %10.3e\n',ortherr_mgs)
