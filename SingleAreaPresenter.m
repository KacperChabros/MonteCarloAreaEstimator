n=5;
k=1000;
[squareX, squareY] = defineSquare(n);
% shapeX=[2, 3, 4,2];%triangle
% shapeY=[2,4,2,2];
shapeX = [1.0,1.2,1.4,1.6,2.0,2.2,2.6,2.8,3.0,3.0,2.8,2.6,2.6,2.8,3.2,3.6,3.8,4.2,4.4,4.6,4.6,4.6,4.4,4.2,4.6,4.4,4.2,3.6,3.2,2.8,2.2,1.8,1.4,1.0];
shapeY = [1.2,1.6,1.8,1.6,1.4,1.2,1.4,1.6,2.0,2.4,2.6,2.8,3.2,3.4,3.6,3.6,3.4,3.2,2.8,2.4,2.0,1.8,1.4,1.2,1.0,0.8,0.6,0.4,0.4,0.6,0.6,0.8,1.0,1.2];
% shapeX = [0.26*n, 0.26*n, 0.566*n, 0.566*n, 0.26*n];%rectangle
% shapeY = [0.15*n, 0.79*n, 0.79*n, 0.15*n, 0.15*n];
[points_X, points_Y] = drawPoints(n,k);
hold on
plot(squareX, squareY, 'b-', 'LineWidth', 3);
plot(shapeX, shapeY, 'r-');
plot(points_X, points_Y, "o")
grid on
hold off
area = calculateArea(shapeX, shapeY, points_X, points_Y, n,k);
plotTitle = sprintf("Area of the given shape is %f", area);
title(plotTitle);
xlabel("x")
ylabel("y")