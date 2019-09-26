clc
clear
%% Initialization
for k = 1:1:20
    f = 10*k;
    A = magic(f); 
    A = A(:,1:f-5);
    [r,c]=size(A);
    b = 260*ones(f,1);
    %% Direct Solution
    x1 = A\b;
    %s(1)= norm(A*x1-b);
    %% Using MATLAB pseudoinverse
    x2 = pinv(A)*b;
    %% Least square using SVD decomposition
    [U,S,V] = svd(A,0);
    bd = U'*b;
    y = inv(S)*bd;% (8x6)
    x3 = V*y;
    %% Least square using QR decomposition
    [Q,R] = qr(A,0);
    c1 = Q'*b;
    x4 = inv(R)*c1;
    %% Least Square using Pseudoinverse
    %x5 = inv(A'*A)*A'*b;
    %% Residual calculation
    s(1,k)= -log(norm(A*x1-b));
    s(2,k)= -log(norm(A*x2-b));
    s(3,k)= -log(norm(A*x3-b));
    s(4,k)= -log(norm(A*x4-b));
    %s(5,k)= -log(norm(A*x5-b));
    e(k) = f;
end
%e = 20:10:40;
plot(e,s)
legend('Direct','PI-M', 'SVD','QR')
xlabel('Matrix Size')
ylabel('-log(Residual)')


%% Error in the solution
% n(1)= norm(x1); % Direct solution
% n(2)= norm(x2); % LS using SVD
% n(3)= norm(x3);% LS using SVD
% n(4)= norm(x4);
% n(5)= norm(x5);

% s(1,k)= norm(A*x1-b);
% s(2,k)= norm(A*x2-b);
% s(3,k)= norm(A*x3-b);
% s(4,k)= norm(A*x4-b);
%s(5,k)= norm(A*x5-b);