%% Computational Model of Dynamic Neural Fields.
function [outputField] = dynamicNeuralFields(sigmaExcitation, strengthExcitation, strengthInhibition)

% Description:
    % This function implements a computational model simulating the
    % activation behaviour of dynamic neural fields with excitatory and
    % inhibitory connections.

% Input:
    % sigmaExcitation: Standard deviation of the Gaussian kernel for
                       % excitatory connections (default = 0.7).
    % strengthExcitation: Strength of excitatory connections (default = 1).
    % strengthInhibition: Strength of inhibitory connections (default = 1).

% Output:
    % outputField: Matrix representing the activation of the dynamic neural
                   % field over time and across neurons.

% Author: Dr Dietmar Heinke, University of Birmingham
% Date: 2013

% Revised by: Professor Howard Bowman, University of Birmingham
% Date: 2015

% Revised by: Oscar Anderson (MSc student), University of Birmingham
% Date: 2023
    
    % Initialise necessary constants.
    thresholdOffset = 0.6;
    sigmoidSlope = 3;
    timeStepSize = 0.1 / 5;
    numNeurons = 101;
    numTimeSteps = 400;
    switchOffTime = round(numTimeSteps / 2);
    
    % Initialise default values, if none provided.
    if nargin < 1
        sigmaExcitation = 0.7;
        strengthExcitation = 1;
        strengthInhibition = 1;
    elseif nargin > 1 && nargin < 3
        error('Not enough inputs');
    end
    
    % Initialise external input array.
    externalInput = zeros(numNeurons, numTimeSteps);
    externalInput(50, :) = [ones(1, switchOffTime) zeros(1, numTimeSteps - switchOffTime)];
    
    % Define Gaussian kernel for connection weights.
    neuronIndices = [-50:50] / 50;
    weights = strengthExcitation * exp(-(neuronIndices - ((1:numNeurons)' - 51) / 50).^2 / sigmaExcitation^2) - strengthInhibition;
    
    % Initialise internal activation array.
    internalActivation = zeros(numNeurons, numTimeSteps);
    
    % Simulation loop.
    for t = 2:numTimeSteps
        % Calculate rate of change in internal activation.
        rateOfChange = -internalActivation(:, t-1) + weights * sigmoid(internalActivation(:, t-1), sigmoidSlope, thresholdOffset) + externalInput(:, t);
        
        % Update internal activation.
        internalActivation(:, t) = internalActivation(:, t-1) + timeStepSize * rateOfChange;
    end
    
    % Calculate output activation.
    outputField = sigmoid(internalActivation', sigmoidSlope, thresholdOffset);
    
    % Visualise activation.
    figure
    surf(outputField(1:4:end, :), 'linestyle', 'none');  
    title('Neural field output')
    ylabel('Time', 'fontsize', 12);
    xlabel('Neuron', 'fontsize', 12);
    zlabel('Activation', 'fontsize', 12);
    axis([0 numNeurons 0 numTimeSteps/4 0 1]);
    set(gca, 'yticklabel', {'0' '100', '200', '300' '400'});
    view(54, 66)
end

%% Sigmoid function computation.
function output = sigmoid(input, slope, offset)

% Description:
    % This function computes the sigmoid activation function, which is
    % used in the dynamic neural fields simulation to model the
    % non-linear response of neurons.

% Input:
    % input: Input values for which sigmoid is computed.
    % slope: Slope parameter determining the steepness of the sigmoid curve.
    % offset: Offset parameter determining the threshold of the sigmoid.

% Output:
    % output: Output values after applying the sigmoid function.

% Author: Dr Dietmar Heinke, University of Birmingham
% Date: 2013

    output = 1 ./ (1 + exp(-slope * (input - offset)));
end
