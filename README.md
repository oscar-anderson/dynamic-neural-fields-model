# Computational Model of Dynamic Neural Fields

## Introduction
Computational modelling is a powerful tool in neuroscience and cognitive science, allowing researchers to simulate and understand complex neural processes. One such model is the Dynamic Neural Fields (DNF), which provides insights into the activation patterns and interactions within neural networks. Dynamic Neural Fields are particularly valuable for studying and understanding brain behaviour dynamics, offering a framework to explore the complex interplay between excitatory and inhibitory neural connections.

For this project, MATLAB was used to develop a computational model of dynamic neural fields and simulate different patterns of activation behaviour across neurons in the brain. The model incorporates a Gaussian kernel to represent connection weights, a sigmoid activation function to capture non-linear neuron responses, and external inputs to drive neural activation. The simulation progresses through time steps, updating internal activations based on the interplay of excitatory and inhibitory connections, as well as external input.

The model was then applied under different conditions of excitation spread, excitation strength and inhibition strength, to examine how these parameters influence the dynamic patterns of activation that these produce throughout the neural field. In particular, three types of activation are simulated:

- **Growing activation:**
The entire neural field becomes active, despite the external input no longer exerting any stimulation.

- **Decaying excitation:**
A neuron is activated by the external input, but this activation decays once the external input is removed.

- **Memory activation:**
Activation spreads to a localised set of neurons in the field and remains active even after the external input is removed.

## Repository structure
- **README.md**: This file.
- [**/code**](link): A folder containing the following scripts, used to complete the project:
  - [`dynamicNeuralFields.m`](link): A MATLAB file containing two functions that define the dynamic neural fields computational model.
  - [`dynamicNeuralFieldsDemo.m`](link): A MATLAB file containing code that simulates the three aforementioned patterns of activation by calling the `dynamicNeuralFields()` function with different excitation spread, excitation strength and inhibition strength parameters specified.
- [**/plot**](link): A folder containing the plots output from the [`dynamicNeuralFieldsDemo.m`](link) script, visualising the three different patterns of activation observed in the neural field:
  - [`growing_activation.png`](link): The visualisation of growing activation in the neural field.
  - [`decaying_activation.png`](link): The visualisation of decaying activation in the neural field.
  - [`memory_activation.png`](link): The visualisation of memory activation in the neural field.

## Acknowledgements
This computational model was developed by Dr Dietmar Heinke at the University of Birmingham in 2013, as part of the Mind, Brain and Models module within the MSc Computational Neuroscience and Cognitive Robotics programme.

Revisions to the original script were subsequently made by Professor Howard Bowman at the Universtiy of Birmingham in 2015.

Additional revisions were since made by myself in 2023.
