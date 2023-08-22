function output = name_value_pairs(varargin)
if mod(nargin, 2) == 1
    output = {};
    return
end

output = {};

for ii = 1:2:nargin
    if ~ischar(varargin{ii})
        output = {};
        return
    end
    output(ceil(ii/2), 1:2) = {varargin{ii} varargin{ii+1}};
end