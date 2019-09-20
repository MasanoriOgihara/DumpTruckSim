function plot_x1_bike(east, north, psi, delta1, delta2, delta3, delta4, fx1, fx2, fx3, fx4, fy1, fy2, fy3, fy4, fz1,fz2,fz3,fz4,mu)

% Param from VehicleParam
%-------------------------------------------------------
a = 1.52;             % Front length          [m]
b = 1.35;             % Rear length           [m]
d = 0.82;             % Half Tread            [m]
tw = 0.15;            % Tire half width       [m]
tl = 0.4;             % Tire half length      [m]
FORCE_ZOOM_X = 5e-4;  % Long. force indicator [-]
FORCE_ZOOM_Y = 5e-4;  % Lat. force indicator  [-]
CHASSIS_LINE_WIDTH = 1; % Chassis line width
FORCE_LINE_WIDTH = 2;   % Force line width
LON_FORCE_COLOR = [.6 .1 .1]; % Lon. force color
LAT_FORCE_COLOR = [.2 .2 .7]; % Lat. force color
DIA_FORCE_COLOR = [.2 .6 .2]; % Diagonal force color
PLOT_FORCE_FLAG = true; % Plot force or not
%-------------------------------------------------------

% plot vehicle chassis
% tire matrix
% 1-2-3-4-1-yaxis(+)-yaxis(-)
tire = [tl tl -tl -tl tl tl -tl ; tw -tw -tw tw tw 0 0];

f1 = [0 fx1 0 0 0 fx1; 0 0 0 fy1 0 fy1];
f2 = [0 fx2 0 0 0 fx2; 0 0 0 fy2 0 fy2];
f3 = [0 fx3 0 0 0 fx3; 0 0 0 fy3 0 fy3];
f4 = [0 fx4 0 0 0 fx4; 0 0 0 fy4 0 fy4];

psi = psi + pi/2;
tread_f = d;
tread_r = d;
fm = 0*tw; % force margin to plot 1.5*tw
%tread_r2 = tw+0.1;

% cog
gpos = [east;north]; 

fpos = trans2d([a; 0],[1;1], gpos, psi);
flpos = trans2d([a; tread_f],[1;1], gpos, psi);
frpos = trans2d([a; -tread_f],[1;1], gpos, psi);
f1pos = trans2d([a; tread_f+fm],[1;1], gpos, psi);
f2pos = trans2d([a; -(tread_f+fm)],[1;1], gpos, psi);

rpos = trans2d([-b; 0],[1;1], gpos, psi);
rlpos = trans2d([-b; tread_r],[1;1], gpos, psi);
rrpos = trans2d([-b; -tread_r],[1;1], gpos, psi);
f3pos = trans2d([-b; tread_r+fm],[1;1], gpos, psi);
f4pos = trans2d([-b; -(tread_r+fm)],[1;1], gpos, psi);

tire1 = trans2d(tire,[1;1],flpos,psi+delta1);
tire2 = trans2d(tire,[1;1],frpos,psi+delta2);
tire3 = trans2d(tire,[1;1],rlpos,psi+delta3);
tire4 = trans2d(tire,[1;1],rrpos,psi+delta4);
tiref = trans2d(tire,[1;1],fpos,psi+delta1);
tirer = trans2d(tire,[1;1],rpos,psi+delta3);

tirecolor = 'c';

force1 = trans2d(f1,[FORCE_ZOOM_X; FORCE_ZOOM_Y],f1pos,psi+delta1);
force2 = trans2d(f2,[FORCE_ZOOM_X; FORCE_ZOOM_Y],f2pos,psi+delta2);
force3 = trans2d(f3,[FORCE_ZOOM_X; FORCE_ZOOM_Y],f3pos,psi+delta3);
force4 = trans2d(f4,[FORCE_ZOOM_X; FORCE_ZOOM_Y],f4pos,psi+delta4);
forcef = trans2d(f1,[FORCE_ZOOM_X; FORCE_ZOOM_Y],fpos,psi+delta1);
forcer = trans2d(f3,[FORCE_ZOOM_X; FORCE_ZOOM_Y],rpos,psi+delta3);
hold on

% Front tire
%plot(tire1(1,:),tire1(2,:),'k','LineWidth',TIRE_LINE_WIDTH)
%fill(tire1(1,:),tire1(2,:),TIRE_COLOR);
%plot(tire2(1,:),tire2(2,:),'k','LineWidth',TIRE_LINE_WIDTH)
%fill(tire2(1,:),tire2(2,:),TIRE_COLOR);
% Front center tire
draw_tire(tiref);

