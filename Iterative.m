function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  file = fopen(nume, 'r');
  % citire din fisier si initializari
  n = fscanf(file, '%d', 1);
  A = zeros(n, n);
  K = zeros(n, n);
  x = ones(n,1);
  
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
  val1 = fscanf(file, '%f', 1);
  val2 = fscanf(file, '%f', 1);
  
 %crearea matricelor
  for i = 1 : n
    K(i, i) = 1 / sum(A(i, :));
  endfor
  M = (K * A)';
  
  %initializarea vectorului de page-rankuri
  R_last = zeros(n, 1);
  for i = 1 : n
    R_last(i) = 1 / n;
  endfor
  
  ok = 0; % presupunem ca nu s-a atins convergenta
  while ok == 0
    R = d * M * R_last + (1 - d) / n * x;
    if ((abs(R - R_last) < eps) == x)
      ok = 1; % atingerea convergentei
    else
      R_last = R; 
    endif
  endwhile
  %iteratie in plus dupa convergenta
  R = R_last;
  
  fclose(file);
 endfunction