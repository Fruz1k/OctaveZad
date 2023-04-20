w0 = [2,4];
w1 = [4,1];
w2 = [-3,-4];
%Macierz wezlow
w = [w0;w1;w2];
%Baza wielomianu Lagrange'a


fi = zeros(1,3);
for i=1:columns(fi)
  fi(i)=1;
  for j=1:rows(w)
    if i ~= j
    fi(i)*= (w(i,1)-w(j,1));
    endif
  endfor
endfor
disp(fi)
a = zeros(1,3);
for i = 1:3
 a(i) = w(i,2) / fi(i);
endfor
% Wyznaczenie ogolnego wzoru wielomianu (do określenia wsp. równania interpolacyjnego)
% a*(x-m)*(x-n) = ax^2 - a(m+n)x + amn
% wspolczynnik przy potedze 0 = amn
% wspolczynnik przy potedze 1 = -a(m+n)
% wspolczynnik przy potedze 2 = a
wsp = zeros(1,3);
wsp(1) = a(1)*w(2,1)*w(3,1)+a(2)*w(1,1)*w(3,1)+a(3)*w(1,1)*w(2,1);
wsp(2) = -a(1)*(w(2,1)+w(3,1))-a(2)*(w(1,1)+w(3,1))-a(3)*(w(1,1)+w(2,1));
wsp(3) = a(1)+a(2)+a(3);
fprintf("W(x) = %f x^2 + %f x + %f\n", wsp(3),wsp(2),wsp(1));
%Wykres na podstawie wzoru interpolacyjnego
x = [-5:1:5];
y = zeros(1,11);
for i=1:11
 fi(1) = (x(i)-w(2,1))*(x(i)-w(3,1));
 fi(2) = (x(i)-w(1,1))*(x(i)-w(3,1));
 fi(3) = (x(i)-w(2,1))*(x(i)-w(1,1));
 y(i) = a(1)*fi(1) + a(2)*fi(2) + a(3)*fi(3);
endfor
plot(x,y);
grid on;
hold on;
%Wykres punktow obliczonych ze wzoru ogolnego
vector_x=[w(1,1),w(2,1),w(3,1)];
vector_y=[0,0,0];
for i=1:3
 for j=1:3
 vector_y(1,j) = vector_y(1,j)+wsp(i)*w(j,1)^(i-1);
 endfor
endfor
plot(vector_x,vector_y,'rx'); %Czerwone krzyzyki
%Wykres wezlow otrzymany z podanych wspolrzednych punktow: w0, w1, w2
for i=1:3
 plot(w(i,1),w(i,2),'--gs');
endfor
title("Interpolacja Lagrange'a");
ylabel("Os y");
xlabel("Os x")
