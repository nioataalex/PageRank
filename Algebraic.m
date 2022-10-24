function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	file = fopen(nume, 'r');
  % citire din fisier si initializari
  n = fscanf(file, '%d', 1);
  A = zeros(n,n);
  K = zeros(n,n);
  I = eye(n);
  v = ones(n, 1);
  
  for i = 1 : n
    node = fscanf(file, '%d', 1);
    neighbours = fscanf(file, '%d', 1);
    for j = 1 : neighbours
      neighbour = fscanf(file, '%d', 1);
      if neighbour == node % nu bagam in seama paginile cu link-urile catre ele insele
        A(node, neighbour) = 0;
        else
          A(node, neighbour) = 1;
      endif
    endfor
  endfor
  
  % crearea matrice de adiacenta
  i = 1;
  while i <= n
    suma = 0;
    for j = 1:1:n
      suma += A(i,j);
    endfor
    K(i,i) = 1/suma;
    i++;
  endwhile
  
  % formula pentru R
  M = (K * A)';
  dM = I - d * M;
  dM_inv = PR_Inv(dM);
  R = dM_inv * (1 - d) / n * v;
  
  fclose(file);

endfunction