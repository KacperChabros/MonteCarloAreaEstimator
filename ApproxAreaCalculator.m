n=10;
k=1000;
numberOfRepeats=100;
isAreaKnown=true;
[squareX, squareY] = defineSquare(n);
shapeX = [0.26*n, 0.26*n, 0.566*n, 0.566*n, 0.26*n];%rectangle
shapeY = [0.15*n, 0.79*n, 0.79*n, 0.15*n, 0.15*n];

calculatedAreas = zeros(1, numberOfRepeats);
meanAreas = zeros(1,numberOfRepeats);
for i = 1:numberOfRepeats
    [points_X, points_Y] = drawPoints(n,k);
    area = calculateArea(shapeX, shapeY, points_X, points_Y, n,k);
    calculatedAreas(i) = area;
    meanAreas(i) = sum(calculatedAreas) / i;
end

if(isAreaKnown)
% the line below should be replaced with the known area value/code calculating it
    actualArea = (max(shapeX) - min(shapeX)) * (max(shapeY) - min(shapeY));
    meanArea = mean(calculatedAreas);
    error = ( actualArea - meanArea ) / actualArea * 100;
    set(gcf, 'Units', 'pixels', 'Position', [100, 100, 1000, 500]);

    difference = max(abs(max(calculatedAreas) - actualArea), abs(actualArea - min(calculatedAreas)));
    subplot(1,2,1)
    hold on
    plot([1, numberOfRepeats], [actualArea, actualArea], 'b-', 'LineWidth', 3);
    plot(1:numberOfRepeats, calculatedAreas, "ro")
    xlim([1,100])
    ylim([actualArea-difference, actualArea+difference])
    hold off
    xlabel("Draw number")
    ylabel("Area")
    plotTitle = sprintf("Results of calculated area for %d draws.\n" + ...
        "Mean area: %g\n" + ...
        "Real area: %g\nRelative error: %g%%", numberOfRepeats, meanArea, actualArea, error);
    title(plotTitle)
    legend("Real area", "Area for a particular draw")
    
    subplot(1,2,2)
    difference = max(abs(max(meanAreas) - actualArea), abs(actualArea - min(meanAreas)));
    hold on
    plot([1, numberOfRepeats], [actualArea, actualArea], 'b-', 'LineWidth', 3);
    plot(1:numberOfRepeats, meanAreas, "ro")
    hold off
    xlim([1,100])
    ylim([actualArea-difference, actualArea+difference])
    xlabel("Number of draws")
    ylabel("Area")
    legend("Real area", "Mean area for n draws")
    plotTitle = sprintf("Mean area vs number of draws");
    title(plotTitle)
    plotName = sprintf("Side of the square n=%g, Number of points: k=%d", n, k);
    set(gcf,"Name", plotName)
    
else
    fprintf("Mean area: %g\n", mean(calculatedAreas))
end