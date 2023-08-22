function output = grader(func1, func2, varargin)
for ii = 1:(nargin-2)
    if ~isequal(func1(varargin{ii}), func2(varargin{ii}))
        output = false;
        return
    end
end

output = true;
return