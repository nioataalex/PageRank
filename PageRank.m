function [R1 R2] = PageRank(name, d, eps)
  % Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  %deschiderea si citirea din fisier
  in_file = fopen(name,"r");
  n = fscanf(in_file,"%f",1);

  for i = 1 : n + 1
    line = fgetl (in_file);
  endfor
  
  val1 = fscanf(in_file,"%f",1);
  val2 = fscanf(in_file,"%f",1);
  
  % denumirea fisierului de output
  out_name = strcat(name,".out");
  out_file = fopen(out_name, "w");
  
  % numarul de pagini analizate
  fprintf(out_file, "%i\n", n);
  fprintf(out_file, "\n");
  
  %apelarea functiilor celor 2 algoritmi
  R1 = Iterative(name, d, eps);
  R2 = Algebraic(name, d);
  
  fprintf(out_file, "%.6f\n", R1);
  fprintf(out_file, "\n");
  fprintf(out_file, "%.6f\n", R2);
  
  %sortare descrescatoare a vectorului de PageRank-uri
  M = sort(R2, 'descend'); 
  aux = dlmread(in_file, ' ', n + 1, 0);
  
  % afisare dupa cum zice in enunt
  for i = 1 : n
    page_number = find(M(i) == R2);
    grade =  Apartenenta(M(i), val1, val2);
    fprintf(out_file, "\n%d %d %f", i, page_number, grade);
  endfor
  
  fclose(out_file);
  fclose(in_file);
endfunction
