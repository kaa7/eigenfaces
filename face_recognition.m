function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  image = double(rgb2gray(imread(image_path)));
  T = zeros(200 * 200, 1);
  T = reshape(image', [200*200, 1]);
  % calc proiectia pentru imaginea data
  A = T - m;
  pr_test_img = eigenfaces' * A;
  % init minim
  min_dist = inf;
  output_img_index = 1;
  % gasesc cea mai apropiata fata
  for i = 1 : size(pr_img)(2)
    cur_dist = norm(pr_test_img - pr_img(:,i));
    if cur_dist < min_dist
      min_dist = cur_dist;
      output_img_index = i;
    endif
  endfor

end