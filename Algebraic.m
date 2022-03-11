function R = Algebraic(nume, d)

  fileID = fopen(nume,'r');

  N = fscanf(fileID, '%f', 1);

  A = zeros(N);

  c1 = ones(N,1);

  for i = 1 : N
    l = fscanf(fileID, '%f', 1);
    count = fscanf(fileID, '%f', 1);
    for j= 1 : count
      c = fscanf(fileID, '%f', 1);
      A(l, c) = 1;
    endfor
  endfor

  fclose(fileID);
  
  for i = 1 : N
    A(i, i) = 0;
  endfor

  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      L(i) = L(i) + A(i, j);
    endfor
  endfor
  
  K = zeros(N);
  for i = 1 : N
    invK(i, i) = 1 / L(i);
  endfor

  M = (invK * A)';

  I = eye(N);

  invers = Gram_Schmidt(I - d * M);

  R = invers * (1 - d ) / N * c1; 
endfunction