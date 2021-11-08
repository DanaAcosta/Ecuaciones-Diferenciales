%% Inicio del programa - - - - - - - - - - -
%Primera parte :)
clc
clear
Predator_prey


%% Puntos diferentes

h=input("Valor de h:");  % h puede cambiar, valores:0.1, 0.01, 0.005.
t=0:h:30; % t esta definido en el problema hasta 30

% Definimos todo desde lo basico e iniciamos con el punto 2,1- - - - - - - 

%Ecuacion 1
fx=@(x,y) x-0.5*x*y;
x=zeros(size(t));
x(1)=2;  

%Ecuacion 2
fy=@(x,y) -0.25*y+0.5*x*y; 
y=zeros(size(t));
y(1)=1;   

for i=1:30/h
    k1x=h*fx(x(i),y(i));
    k1y=h*fy(x(i),y(i));

    k2x=h*fx(x(i)+ k1x*0.5, y(i)+k1y*0.5);
    k2y=h*fy(x(i)+k1x*0.5, y(i)+k1y*0.5);

    k3x=h*fx(x(i)+k2x*0.5,y(i)+k2y*0.5);
    k3y=h*fy(x(i)+k2x*0.5,y(i)+k2y*0.5);

    k4x=h*fx(x(i)+k3x,y(i)+k3y);
    k4y=h*fy(x(i)+k3x,y(i)+k3y);

    x(i+1)=x(i)+(k1x+2*k2x+2*k3x+k4x)/6;
    y(i+1)=y(i)+(k1y+2*k2y+2*k3y+k4y)/6;

end  %Predator_prey
xfinal=x;
yfinal=y;
plot(xfinal,yfinal) %Primer plot
hold on

%Segundo punto 3,2 - - - - - - - - - - - - - - - - - - - - - - - - - - - -
x(1)=3;   %Punto inicial
y(1)=2;   %Punto inicial

for i=1:30/h
    k1x=h*fx(x(i),y(i));
    k1y=h*fy(x(i),y(i));

    k2x=h*fx(x(i)+ k1x*0.5, y(i)+k1y*0.5);
    k2y=h*fy(x(i)+k1x*0.5, y(i)+k1y*0.5);

    k3x=h*fx(x(i)+k2x*0.5,y(i)+k2y*0.5);
    k3y=h*fy(x(i)+k2x*0.5,y(i)+k2y*0.5);

    k4x=h*fx(x(i)+k3x,y(i)+k3y);
    k4y=h*fy(x(i)+k3x,y(i)+k3y);

    x(i+1)=x(i)+(k1x+2*k2x+2*k3x+k4x)/6;
    y(i+1)=y(i)+(k1y+2*k2y+2*k3y+k4y)/6;

end

xfinal1=x;
yfinal1=y;
plot(xfinal1,yfinal1)    %Segundo plot
hold on

%Tercer punto 4,3 - - - - - - - - - - - - - - - - - - - - - - - - - - - -
x(1)=4;   %Punto inicial
y(1)=3;   %Punto inicial

for i=1:30/h
    k1x=h*fx(x(i),y(i));
    k1y=h*fy(x(i),y(i));

    k2x=h*fx(x(i)+ k1x*0.5, y(i)+k1y*0.5);
    k2y=h*fy(x(i)+k1x*0.5, y(i)+k1y*0.5);

    k3x=h*fx(x(i)+k2x*0.5,y(i)+k2y*0.5);
    k3y=h*fy(x(i)+k2x*0.5,y(i)+k2y*0.5);

    k4x=h*fx(x(i)+k3x,y(i)+k3y);
    k4y=h*fy(x(i)+k3x,y(i)+k3y);

    x(i+1)=x(i)+(k1x+2*k2x+2*k3x+k4x)/6;
    y(i+1)=y(i)+(k1y+2*k2y+2*k3y+k4y)/6;

end
xfinal2=x;
yfinal2=y;
plot(xfinal2,yfinal2)  %Tercer plot
hold on

%Cuarto punto 6,2 - - - - - - - - - - - - - - - - - - - - - - - - - - - -
x(1)=6;   %Punto inicial
y(1)=2;   %Punto inicial

for i=1:30/h
    k1x=h*fx(x(i),y(i));
    k1y=h*fy(x(i),y(i));

    k2x=h*fx(x(i)+ k1x*0.5, y(i)+k1y*0.5);
    k2y=h*fy(x(i)+k1x*0.5, y(i)+k1y*0.5);

    k3x=h*fx(x(i)+k2x*0.5,y(i)+k2y*0.5);
    k3y=h*fy(x(i)+k2x*0.5,y(i)+k2y*0.5);

    k4x=h*fx(x(i)+k3x,y(i)+k3y);
    k4y=h*fy(x(i)+k3x,y(i)+k3y);

    x(i+1)=x(i)+(k1x+2*k2x+2*k3x+k4x)/6;
    y(i+1)=y(i)+(k1y+2*k2y+2*k3y+k4y)/6;

end
xfinal3=x;
yfinal3=y;
plot(xfinal3,yfinal3) %Plot final
legend("punto (2,1)","punto (3,2)","punto (4,3)","punto (6,2)")
hold on
%% Punto 3,2

Predator_prey

%% Comparacion
t0 = 0;
tfinal = 30;
y0 = [1; 1];   
[t,y] = ode23(@lotka,[t0 tfinal],y0);
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Predators','Location','North')
[T,Y] = ode45(@lotka,[t0 tfinal],y0);

plot(y(:,1),y(:,2),'-',Y(:,1),Y(:,2),'-');
title('Phase Plane Plot')
legend('ode23','ode45')

