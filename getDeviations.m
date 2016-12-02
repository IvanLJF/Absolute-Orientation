function dev = getDeviations(A, L, dx)
  v = L - (A * dx);  % residual matrix v

  sigma = sqrt(v' * v );

  exx = sigma * inv(A' * A);

  variances = diag(exx);

  dev = sqrt(variances);
end