# DumpTruckSim

Dump Truck Simulator using Simulink
![Integrated Model Image](/misc/Screenshots/IntegratedModel.PNG?raw=true "Integrated Model")

## Description
[MasanoriOgihara/DumpTruckSim](https://github.com/MasanoriOgihara/DumpTruckSim) - DumpTruckSim simulates a vehicle behavior for different road situation such as high/low friction or up/down slope.

## Requirement
DumpTruckSim is based on Matlab/Simulink R2018b.

## Usage
### Bicycle Model Plant Simulation
1. Run AddPaths.m
2. Run scripts/SetParameter.m
3. Run model/BicycleModel.slx
4. Run scripts/AnalyseResult.m

### Simple Speed and Steer Feedback Controller Simulation
1. Run AddPaths.m
2. Run scripts/SetParameter.m
3. Run model/IntegratedModel.slx
4. Run scripts/AnalyseResult.m

## Known issue
- ~~Integrated Model.slx : Simulator doesn't work if sim.Ux0 (initial speed) is larger than 5 m/s (e.g. 10 m/s).~~ --> Resolved.

## Author
[MasanoriOgihara](https://github.com/MasanoriOgihara)
