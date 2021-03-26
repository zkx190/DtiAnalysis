function fdt_rotate_bevcs(bevcInput,bevcOutput,Ecclog)

% DTI image fdt_rotate_bevcs

if ~exist('bevcInput'),
    bevcInput = 'bvecs.bvec';
end

if ~exist('bevcOutput'),
    bevcOutput = 'rotate.bvec';
end

if ~exist('Ecclog'),
    Ecclog = 'DTI_eddy.ecclog';
end

command = ['fdt_rotate_bvecs ' bevcInput ' '  bevcOutput ' ' Ecclog ];
disp(command);
system(command);