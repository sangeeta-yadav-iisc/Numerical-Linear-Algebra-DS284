X = rand(7,7);
  [n,p] = size(X);
  v = X;
  for j = 1:1:p
      q(:,j)=v(:,j)/norm(v(:,j));
      for k = j+1:1:p
          v(:,k) = v(:,k) - (q(:,j)'.*v(:,k))*q(:,j);
      end
  end
