function [squareX, squareY] = defineSquare(n)
%defineSquare returns two vectors - the X and Y coordinates of a square with side n,
%which starts at the origin of the coordinate system. The coordinates include
%the starting point as the first and last element to form a closed figure.
    x0=0;
    y0=0;
    xn=n;
    yn=n;
    squareX=[x0, x0, xn, xn, x0];
    squareY=[y0, yn, yn, y0, y0];
end

