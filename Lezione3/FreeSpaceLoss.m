%   ANDREA CASTRONOVO   16/12/2020

%% USER RANDOM DISTRIBUTION IN CIRCULAR AREA and CALCULATE OF FREE SPACE LOSS

 raggio = 2e3; %Raggio cella in metri
 n_utenti = 1e4; %Numero di utenti
 frequency = 1800;
 
 d_utenti = sqrt(rand(n_utenti,1)) * raggio; %Raggio in coordinate polari
 angolo_utenti = rand(n_utenti,1) * 2 * pi; %Angolo in coordinate polari
 
 x_utenti = d_utenti .* cos(angolo_utenti); %Posizione x cartesiana
 y_utenti = d_utenti .* sin(angolo_utenti); %Posizione y cartesiana
 
 %PLOT COPERTURA UTENTI
 plot(x_utenti,y_utenti,'ob')
 xlabel('x')
 ylabel('y')
 
 %FREE SPACE LOSS
 fsl_dB = 32.45 + 20*log10(d_utenti*1e-3) + 20*log10(frequency);
 
 %GRAFICO BIDIMENSIONALE ATTENUAZIONE
 figure %Creation a free figure to not overwrite previous plot
 plot(d_utenti,fsl_dB,'*r')
 xlabel('Distance [m]')
 ylabel('Free space loss [dB]')
 grid on
 
 %SCATTERPLOT AREA: position of users change color with fsl_frequency
 figure
 colormap jet
 scatter(x_utenti,y_utenti,8,fsl_dB,'MarkerFaceColor','flat');
 h = colorbar;
 xlabel('x')
 ylabel('y')
 ylabel(h,'Free space loss [dB]')
 
 