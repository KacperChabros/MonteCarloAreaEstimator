function [vP] = vectorProduct(X, Y, Z)
%vectorProduct returns the cross product between the vectors:
%XY and XZ
%X, Y, Z are points -> two-element vector: [x, y]
    x1 = Y(1) - X(1);
    y1 = Y(2) - X(2);

    x2 = Z(1) - X(1);
    y2 = Z(2) - X(2);

    vP = x1*y2 - x2*y1;
end

