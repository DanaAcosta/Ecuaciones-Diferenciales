function Predator_prey
    h=input("Valor de h:");  % h puede cambiar, valores:0.1, 0.01, 0.005.
    t=0:h:30; % t esta definido en el problema hasta 30

    %Ecuacion 1
    fx=@(x,y) x-0.5*x*y;
    x=zeros(size(t));
    x(1)=input("Valor de x:");   %Punto inicial

    %Ecuacion 2
    fy=@(x,y) -0.25*y+0.5*x*y; 
    y=zeros(size(t));
    y(1)=input("Valor de y:");   %Punto inicial

    %Runge-Kutta mejorado 8)

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

    %Mejor definicion
    xfinal=x;
    yfinal=y;
    
    %tres plots - sacado de la documentacion
    % Top two plots
    tiledlayout(2,2) % Requires R2019b or later
    nexttile
    plot(t,xfinal,'r');
    title("Presa")
    nexttile
    plot(t,yfinal);
    title("Predador")
    % Plot that spans
    nexttile([1 2])
    plot(t,yfinal);
    hold on
    plot(t,xfinal,'r');
    title("Predador-presa")
end