% Rear Tire
%plot(tire3(1,:),tire3(2,:),'k','LineWidth',TIRE_LINE_WIDTH)
%fill(tire3(1,:),tire3(2,:),TIRE_COLOR);
%plot(tire4(1,:),tire4(2,:),'k','LineWidth',TIRE_LINE_WIDTH)
%fill(tire4(1,:),tire4(2,:),TIRE_COLOR);
% Rear center tire
draw_tire(tirer);

% chassis center
plot([gpos(1),fpos(1)],[gpos(2),fpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);
plot([gpos(1),rpos(1)],[gpos(2),rpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);

% chassis front
%plot([flpos(1),frpos(1)],[flpos(2),frpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);
%plot([flpos(1),frpos(1)],[flpos(2),frpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);

% chassis rear
%plot([rlpos(1),rrpos(1)],[rlpos(2),rrpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);
%plot([rlpos(1),rrpos(1)],[rlpos(2),rrpos(2)],'k','LineWidth',CHASSIS_LINE_WIDTH);


% Force
%keyboard;
% 
if(PLOT_FORCE_FLAG)
    % Longitudinal
    %plot(forcef(1,1:2), forcef(2,1:2),'color',LON_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    %plot(forcer(1,1:2), forcer(2,1:2),'color',LON_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    % Lateral
    %plot(forcef(1,3:4), forcef(2,3:4),'color',LAT_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    %plot(forcer(1,3:4), forcer(2,3:4),'color',LAT_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    % Diagonal
    plot(forcef(1,5:6), forcef(2,5:6),'color',DIA_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    plot(forcer(1,5:6), forcer(2,5:6),'color',DIA_FORCE_COLOR,'LineWidth',FORCE_LINE_WIDTH);
    % Tire friction circle
    plot_tire_circle(fpos,FORCE_ZOOM_X*fz1,mu);
    plot_tire_circle(rpos,FORCE_ZOOM_X*fz3,mu);
end
% draw_cog
drawCog(east,north,psi+pi/2,0.2);
%axes('Units', 'normalized', 'Position', [0 0 1 1])
axis equal;
%keyboard;
end

function draw_tire(tire)
    TIRE_LINE_WIDTH = 1;    % Tire line width
    TIRE_COLOR = [.8 .8 .8]; % Tire color
    fill(tire(1,1:5),tire(2,1:5),TIRE_COLOR);
    plot(tire(1,:),tire(2,:),'k','LineWidth',TIRE_LINE_WIDTH)
end


function plot_tire_circle(pos,fz,mu)
    FRICTION_CIRCLE_COLOR = [46 205 255] / 256;
    radius = fz*mu;
    alpha = linspace(0, 360, 24)/180*pi;
    plot(pos(1)+radius*cos(alpha), pos(2)+radius*sin(alpha),'color',FRICTION_CIRCLE_COLOR);
end

function drawCog(x,y,psi,radius)
hold on;
alpha = linspace(0, 90, 6)/180*pi + psi;
patch(x+[0 radius*cos(alpha) 0], y+[0 radius*sin(alpha) 0], 'k')

alpha = linspace(90, 180, 6)/180*pi + psi;
patch(x+[0 radius*cos(alpha) 0], y+[0 radius*sin(alpha) 0], 'w')
%plot(x+radius*cos(alpha), y+radius*sin(alpha),'k');

alpha = linspace(180, 270, 6)/180*pi + psi;
patch(x+[0 radius*cos(alpha) 0], y+[0 radius*sin(alpha) 0], 'k')

alpha = linspace(270, 360, 6)/180*pi + psi;
patch(x+[0 radius*cos(alpha) 0], y+[0 radius*sin(alpha) 0], 'w')
%plot(x+radius*cos(alpha), y+radius*sin(alpha),'k');
end

function[Zout] = trans2d(Zin, Zoom, Move, theta)
% trans2d : zooming, parallel translation, rotation of a vector Zin.
% Zin = [xin; yin]
% Zoom = [zoomX; zoomY]
% Move = [moveX; moveY]
% xin, yin : row vector
zoomX = Zoom(1,:);
zoomY = Zoom(2,:);
moveX = Move(1,:);
moveY = Move(2,:);
ONE = ones(1,size(Zin,2));
Zin = [Zin; ONE];

Rot = [zoomX*cos(theta), zoomY*-sin(theta), 0;...
    zoomX*sin(theta), zoomY*cos(theta), 0;...
    0, 0, 1]; % rotation matrix
Z1 = Rot * Zin;

Move = [1 0 moveX; 0 1 moveY; 0 0 1];
Zout = Move * Z1;

Zout = Zout(1:2,:);

end


