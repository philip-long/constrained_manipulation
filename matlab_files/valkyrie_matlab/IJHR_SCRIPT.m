clear all,clc,close all
%
% Initial with several different conditions. Check convergence wp versus
% wpstar. For converged solution check ability to find solution in locality

addpath(genpath('/media/philip/39C2CB4B4DF25122/MatlabFunctions/MATLAB/robot-functions'))

%addpath(genpath('/../../GeometricFunctions'))
addpath(genpath('/media/philip/39C2CB4B4DF25122/MatlabFunctions/MATLAB/utility-functions'))
addpath(genpath('/home/philip/tbxmanager'))

%%
solver_name='interior-point';
solver_name='sqp';
for test_no=31:70

    object_case=randi(2);
    constrained_manipulability=false;
    initial_condition=[randRange(0.5,0.7,1),randRange(-0.1,0.2,1),randRange(-pi/8,pi/4,1)];

    initial_check=postureOptimization(constrained_manipulability,object_case,initial_condition,test_no,solver_name,true);

    if(initial_check==true)
        constrained_manipulability=true;
        postureOptimization(constrained_manipulability,object_case,initial_condition,test_no,solver_name,true);
    end

end
%end


%%

try
system('sudo shutdown +5');
catch
system('systemctl poweroff');
end

