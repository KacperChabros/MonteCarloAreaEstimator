constantN = 5;
constantK = 1000;
numberOfRepeats=100;
numberOfTests=10;
listOfK = [10,50,100,1000,10000,100000];
listOfN = [4,7,15,50,100];

shapeX = [1.3, 1.3, 2.83, 2.83, 1.3];%rectangle
shapeY = [0.75, 3.95, 3.95, 0.75, 0.75];
actualArea = (max(shapeX) - min(shapeX)) * (max(shapeY) - min(shapeY));

errosN = zeros(1,length(listOfN));
for i = 1:length(listOfN)
    currN = listOfN(i);
    iterErrors = zeros(1,numberOfTests);
    for j = 1:numberOfTests
        calculatedAreas = zeros(1, numberOfRepeats);
        for m = 1:numberOfRepeats
            [points_X, points_Y] = drawPoints(currN,constantK);
            area = calculateArea(shapeX, shapeY, points_X, points_Y, currN,constantK);
            calculatedAreas(m) = area;
        end
        meanArea = mean(calculatedAreas);
        iterErrors(j)=abs(( actualArea - meanArea ) / actualArea * 100);
        fprintf("iteration: %d\n",j)
    end
    errosN(i) = mean(iterErrors);
    fprintf("\n\end n=%d\n\n",currN)
end

subplot(1,2,1)
semilogx(listOfN, errosN, 'bo-', 'LineWidth', 2);
title(sprintf("Relative error vs length of the side of the square n"))
xlabel("n")
ylabel("Relative error")


errosK = zeros(1,length(listOfK));
for i = 1:length(listOfK)
    currK = listOfK(i);
    iterErrors = zeros(1,numberOfTests);
    for j = 1:numberOfTests
        calculatedAreas = zeros(1, numberOfRepeats);
        for m = 1:numberOfRepeats
            [points_X, points_Y] = drawPoints(constantN,currK);
            area = calculateArea(shapeX, shapeY, points_X, points_Y, constantN,currK);
            calculatedAreas(m) = area;
        end
        meanArea = mean(calculatedAreas);
        iterErrors(j)=abs(( actualArea - meanArea ) / actualArea * 100);
        fprintf("iteration: %d\n",j)
    end
    errosK(i) = mean(iterErrors);
    fprintf("\n\end k=%d\n\n",currK)
end

subplot(1,2,2)
semilogx(listOfK, errosK, 'bo-', 'LineWidth', 2);
title(sprintf("Relative error vs number of points drawn k"))
xlabel("k")
ylabel("Relative error")
