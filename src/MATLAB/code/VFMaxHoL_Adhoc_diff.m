function [decision, frame_next] = VFMaxHoL_Adhoc_diff(nPhase, feasible_phase, current_location, current_jobs, frame_remained, age, lambda, IDLE_ON, IDLE_MAX)
%% Implement Variable Frame-Based Max-Weight Scheduling Policy
% pressure: pressure matrix of dimension nLink-by-1
% Frame size: Either queue-length-based or HoL-age-based
    power = 0.35;
    leading_factor = 1;
    frame_next = 0;
    %relax = 0.8;
    weight = zeros(nPhase, 1);
    frameSize = zeros(nPhase, 1);
    %mean_weight = zeros(nPhase, 1);
    
    for i=1:nPhase
        %frameSize(i) = floor(leading_factor*((sum(current_jobs))^power));
        %frameSize(i) = floor(leading_factor*((sum(current_jobs((feasible_phase{i})))^power)));
        %frameSize(i) = floor(leading_factor*((sum(age((feasible_phase{i}))))^power));
        %frameSize(i) = floor(leading_factor*((sum(age))^power));
        %frameSize(i) = (leading_factor*((sum(age((feasible_phase{i}))))^power));
        %frameSize(i) = (leading_factor*((sum(age))^power));
        frameSize(i) = (leading_factor*((sum(age))^power));
        if i == current_location 
            weight(i) = (frameSize(i) + IDLE_MAX)*(sum(age(feasible_phase{i}).*lambda(feasible_phase{i})));
        else
            weight(i) = (frameSize(i))*(sum(age(feasible_phase{i}).*lambda(feasible_phase{i})));
        end
        %weight(i) = sum(age(feasible_phase{i}).*lambda(feasible_phase{i}));
        %weight(i) = max(age(feasible_phase{i}).*lambda(feasible_phase{i}));
        %weight(i) = min(age(feasible_phase{i}).*lambda(feasible_phase{i}));
        %weight(i) = prod(age(feasible_phase{i}).*lambda(feasible_phase{i}) + 1);
        %weight(i) = sum(sqrt(age(feasible_phase{i}).*lambda(feasible_phase{i})));
        %{
        age_lambda = age(feasible_phase{i}).*lambda(feasible_phase{i});
        mean_weight(i) = mean(age_lambda);
        age_lambda_ofs = age_lambda - mean_weight(i);
        weight(i) = sum(age_lambda) - sum(abs(age_lambda_ofs));
        %}
    end
    if current_location > 0
        %if frame_remained > 0
        %if frame_remained > 0 && prod(current_jobs(feasible_phase{current_location})) > 0
        if frame_remained > 0 && sum(current_jobs(feasible_phase{current_location})) > 0
            decision = current_location;
            frame_next = frame_remained;
        else
            [val, decision] = max(weight);
            if sum(current_jobs(feasible_phase{decision})) == 0
                decision = -1;
            else
                if (IDLE_ON == 1)
                    frame_next = floor(frameSize(decision));
                    %frame_next = ceil(frameSize(decision));
                    %frame_next = floor(leading_factor*((sum(current_jobs))^power)); % Determine frame size
                    %frame_next = floor(leading_factor*((sum(age((feasible_phase{decision}))))^power)); % Determine frame size
                    %frame_next = floor(leading_factor*((sum(current_jobs((feasible_phase{decision})))^power)));% Determine frame size
                else
                    frame_next = 0;
                end
            end
        end
    else
        [val, decision] = max(weight);
        if sum(current_jobs(feasible_phase{decision})) == 0
            decision = -1;
        else
            if (IDLE_ON == 1)
                frame_next = floor(frameSize(decision)) + IDLE_MAX*(decision == current_location);
                %frame_next = ceil(frameSize(decision));
                %frame_next = floor(leading_factor*((sum(current_jobs))^power)); % Determine frame size 
                %frame_next = floor(leading_factor*((sum(age((feasible_phase{decision}))))^power)); % Determine frame size
                %frame_next = floor(leading_factor*((sum(current_jobs((feasible_phase{decision})))^power))); 
            else
                frame_next = 0;
            end
        end 
    end
