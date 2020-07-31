classdef source
    %   This is an object created to define a source/user
    %   It stores information about the user.
    %
    %   source_title[str]:          name of the source
    %   lambda_rate[double]:        arrival rate
    %   arrival_timestamp[list]:
    %   sum_of_arrival[double]:     sum of the arrival timestamp
    %   priority[double]:           priority rank of this user
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    properties
        source_title
        lambda_rate
        arrival_timestamp
        arrival_timestamp_plot
        sum_of_arrival
        priority
    end
    
    methods
        function obj = untitled2(inputArg1,inputArg2)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function plot_arrival = plot_arrival_time(obj)
            %	plot_arrival_time
            %   
            %   This method generate a stem plot showing when in time
            %   that this user will transmit a packet to get it serve
            %   
            %   When the value is 1 -> packet is arrived and need to be
            %   served. 
            %   
            %   Otherwise, value is 0
            %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            stem(obj.arrival_timestamp);
            title({obj.source_title, '1 -> Received, 0 -> Not Received'});
            xlabel('time(s)') 
            ylabel('Received or Not Received') 
        end
    end
end

