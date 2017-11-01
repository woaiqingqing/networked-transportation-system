function [decision, frame_next] = MWLAHOQ_Adhoc(nPhase, feasible_phase, current_location, current_HoL, memory_HoL, frame_remained, average_rate, beta, IDLE_ON, IDLE_MAX, power)
%% Implement Variable Frame-Based Max-Weight Scheduling Policy
% pressure: pressure matrix of dimension nLink-by-1
    %power = 0.6;
    leading_factor = 1;
    frame_next = 0;
    weight = zeros(nPhase, 1);
    frameSize = zeros(nPhase, 1);
    
    for i=1:nPhase
        %weight(i) = sum((current_jobs(feasible_phase{i}).*average_rate(feasible_phase{i})).*beta(feasible_phase{i}));
        %frameSize(i) = (leading_factor*((sum(current_jobs))^power));
        frameSize(i) = (leading_factor*((sum(memory_HoL))^power));
        if i == current_location 
            %weight(i) = (frameSize(i) + IDLE_MAX)*(sum(current_jobs(feasible_phase{i}).*beta(feasible_phase{i})));
            weight(i) = (frameSize(i) + IDLE_MAX)*(sum(current_HoL(feasible_phase{i}).*beta(feasible_phase{i})./average_rate(feasible_phase{i})));
            %weight(i) = (frameSize(i) + 1)*(sum(current_HoL(feasible_phase{i}).*beta(feasible_phase{i})./average_rate(feasible_phase{i})));
        else
            %weight(i) = (frameSize(i))*(sum(current_jobs(feasible_phase{i}).*beta(feasible_phase{i})));
            weight(i) = (frameSize(i))*(sum(current_HoL(feasible_phase{i}).*beta(feasible_phase{i})./average_rate(feasible_phase{i})));
        end
    end
    if current_location > 0
        %if frame_remained > 0
        %if frame_remained > 0 && prod(current_jobs(feasible_phase{current_location})) > 0
        if frame_remained > 0 && sum(current_HoL(feasible_phase{current_location})) > 0
            decision = current_location;
            frame_next = frame_remained;
        else
            [val, decision] = max(weight);
            if sum(current_HoL(feasible_phase{decision})) == 0
                decision = -1;
            else
                if (IDLE_ON == 1)
                    frame_next = 1;
                    %frame_next = floor(frameSize(decision));
                    %frame_next = floor(leading_factor*((sum(current_jobs))^power)); % Determine frame size
                    %frame_next = floor(leading_factor*((sum(current_jobs((feasible_phase{decision})))^power)));% Determine frame size
                else
                    frame_next = 0;    
                end
            end
        end
    else
        [val, decision] = max(weight);
        if sum(current_HoL(feasible_phase{decision})) == 0
            decision = -1;
        else
            if (IDLE_ON == 1)
                frame_next = 1;
                %frame_next = floor(frameSize(decision));
                %frame_next = floor(leading_factor*((sum(current_jobs))^power)); % Determine frame size 
                %frame_next = floor(leading_factor*((sum(current_jobs((feasible_phase{decision})))^power))); 
            else
                frame_next = 0;
            end
        end 
end
