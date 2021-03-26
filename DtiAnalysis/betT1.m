function betT1(T1Input,T1outpt,betStrength)


if ~exist('T1Input'),
    T1Input = 'T1';
end

if ~exist('T1outpt'),
    T1outpt = 'T1_brain';
end

if ~exist('betStrength'),
    betStrength =0.2;
end


command = ['bet ' T1Input ' '  T1outpt ' -f ' num2str(betStrength) ' -R -m'];
disp(command);
system(command);