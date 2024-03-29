% bicycle, frontTire, rearTire,
%% Read Data
% bicycle
t =  bicycle.Ux.Time;
Ux = bicycle.Ux.Data;
Uy = bicycle.Uy.Data;
r_radps  = bicycle.r.Data;
E  = bicycle.E.Data;
N  = bicycle.N.Data;
psi = bicycle.psi.Data;
beta_rad = bicycle.beta.Data;

% frontTire
alpha_f = frontTire.alpha.Data;
Fxf     = frontTire.Fx.Data;
Fzf     = frontTire.Fz.Data;
mu_f    = frontTire.mu.Data;
Caf     = frontTire.Ca.Data;
saturated_f = frontTire.isSaturated.Data;
Fyf     = frontTire.Fy.Data;

% rearTire
alpha_r = rearTire.alpha.Data;
Fxr     = rearTire.Fx.Data;
Fzr     = rearTire.Fz.Data;
mu_r    = rearTire.mu.Data;
Car     = rearTire.Ca.Data;
saturated_r = rearTire.isSaturated.Data;
Fyr     = rearTire.Fy.Data;

if(exist('controller')==1) % if 'controller' exists as a variable name
    existsControllerFlag = true;
    t_cont = controller.index.Time;
    index = controller.index.Data;
    s = controller.s_m.Data;
    e = controller.e_m.Data;
    dPsi = controller.dPsi_rad.Data;
    UxDes = controller.UxDes_mps.Data;
    delta_cmd_rad = controller.delta_cmd_rad.Data;
    delta_ffw_rad = controller.delta_ffw_rad.Data;
    delta_fb_rad = controller.delta_fb_rad.Data;
    Fx_cmd_N = controller.Fx_cmd_N.Data;
    grade_rad = controller.grade_rad.Data;    
else
    existsControllerFlag = false;
end
    

if(exist('steering')==1) % if 'steering' exists as a variable name
    existsSteerFlag = true;
    delta_des_rad = steering.delta_des_rad.Data;
    delta_rad = steering.delta_rad.Data;
    slewrate_radps = [0;diff(delta_rad)]/sim.timestep_s;
else
    existsSteerFlag = false;
end
% generic value
nSamples = size(t,1);

%% Set plot parameter
pltItvl = 500;


%% Plot
f = figure(1);clf;
tabgp = uitabgroup(f);
tab1 = uitab(tabgp,'Title','Position');
tab2 = uitab(tabgp,'Title','Speed');
tab3 = uitab(tabgp,'Title','Front Tire');
tab4 = uitab(tabgp,'Title','Rear Tire');
tab5 = uitab(tabgp,'Title','Yawrate-SlipAngle');
if(existsControllerFlag)
    tab6 = uitab(tabgp,'Title','Controller');
    tab7 = uitab(tabgp,'Title','Index');
end
if(existsSteerFlag)
    tab8 = uitab(tabgp,'Title','Steering');
end

% tab 1: position
axes('parent',tab1);
plot(E,N);
axis equal;
hold all;
plot(world.posE_m,world.posN_m,'r');
for i = 1:pltItvl:nSamples
    plot_square_vehicle(E(i),N(i),psi(i),vehicle);
end

% tab2: speed & angle
axes('parent', tab2);

subplot(211);
plot(t,Ux);
hold all;
plot(t,Uy);
legend({'Ux','Uy'});
ylabel('speed(m/s)');

subplot(212);
yyaxis left;
plot(t,r_radps);
ylabel('yawrate(rad/s)');

yyaxis right;
plot(t,psi);
ylabel('yaw angle(rad)');
legend({'r','psi'});

% tab3: Front Tire
axes('parent', tab3);
subplot(231);
plot(t,alpha_f);
ylabel('alpha-f(rad)')
subplot(232);
plot(t,Fyf);
ylabel('Fyf(N)')
subplot(233);
plot(alpha_f,Fyf);
xlabel('alpha-f(rad)')
ylabel('Fyf(N)')
subplot(234);
plot(t,saturated_f);
ylim([0,2]);
ylabel('saturated-front(-)')
subplot(235);
muFzf_N = vehicle.m*env.g*env.mu*vehicle.b/vehicle.L;
theta = 0:pi/12:2*pi;
plot(Fyf,Fxf);
hold all;
plot(muFzf_N * cos(theta),muFzf_N * sin(theta),'color',[0.5 0.5 0.5]);
xlabel('Fyf(N)');
ylabel('Fxf(N)');

% tab4: Rear Tire
axes('parent', tab4);
subplot(231);
plot(t,alpha_r);
ylabel('alpha-r(rad)')
subplot(232);
plot(t,Fyr);
ylabel('Fyr(N)')
subplot(233);
plot(alpha_r,Fyr);
xlabel('alpha-r(rad)')
ylabel('Fyr(N)')
subplot(234);
plot(t,saturated_r);
ylim([0,2])
ylabel('saturated-rear(-)')
subplot(235);
muFzr_N = vehicle.m*env.g*env.mu*vehicle.a/vehicle.L;
plot(Fyr,Fxr);
hold all;
plot(muFzr_N * cos(theta),muFzr_N * sin(theta),'color',[0.5 0.5 0.5]);
xlabel('Fyr(N)');
ylabel('Fxr(N)');

% tab5: Yawrate-SlipAngle
axes('parent', tab5);
UxMean = mean(Ux);
veh_color = [.5,.5,.5];
parallel_color = 'r';
plot_stability_envelope(beta_rad,r_radps,UxMean,vehicle,veh_color,parallel_color);
xlabel('slip angle(rad)')
ylabel('yawrate(rad/s)')

% tab6: Controller
if(existsControllerFlag)
axes('parent', tab6);
ax(1) = subplot(221);
plot(t,Ux);
hold all;
plot(t_cont,UxDes);
legend({'Ux','UxDes'});
ylabel('Speed (m/s)');

ax(2) = subplot(222);
plot(t_cont,Fx_cmd_N);
ylabel('Fx Command(N)');

ax(3) = subplot(223);
yyaxis left;
plot(t_cont,e);
ylim([-3 3]);
ylabel('Lateral Error (m)');
yyaxis right;
plot(t_cont,dPsi);
ylim([-1 1]);
ylabel('Heading Error (rad)');

ax(4) = subplot(224);
plot(t_cont,delta_cmd_rad);
hold all;
plot(t_cont,delta_ffw_rad);
plot(t_cont,delta_fb_rad);
legend({'Command','FFW','FB'});
ylabel('delta (rad)')

linkaxes(ax,'x');

% tab7: Indexing
axes('parent', tab7);
ax(1) = subplot(211);
plot(t_cont,s);
hold on;
plot(t_cont,world.s_m(index));
legend('actual s-m','index s-m');
ylabel('s-m');

ax(2) = subplot(212);
plot(t_cont,index);
ylabel('index');
end

% tab8: Steer
if(existsSteerFlag)
axes('parent', tab8);
subplot(211);
plot(t,delta_rad);
hold all;
plot(t,delta_des_rad);
legend({'delta-actual','delta-desired'});
ylabel('delta (rad)')

subplot(212);
plot(t,slewrate_radps);
hold all;
plot([0,t(end)],[steer.deltaRateMax_radps, steer.deltaRateMax_radps],'color',[0.5 0.5 0.5]);
plot([0,t(end)],-[steer.deltaRateMax_radps, steer.deltaRateMax_radps],'color',[0.5 0.5 0.5]);
legend({'delta-actual'});
ylabel('Slew Rate (rad/s)')

end
