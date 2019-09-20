function plot_vehicle(x_m,y_m,psi_rad,delta_rad,Fxr_N,Fyf_N, Fyr_N,Fzf_N,Fzr_N, vehicle,plotrange)

    KOMATSU_YELLOW = [234 170 0]/256;
    LIGHT_YELLOW = [255 245 218]/256;
    
    for i = plotrange
        east = x_m(i);
        north = y_m(i);
        psi = psi_rad(i);
        delta = delta_rad(i);
        fxr = Fxr_N(i);
        fyf = Fyf_N(i);
        fyr = Fyr_N(i);
        fzf = Fzf_N(i);
        fzr = Fzr_N(i);
        vertices = getVehicleVertices(x_m(i),y_m(i),psi_rad(i),vehicle); 
        fill(vertices(:,1),vertices(:,2),LIGHT_YELLOW);
        plot_x1_bike(east,north,psi,delta,delta,0,0,0,0,fxr,fxr,fyf,fyf,fyr,fyr,fzf,fzf,fzr,fzr,vehicle.mu);
    end
end