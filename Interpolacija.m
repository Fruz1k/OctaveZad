disp("Wspolrzedne wezlow");
w0=[-3,-4]
w1=[2,4]
w2=[4,1]
X=[w0(1,1)^0, w0(1,1)^1, w0(1,1)^2;
 w1(1,1)^0, w1(1,1)^1, w1(1,1)^2;
 w2(1,1)^0, w2(1,1)^1, w2(1,1)^2];

disp("Macierz X");
disp(X);
Y=[w0(1,2); w1(1,2); w2(1,2)];
disp("Macierz Y");
disp(Y);
A=inv(X)*Y;
disp("Macierz wspolczynnikow");
disp(A);
fprintf(' W(x)=%f*x^2 + %f*x + %f \n', A(3,1), A(2,1), A(1,1));
% czesc graficzna
x=[-5:1:5];
y=zeros(1,11);
for i=1:11
 y(i)=A(1,1)+A(2,1)*x(i)+A(3,1)*x(i)^2;
end
plot(x, y);
grid on;
hold on;
vector_x=[w0(1,1), w1(1,1), w2(1,1)];
vector_y=[0,0,0];
for i=1:3
 vector_y(1,1)=vector_y(1,1)+A(i,1)*w0(1,1)^(i-1);
 vector_y(1,2)=vector_y(1,2)+A(i,1)*w1(1,1)^(i-1);
 vector_y(1,3)=vector_y(1,3)+A(i,1)*w2(1,1)^(i-1);
end
plot(vector_x,vector_y,'rx');
plot(w0(1,1),w0(1,2),'--gs');
plot(w1(1,1),w1(1,2),'--gs');
plot(w2(1,1),w2(1,2),'--gs');
title('Interpolacja wielomianowa');
ylabel('Os y');
xlabel('Os x');


