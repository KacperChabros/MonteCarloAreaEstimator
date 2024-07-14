function [doesLie] = liesOnSegment(X,Y,Z)
%liesOnSegment - the function checks if point Z lies on the segment XY.
%returns true if it lies on the segment. Necessary for checking the boundary condition.
%X, Y, Z are points -> two-element vector: [x, y]
    doesLie=false;
    minX = min(X(1), Y(1));
    maxX = max(X(1), Y(1));
    
    minY = min(X(2), Y(2));
    maxY = max(X(2), Y(2));

    if(minX <= Z(1) && maxX >= Z(1) && minY <= Z(2) && maxY >= Z(2))
        doesLie=true;
    end
end

