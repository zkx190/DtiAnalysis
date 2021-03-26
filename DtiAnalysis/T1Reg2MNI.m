function T1Reg2MNI(T1Input,T1Output,RefDir)


if ~exist('T1Input'),
    T1Input = 'T1_brain';
end

if ~exist('RefDir'),
    RefDir = '$FSLDIR/data/standard/MNO152_T1_2mm_brain';
end

if ~exist('T1Output'),
    T1Output ='MNI_T1';
end


command = ['flirt -in ' T1Input ' -ref '  RefDir ' -out MNI_T1_affineonly -omat T12MNIaff.mat'];
disp(command);
system(command);

command = ['fnirt --in=' T1Input ' --aff=T12MNIaff.mat --cout=warp_T12MNI --ref='  RefDir];
disp(command);
system(command);

command = ['applywarp -i ' T1Input ' -o ' T1Output ' -r '  RefDir ' -w warp_T12MNI'];
disp(command);
system(command);