% Parameters
mu = 0; % mean
sigmas = [0.5, 1, 1.5]; % standard deviations

% Data range
x = linspace(-5, 5, 1000);

% Plot PDFs
figure;
hold on;
for sigma = sigmas
    pdf = exp(-0.5 * ((x - mu) / sigma).^2) / (sigma * sqrt(2 * pi));
    plot(x, pdf, 'LineWidth', 2, 'DisplayName', ['\sigma = ' num2str(sigma)]);
end
title('Probability Density Function (PDF) of Gaussian Distribution');
xlabel('x');
ylabel('PDF');
legend;
hold off;

% Plot CDFs
figure;
hold on;
for sigma = sigmas
    cdf = 0.5 * (1 + erf((x - mu) / (sigma * sqrt(2))));
    plot(x, cdf, 'LineWidth', 2, 'DisplayName', ['\sigma = ' num2str(sigma)]);
end
title('Cumulative Distribution Function (CDF) of Gaussian Distribution');
xlabel('x');
ylabel('CDF');
legend;
hold off;
