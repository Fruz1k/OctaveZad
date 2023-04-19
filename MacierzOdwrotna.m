A = [1,2,6;2,5,6;3,-6,9];
[wierszy,kolumn] = size(A);
disp("Moj wyznacznik");
detA= A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)+A(1,3)*A(2,1)*A(3,2)-A(1,3)*A(2,2)*A(3,1)-A(1,2)*A(2,1)*A(3,3)-A(1,1)*A(2,3)*A(3,2);
disp(detA);
disp("Wyznacznik poprawny:");
disp(det(A));
if detA!=0
  MA=zeros(wierszy-1, kolumn-1);
for i=1:wierszy
  for j =1:kolumn
    w=1;
      for p=1:wierszy
        if p!=i
          k=1;
            for t=1:kolumn
              if t!=j
                MA(w,k)=A(p,t);
                k=k+1;
              end
            end
          w=w+1;
         end
      end
    D(i,j)=MA(1,1)*MA(2,2) -(MA(1,2)*MA(2,1));
    D(i,j)=D(i,j)*(-1)^(i+j);
  endfor
endfor
disp(D)
[l_wierszy, l_kolumn] = size(D);
DT=zeros(l_kolumn,l_wierszy);
for i=1:l_wierszy
 for j=1:l_kolumn
  DT(j,i)=D(i,j);
 end
end
disp("Transponowanie macierzy D");
disp(DT);
D_odw=(1/detA)*DT;
disp("Moja maczier odwrotna A")
disp(D_odw)
disp ("Maczierz odwrotna poprawna ")
inv(A)
else
 disp("Wyznacznik równy 0 -> brak macierzy odwrotnej");
end
