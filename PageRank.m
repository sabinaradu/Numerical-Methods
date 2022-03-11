function [R1 R2] = PageRank(nume, d, eps)

  fileID = fopen(nume,'r');
  N = fscanf(fileID, '%f',1);

  for i = 1 : N
    aux1 = fscanf(fileID, '%f', 1);
    aux2 = fscanf(fileID, '%f', 1);
    for j = 1 : aux2
      aux3 = fscanf(fileID, '%f', 1);
    endfor
  endfor

  val1 = fscanf(fileID, '%f', 1);
  val2 = fscanf(fileID, '%f', 1);

  fclose(fileID);

  outName = strcat(nume, '.out'); 

  outID = fopen(outName, 'w'); 

  fprintf(outID, '%i \n', N);

  R1 = Iterative(nume, d, eps);
  fprintf(outID, '%.6f \n', R1);
  fprintf(outID, '\n');

  R2 = Algebraic(nume, d);
  fprintf(outID, '%.6f \n', R2);
  fprintf(outID, '\n');

  [PR1, index] = sort(R2, 'descend');
  
  for i = 1 : N
    y = Apartenenta(PR1(i), val1, val2);
    fprintf(outID, '%i %i %.6f\n', i, index(i), y);
  endfor

  fclose(outID);
endfunction