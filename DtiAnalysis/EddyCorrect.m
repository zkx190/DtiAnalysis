function EddyCorrect(inputName,outputName,ref)

% DTI image eddy correct
if ~exist('inputName'),
    inputName = 'rawdata';
end

if ~exist('outputName'),
    outputName = 'DTI_eddy';
end

if ~exist('ref'),
    ref = 0;
end

command = ['eddy_correct ' inputName ' '  outputName ' ' num2str(ref) ];
disp(command);
system(command);