# Face recognition using eigenfaces

eigenface_core.m sets up the eigenfaces using the training data.

face_recognition.m projects a test image onto the eigenface space and calculates the distance to the nearest face.

test.m runs face recognition for all test images found in ./in/ and prints out the distance to the closest face and the face's corresponding image name to ./out/results.txt

Requires: image package for Octave
