function output = voters(database, varargin)
if mod((nargin-1), 2) == 1
    output = database;
    return
end

for ii = 1:2:(nargin-1)
    if (~ischar(varargin{ii}) && ~isstring(varargin{ii})) || ...
        ~all(isa(varargin{ii+1}, 'double')) || ...
        contains(mat2str(varargin{ii+1}), '.')
        output = database;
        return
    end

    if ischar(varargin{ii})
        varargin{ii} = convertCharsToStrings(varargin{ii});
    end
end
if class(database) == class([])
    output = struct('Name', {varargin{1:2:end}}, 'ID', ...
        {varargin{2:2:end}});
else
    output = [database, struct('Name', {varargin{1:2:end}}, 'ID', ...
        {varargin{2:2:end}})];
end