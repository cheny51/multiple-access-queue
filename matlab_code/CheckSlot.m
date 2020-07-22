% Function that checks if the server will serve a given packet at the time
% is was sent based on the slot duration. The function will return true if
% the packet's source is recieved during a slot that matches the source.

function [serveSource, slotNumber] = CheckSlot(time, numSources, slotDuration)

    slotNumber = fix(time/slotDuration);

    % Added to remove floating point error bug where fix would return an
    % incorrect value
    difference = (time/slotDuration) - slotNumber;
    if abs(difference - 1) < 1e-9
        slotNumber = slotNumber + 1;
    end
    
    serveSource = mod(slotNumber, numSources) + 1;
end

% this_packet_source = packet(1);
% this_packet_timestamp = packet(2);
% this_packet_priority = 1
% 
% priority_array = zeros(numSources,1);
% priority_array(1) = 1;
% priority_array(2) = 0;
% 
% slotNumber = fix(timestamp/slotDuration);
% serverSource = mod(slotNumber, numSources)+1;
% 
% % if everything match
% serve = (this_packet_source == serverSource);
% % now take care the case of priority
% if ~serve:
%     % if the higher priority packet land in slot belong to 
%     % low priority packet
%     if priority_array(this_packet_priority) > priority_array(serverSource):
%         serve = True;
%     end
% end