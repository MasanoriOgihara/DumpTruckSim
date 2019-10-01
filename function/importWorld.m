function world = importWorld(filename)
% In .world file, data line is like this: 
% name: value, value, value, value, ....., value

% open file
fid = fopen(filename); 
% create empty struct to return.
world = struct();

% read line
while ~feof(fid)
    tline = fgetl(fid);
    C1 = strsplit(tline,': '); % split name and data
    label = C1{1};
    data_str = C1{2};
    data_cell = strsplit(data_str,', '); % split data into each datum
    data_mat = str2double(data_cell');   % cell string to matrix
    world = setfield(world,label,data_mat);
end
% add index column
world.maxIndex = size(world.s_m, 1);
world.index = (1:world.maxIndex)';
% close file
fclose(fid);
end