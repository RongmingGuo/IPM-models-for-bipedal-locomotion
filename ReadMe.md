## IPM Models for Bipedal Locomotion
### Introduction
This repo explores various Inverted Pendulum Models (IPM) typically used as the simplified dynamics models for Bipedal Locomotion, including
1. 2D Linear Inverted Pendulum Model (2D LIPM)
2. 3D Linear Inverted Pendulum Model (3D LIPM)
3. 3D Prismatic Inverted Pendulum Model (3D PIPM)
The Equations of Motion (EOMs) are primarily based on the Principle of Angular Momentum Conservation. MATLAB Symbolic Math Toolbox are used to help the derivation of EOMs.

#### 
![](https://github.gatech.edu/rguo61/Coinstrained-Hybrid-Dynamics-of-LIPM/blob/main/images/SimulationScreenShot.png)
![](https://github.gatech.edu/rguo61/Coinstrained-Hybrid-Dynamics-of-LIPM/blob/main/images/VTAnalysis.png)
![](https://github.gatech.edu/rguo61/Coinstrained-Hybrid-Dynamics-of-LIPM/blob/main/images/SimulationScreenShot3D.PNG)
![](https://github.gatech.edu/rguo61/Coinstrained-Hybrid-Dynamics-of-LIPM/blob/main/images/XYZPlot3D.PNG)
![](https://github.gatech.edu/rguo61/Coinstrained-Hybrid-Dynamics-of-LIPM/blob/main/images/VTAnalysis3D.PNG)

## Execution
Run 2DLIPM/Workspace.m or 3DLIPM/Workspace.m to run respective simulations. Tunnable Parameters Include
1. Step Length
2. Initial COM Location and Velocity
3. Step Time (3D Only)
4. Foot Placement strategy (3D only, currently hard-coded).

Running section-by-section is recommended since the script is divided into Solving & Analysis (Visualization, etc.)

## References and Acknoledgement
[1] https://www.researchgate.net/publication/225543511_Physics-based_modeling_and_simulation_of_human_walking_A_review_of_optimization-based_and_other_approaches
[2] https://www.researchgate.net/publication/303811034_Robust_Phase-Space_Planning_for_Agile_Legged_Locomotion_over_Various_Terrain_Topologies
