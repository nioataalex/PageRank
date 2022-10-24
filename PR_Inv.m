function B = PR_Inv(A)
  % Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  [n n] = size(A);
  B = zeros(n);
  [Q R] = Gram_Schmidt(A);
  v = ones(1, n);
  I = diag(v);
  X = Q' * I;
  
  % m-am folosit de sistemul superior triunghiular
  for k = 1 : n
    for i = n : -1 : 1
      y = 0;
      for j = i + 1 : n
        y = y + R(i, j) * B(j, k);
      endfor
      B(i, k) = (X(i, k) - y) / R(i, i);
    endfor
  endfor
endfunction
