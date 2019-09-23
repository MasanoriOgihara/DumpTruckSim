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
    s = controller.s.Data;
    e = controller.e.Data;
    dPsi = controller.dPsi.Data;
    UxDes = controller.UxDes.Data;
    delta_fb_rad = controller.delta_fb_rad.Data;
    Fx_cmd_N = controller.Fx_cmd_N.Data;
    grade_rad = controller.grade_rad.Data;    
else
    existsControllerFlag = false;
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
end

% tab 1: position
axes('parent',tab1);
plot(E,N);
axis equal;
% text(sim.E0,sim.N0,'s');
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
subplot(221);
plot(t,alpha_f);
ylabel('alpha-f(rad)')
subplot(222);
plot(t,Fyf);
ylabel('Fyf(N)')
subplot(223);
plot(alpha_f,Fyf);
xlabel('alpha_f(rad)')
ylabel('Fyf(N)')
subplot(224);
plot(t,saturated_f);
ylabel('saturated-front(-)')

% tab4: Rear Tire
axes('parent', tab4);
subplot(221);
plot(t,alpha_r);
ylabel('alpha-r(rad)')
subplot(222);
plot(t,Fyr);
ylabel('Fyr(N)')
subplot(223);
plot(alpha_r,Fyr);
xlabel('alpha_r(rad)')
ylabel('Fyr(N)')
subplot(224);
plot(t,saturated_r);
ylabel('saturated-rear(-)')

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
subplot(221);
plot(t,Ux);
hold all;
plot(t_cont,UxDes);
legend({'Ux','UxDes'});
ylabel('Speed (m/s)');
subplot(222);
plot(t_cont,Fx_cmd_N);
ylabel('Fx Command(N)');

subplot(223);
plot(s,e);
hold all;
plot(s,dPsi);
legend({'e(m)','dPsi(rad)'});
ylabel('Control Error');

subplot(224);
plot(t_cont,delta_fb_rad);
legend({'FB'});
ylabel('delta (rad)')
end
