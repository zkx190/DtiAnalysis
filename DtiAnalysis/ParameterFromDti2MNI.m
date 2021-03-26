function ParameterFromDti2MNI(InputName,outputName,T1name)
if ~exist('InputName'),
    InputName = 'dti';
end

if ~exist('outputName'),
    outputName = 'MNI';
end


if ~exist('T1name'),
    T1name = 'T1_brain';
end

command = ['flirt -in ' InputName '_FA -ref '  T1name ' -o warp_MNI2T1.mat -out T1_FA'];
disp(command);
system(command);

command = 'convert_xfm -omat warp_T12FA.mat -inverse warp_FA2T1.mat';
disp(command);
system(command);

command = ['applywarp -i ' InputName '_FA -o '  outputName '_FA -r $FSLDIR/data/standard/MNI152_T1_2mm_brain -w warp_T12MNI --premat=warp_FA2T1 --interp=nn'];
disp(command);
system(command);

command = ['applywarp -i ' InputName '_MD -o '  outputName '_MD -r $FSLDIR/data/standard/MNI152_T1_2mm_brain -w warp_T12MNI --premat=warp_FA2T1 --interp=nn'];
disp(command);
system(command);

command = ['applywarp -i ' InputName '_AD -o '  outputName '_AD -r $FSLDIR/data/standard/MNI152_T1_2mm_brain -w warp_T12MNI --premat=warp_FA2T1 --interp=nn'];
disp(command);
system(command);

command = ['applywarp -i ' InputName '_RD -o '  outputName '_RD -r $FSLDIR/data/standard/MNI152_T1_2mm_brain -w warp_T12MNI --premat=warp_FA2T1 --interp=nn'];
disp(command);
system(command);
