function [area] = calculateArea(shapeX,shapeY,pointsX,pointsY,n,k)
%calculateArea calculates the area of a figure defined by points described
%by the coordinates shapeX and shapeY using the Monte Carlo method.
%The function uses points randomly generated within a square of side
%n. Their coordinates are described by the vectors pointsX and pointsY. The vector
%contains k points.
    pointsInside=0;
    numberOfPoints=size(pointsX);
    numberOfPoints=numberOfPoints(2);
    for i = 1:numberOfPoints
        C = [pointsX(i), pointsY(i)];
        inside = isInside(shapeX,shapeY,C,n);
        if(inside)
            pointsInside=pointsInside+1;
        end
    end
    area=pointsInside/k*power(n,2);
end

