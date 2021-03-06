% PlotAge.m
% Function to plot the age for any number of sources.

function PlotAge(t, age, lambda, source)
    if nargin == 3
        source = 0;
    end

    numSources = size(age,1);
    avgAge = sum(age, 2) / size(age, 2);

    % Calculate age for each source
    for i = 1:numSources
        if numSources ~= 1
            source = i;
        end    
        
        figure
        set(gcf, 'position', [369, 376, 935, 494]);
        
        plot(t, age(i, :));
        hold on
        plot(t, avgAge(i) .* ones(size(t)));
        xlabel('time (s)');
        ylabel('age (s)');
        title(['Source ', num2str(source), ', lambda = ', strtrim(rats(lambda(i)))]);
        legend('Location', 'northwest')
        legend('Age', ['Avg. Age = ', num2str(avgAge(i), 4)]);
    end
end
