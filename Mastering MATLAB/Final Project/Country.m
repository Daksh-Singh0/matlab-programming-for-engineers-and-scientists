classdef Country
    properties
        Name    
        States
        StateNames
    end
    
    methods
        function obj = Country(country_name, states_data)
            obj.Name = country_name;

            obj.States = [];
            obj.StateNames = [];
            for ii = 1:size(states_data, 1)
                obj.States = [obj.States, State(states_data{ii, 1}, states_data(ii, 2:end))];
                obj.StateNames = [obj.StateNames, convertCharsToStrings(states_data{ii, 1})];
            end
        end
    end
end

