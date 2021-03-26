function ExtractB0(inputDti,outputB0,tmin,tsize,betStrength)

% extract b0 image from Dti image after eddy_correct,tmin is the initial image
% number you select amd t size is the number of image you need.

if ~exist('inputDti'),
    inputDti ='DTI_eddy';
end

if ~exist('outputB0'),
    outputB0 = 'b0_brain';
end

if ~exist('tmin'),
    tmin =0;
end

if ~exist('tsize'),
    tsize = 1;
end

if ~exist('betStrength'),
    betStrength = 0.2;
end
command = ['fslroi ' inputDti ' '  'b0' ' ' num2str(tmin) ' ' num2str(tsize) ];
disp(command);
system(command);

command = ['bet2 ' 'b0' ' '  outputB0 ' -f ' num2str(betStrength) ' -m'];
disp(command);
system(command);