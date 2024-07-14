function [points_X, points_Y] = drawPoints(n, k)
%drawPoints returns two vectors - the X and Y coordinates of randomly generated points
%within a square of size nxn starting at the origin of the coordinate system
%k defines the number of points
points_X=rand(1,k);
points_X=points_X*n;

points_Y=rand(1,k);
points_Y=points_Y*n;
end

