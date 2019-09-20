% simout, frontTire, rearTire,
%% Read Data
% simout
t = simout.Ux.Time;
Ux = simout.Ux.Data;
Uy = simout.Uy.Data;
r  = simout.r.Data;
E  = simout.E.Data;
N  = simout.N.Data;
psi  = simout.psi.Data;

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


% tab 1: position
axes('parent',tab1);

plot(E,N);
axis equal;
% text(sim.E0,sim.N0,'s');
hold all;
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
plot(t,r);
ylabel('yawrate(rad/s)');

yyaxis right;
plot(t,psi);
ylabel('yaw angle(rad)');
legend({'r','psi'});

% tab3: Front Tire
axes('parent', tab3);
subplot(311);
plot(t,alpha_f);
ylabel('alpha-f(rad)')
subplot(312);
plot(t,Fyf);
ylabel('Fyf(N)')
subplot(313);
plot(t,saturated_f);
ylabel('saturated-front(-)')

% tab3: Rear Tire
axes('parent', tab4);
subplot(311);
plot(t,alpha_r);
ylabel('alpha-r(rad)')
subplot(312);
plot(t,Fyr);
ylabel('Fyr(N)')
subplot(313);
plot(t,saturated_r);
ylabel('saturated-rear(-)')
