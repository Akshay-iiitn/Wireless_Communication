% Set the coordinates of the blue point
bluePoint = [50, 50];

% Set the distance for points to be marked in various conditions
distanceRed = 10;
distanceYellow = 15;

% Create a figure for the scatter plot
figure;

% Mark the blue point as Blue
scatter(bluePoint(1), bluePoint(2), 100, 'b', 'filled');
hold on;

% Mark a red point at a distance of 10 units from the blue point
redPoint = bluePoint + [distanceRed, 0];
scatter(redPoint(1), redPoint(2), 100, 'r', 'filled');

% Mark two yellow points more than 10 units away from the blue point
yellowPoint1 = bluePoint + [distanceYellow, 0];
yellowPoint2 = bluePoint - [distanceYellow, 0];
scatter(yellowPoint1(1), yellowPoint1(2), 100, 'y', 'filled');
scatter(yellowPoint2(1), yellowPoint2(2), 100, 'y', 'filled');

% Generate 1000 random points in the circular radius range between 10 and 50 units
numRandomPoints = 10;
theta = 2 * pi * rand(1, numRandomPoints);
radius = 10 + (40 * rand(1, numRandomPoints)); % Random radius between 10 and 50
randomPointsX = bluePoint(1) + radius .* cos(theta);
randomPointsY = bluePoint(2) + radius .* sin(theta);

% Mark the random points as Green
scatter(randomPointsX, randomPointsY, 10, 'g', 'filled');

% Set axis labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Scatter Plot with Marked Points');

% Display the legend
legend({'Blue Point', 'Red Point', 'Yellow Points', 'Random Green Points'}, 'Location', 'Best');

% Set axis limits based on the circular range
axis equal;
xlim([bluePoint(1) - 60, bluePoint(1) + 60]);
ylim([bluePoint(2) - 60, bluePoint(2) + 60]);

% Display the grid
grid on;

hold off;
