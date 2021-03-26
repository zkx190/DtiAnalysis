function DtiParameterCalculate(inputName,outputName,b0Mask,bvec,bval)

if ~exist('inputName'),
    inputName = 'DTI_eddy.nii.gz';
end

if ~exist('outputName'),
    outputName = 'dti';
end

if ~exist('b0Mask'),
    b0Mask = 'b0_brain_mask';
end


if ~exist('bvec'),
    bvec = 'rotate.bvec';
end

if ~exist('bval'),
    bval = 'bvals.bval';
end

command = ['dtifit --data=' inputName ' --out=' outputName ' --mask=' b0Mask,' --bvecs=' bvec ' --bvals=' bval ];
disp(command);
system(command);

command = ['mv ' outputName '_L1.nii.gz ' outputName '_AD.nii.gz' ];
disp(command);
system(command);

command = ['fslmaths ' outputName '_L2 -add ' outputName '_L3 -div 2 ' outputName '_RD' ];
disp(command);
system(command);

