function [inside] = isInside(shapeX, shapeY, C, n)
%isInside - checks if point C lies inside a closed figure
%defined by points. The x coordinates of the figure are in
%the vector shapeX, and the Y coordinates are in the vector shapeY. (the last element
%of the vectors is a repetition of the first to form a closed figure).
%C - point -> two-element vector [x, y]
%n - side length of the square
    inside=false;
    numberOfPoints = size(shapeX);
    numberOfPoints = numberOfPoints(2);
    D = [C(1), n];
    intersectionCounter = 0;
    for i = 1:numberOfPoints-1
        A = [shapeX(i), shapeY(i)];
        B = [shapeX(i+1), shapeY(i+1)];
        intersect = doesIntersect(A,B,C,D);
        if(intersect)
            intersectionCounter=intersectionCounter+1;
        end
    end
    
    if(mod(intersectionCounter, 2) ~= 0)
        inside = true;
    end
end

