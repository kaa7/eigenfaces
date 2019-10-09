function [m A eigenfaces pr_img] = eigenface_core(database_path)
  n_db = 10;
  % Fiecare imagine este 200 x 200
  T  = zeros(200 * 200, n_db - 2);
  m = zeros(200 * 200, 1);
  for i = 1 : n_db
    image_path = strcat(database_path, "/", mat2str(i), ".jpg");
    image = double(rgb2gray(imread(image_path)));
    T(:, i) = reshape(image', [200 * 200 * 1], [])';
    m = m + T(:,i);
  endfor
  
  m = m / n_db;
  m = mean(T, 2);
  A = T - m;
  L = A' * A;
  [V, lambda] = eig(L);
  % Sortez valorile proprii
  [lambda, perm] = sort(diag(lambda), "descend");
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
end