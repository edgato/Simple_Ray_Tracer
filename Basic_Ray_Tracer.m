clc
clear 
% Vectorized Ray Tracing Simulation for a Lens
n_air = 1.0; % Refractive index of air
% Lens parameters (you can adjust these values)
radius = 10/100;        % Lens radius (in arbitrary units)
thickness = 1/100;      % Lens thickness (in arbitrary units)
n_lens = 1.5;       % Refractive index of the lens material
first_Rc=30/100;
second_Rc=80/100;
position=[1,1];
angle=0;
L0=Lens(n_lens,position,angle,radius,thickness,first_Rc,second_Rc);
L0.draw;
incident_angle_deg = 30; % Incident angle in degrees
% Generate rays (for simplicity, let's assume parallel rays)
num_rays = 5;
y0_ray = linspace(-0.01, 0.01, num_rays); % Initial y-coordinates of rays
x0_ray = -0.05;
hold on
plot(position(1),position(2),"Marker","+","MarkerSize",10)
plot(x0_ray,y0_ray,"Marker","+")
xlim([-10,10])
ylim([-10,10])
axis square

hold off

