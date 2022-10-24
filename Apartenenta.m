function y = Apartenenta(x, val1, val2)
  % Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

  if x <= val1 && x >= 0
    y = 0;
    return;
  elseif x > val2 && x <= 1
    y = 1;
    return
  elseif x >= val1 && x <=val2
  % coeficientii a si b pentu functie
  dif = val2 - val1; 
  a = 1 / dif;
  b = val1 / (-dif);
  % valoarea functiei in punctul x
  y = a * x + b;
  endif
endfunction
