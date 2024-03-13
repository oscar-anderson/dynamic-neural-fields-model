%% Dynamic Neural Fields Simulation - Example Usage.

% Description:
    % This script utilises the computational model of dynamic neural
    % fields, implemented by the function dynamicNeuralFields.m, to
    % simulate different forms of activation in fields of neurons.

% Author: Oscar Anderson
% Date: 2023

% Growing activation simulation.
sigmaExcitation = 0.4;
strengthExcitation = 0.6;
strengthInhibition = 0.1;
outputField = dynamicNeuralFields(sigmaExcitation, strengthExcitation, strengthInhibition);
title('Growing Activation', 'fontsize', 13)

% Decaying Activation simulation.
sigmaExcitation = 0.7;
strengthExcitation = 1;
strengthInhibition = 1;
outputField = dynamicNeuralFields(sigmaExcitation, strengthExcitation, strengthInhibition);
title('Decaying Activation', 'fontsize', 13)

% Memory activation simulation.
sigmaExcitation = 0.3;
strengthExcitation = 0.5;
strengthInhibition = 0.2;
outputField = dynamicNeuralFields(sigmaExcitation, strengthExcitation, strengthInhibition);
title('Memory Activation', 'fontsize', 13)