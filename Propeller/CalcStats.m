%% Set parameters
% Weight
BatteryWeight = 150; % [g]
MotorWeight = 34;       % [g] per motor
FlightControllerWeight = 5; % [g]
EscWeight = 19;         % [g]
PiccoWeight = 3;     % [g]
OtherComponentsWeight = 30; % [g]
% Motor
MaxRpm = 19900; % [rpm]
MaxTorque = ; % [N*m]
PropDiameter = 250; % [mm]
HubDiameter = 10; % [mm]
% Air
DensityAir = 1.225; % [kg/m^3]
% TargetStats
MaxThrustToWeightRation = 2; % [trust [N] / weight [N]]

%% Convert and introduce parameters
WeigthForceDrone = (BatteryWeight + 4 * MotorWeight + FlightControllerWeight + EscWeight + PiccoWeight + OtherComponentsWeight) * 9.81 / 1000; % [N]
MaxRpm = MaxRpm * 2 * pi / 60; % [rpm] to [rad/s]
PropDiameter = PropDiameter / 1000; % [mm] to [m]
HubDiameter = HubDiameter / 1000; % [mm] to [m]
BladeSize = (PropDiameter - HubDiameter) / 2; % [m]
SingelPointOfAttackBlade = BladeSize * 4 / (3 * pi); % [m] % this is the point where the torque applies
PropArea = (((PropDiameter / 2) ^ 2) - ((HubDiameter / 2) ^ 2)) * pi; % [m^2]

%% Calculations
VelocityAirHover = sqrt(WeigthForceDrone / (4 * 2 * DensityAir * PropArea)); % [m/s]
VelocityAirMaxThrust = sqrt(WeigthForceDrone * MaxThrustToWeightRation / (4 * 2 * DensityAir * PropArea)); % [m/s]

% angle of incidenc has to be calculated for hover but it has to reach the
% thrust figueres @ max rpm

% Torque is Weight / (4 * sin(angle of incidence @
% SingelPointOfAttackBlade) * SingelPointOfAttackBlade
