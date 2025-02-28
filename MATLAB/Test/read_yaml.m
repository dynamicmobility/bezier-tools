function [yaml_node] = read_yaml(fileName)
%READ_YAML Summary of this function goes here
    % load yaml
    toMatrix = true;
    useStructArrays = false;
    raw = fileread(fileName);
    [dirPath, ~, ~] = fileparts(fileName);
    yaml_node = yaml_load(raw, toMatrix, dirPath, useStructArrays);

end


