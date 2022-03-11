function B = Gram_Schmidt(A)

	n = size(A); 

  Q = zeros(n);
  R = zeros(n);

  for k = 1 : n
    R(k, k) = norm(A(:, k));
    Q(:, k) = A(:, k) / R(k, k);
    R(k, k + 1 : n) = Q(:, k)' * A(:, k + 1 : n);
    A(:, k + 1 : n ) = A(:, k + 1 : n) - Q(:, k) * R(k, k+1 : n);
  endfor

  B = zeros(n);

  I = eye(n);

  for i = 1 : n
    x = SST(R, Q' * I(:, i));
    B(:, i) = x;
  endfor
endfunction