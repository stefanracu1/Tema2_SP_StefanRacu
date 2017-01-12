
  N=50; % numarul de coeficienti
  D=9; % durata
  P=40; % perioada
  F=1/P; % frecventa 
  w0=2*pi/P; % pulsatia
  t=0:0.02:P-0.02; % perioada 
                 
  x = zeros(1,size(t,2)); 
    x(t<=D/2) =1; % de la 0 la d/2 x are valoarea 1
    x(t>P-D/2) =1; % de la d/2 la P x are valoarea 1
  
  t_4per = 0:0.02:4*P-0.02; % vectorul timp pentru reprezentarea pe 4 perioade
  x_4per = repmat(x,1,4); % vectorul x pentru reprezentarea pe 4 perioade
   

   for k = -N:N
      x_temp = x;
      x_temp = x_temp.*exp(-j*k*w0*t); % vectorul inmultit cu termenul corespunzator
      X(k+51) = trapez(t,x_temp); % trapez calculeaza integrala prin metoda trapezului 
                                  %(imparte suprafata in forme trapezoidale pentru a calcula mai usor aria)
   end

  x_re(1:length(t)) = 0; % initializarea semnalului cu N=50 puncte

    
           for index = 1:length(t);   %reconstructia x(t) cu N=50 
              for k = -N:N
                  x_re(index) = x_refacut(index) + (1/P)*X(k+N+1)*exp(j*k*w0*t(index));
                  end
                  end

  figure(1);
  plot(t_4perioade,x_4perioade); % afisarea lui x(t)
  
  title('x(t) cu linie solida si reconstructia cu linie punctata(N=50)');

  hold on

  x_re_4perioade = repmat(x_refacut,1,4); % generarea lui x reconstruit pentru 4 perioade
  plot(t_4perioade,x_re_4perioade,'--'); % afisarea lui x reconstruit pentru 4 perioade
  xlabel('Timp');
  ylabel('Amplitudine');

     f = -N*F:F:N*F; % generarea vectorului de frecvente
     figure(2);
     stem(f,abs(X)); % afisarea lui X
       
       title('Spectrul lui x(t)');
       xlabel('Frecventa [Hz]');
       ylabel('|X|');




