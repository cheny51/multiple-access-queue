% RunTDMA.m
% Simulate the TDMA queue multiple times to collect data

% clc 
close all

% Set simulation parameters
% Define step size and simulation duration (seconds)
dt = 0.1;
tFinal = 1800;

% Define number of sources
numSources = 2;

% Set transmission rates for each source (packet/second)
lambda = zeros(numSources, 1);
lambda(1) = 1/60;
lambda(2) = 1/45;

% Set average service rate (packet/seconds)
mu = 1/30;

% Set slot width
% Probability of packet arriving is P = 1 - e^(-lambda*t)
probability = 0.3; % Desired probability that a packet is sent during a slot
slotDuration = -log(1 - probability) ./ lambda; % Calculate time from
% Take the larger of the calculated durations
slotDuration = max(slotDuration);
slotDuration = round(slotDuration / dt) * dt; % round to same order as time step

priority = [0, 0]; % Both sources have same priority

queueSize = 3;

numSimulations = 100;
avgAge = zeros(numSources, numSimulations);
avgWait = zeros(numSources, numSimulations);

tic
for i = 1:numSimulations
    [avgAge(:,i), avgWait(:,i)] = TDMA(tFinal, dt, numSources, slotDuration, lambda, mu, priority, queueSize);
end
toc

totalAvgAge = sum(avgAge, 2)./numSimulations;
stdDevAge = std(avgAge, 0, 2);

totalAvgWait = sum(avgWait, 2)/numSimulations;
stdDevWait = std(avgWait, 0, 2);

fprintf('\nRan %d simulations for TDMA with %d sources.\n', numSimulations, numSources);
fprintf('Time slot P = %.1f (%.1f s)\n', probability, slotDuration);
fprintf('Maximum Queue Size: %d', queueSize);
fprintf('lambda:\n');
for i = 1:numSources
    fprintf('\tSource %d: %s\n', i, strtrim(rats(lambda(i))));
end
fprintf('mu: %s\n', strtrim(rats(mu)));
fprintf('\nDATA\n');
fprintf('Average Age:\n');
for i = 1:numSources
    fprintf('\t Source %d: %.2f, std dev = %.2f\n', i, totalAvgAge(i), stdDevAge(i));
end
fprintf('Average Delay:\n');
for i = 1:numSources
    fprintf('\t Source %d: %.2f, std dev = %.2f\n', i, totalAvgWait(i), stdDevWait(i));
end
