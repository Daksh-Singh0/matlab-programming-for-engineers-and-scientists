classdef State   
    properties
        Name
        CumulativeCases
        CumulativeDeaths
        DailyCases
        DailyDeaths
    end
    
    methods
        function obj = State(state_name, data)
            obj.Name = state_name;

            obj.CumulativeCases = zeros(1, length(data));
            obj.CumulativeDeaths = zeros(1, length(data));
            obj.DailyCases = zeros(1, length(data));
            obj.DailyDeaths = zeros(1, length(data));
            
            prevCases = 0;
            prevDeaths = 0;
            for ii=1:length(data)
                obj.CumulativeCases(ii) = data{1, ii}(1);
                obj.CumulativeDeaths(ii) = data{1, ii}(2);
                obj.DailyCases(ii) = obj.CumulativeCases(ii) - prevCases;
                if obj.DailyCases(ii) < 0
                    obj.DailyCases(ii) = 0;
                end

                obj.DailyDeaths(ii) = obj.CumulativeDeaths(ii) - prevDeaths;
                if obj.DailyDeaths(ii) < 0
                    obj.DailyDeaths(ii) = 0;
                end

                prevCases = obj.CumulativeCases(ii);
                prevDeaths = obj.CumulativeDeaths(ii);
            end
        end
    end

end

