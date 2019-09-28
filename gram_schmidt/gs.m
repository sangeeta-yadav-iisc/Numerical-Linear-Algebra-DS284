function [Q,R] = gs(X)
    % Classical Gram-Schmidt.  
    
    [n,p] = size(X);
    Q = zeros(n,p);
    R = zeros(p,p);
    for k = 1:p
        Q(:,k) = X(:,k);
        if k ~= 1
            R(1:k-1,k) = Q(:,k-1)'*Q(:,k);
            Q(:,k) = Q(:,k) - Q(:,1:k-1)*R(1:k-1,k);
        end
        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k)/R(k,k);
     end
end