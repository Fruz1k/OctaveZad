x=[-4, -2, 0, 2, 4, 5, 6];
y=[-1, 4, 0, -4, -1, 1, -2];
if length(x)==length(y);
  stopien=3;
  n=length(x);
  if stopien<n-1
  X=zeros(stopien+1,stopien+1);
  A=zeros(stopien+1,1);
  Y=zeros(stopien+1,1);
  for i=1:stopien+1
    for j=1:stopien+1
      for k=1:n
        X(i,j)= X(i,j)+x(k)^((j+i)-2);
      endfor
     endfor
  endfor
disp("Macierz X");
disp(X);
  for i=1:stopien+1
    for k=1:n
      Y(i,1)=Y(i,1)+y(k)*x(k)^(i-1);
    end
  end
  disp("Macierz Y");
  disp(Y);
  A=inv(X)*Y;
  disp("Macierz A - współczynników");
  disp(A);
else
 disp("Za duzy stopien wielomianu aproksymujacego");
end
end

