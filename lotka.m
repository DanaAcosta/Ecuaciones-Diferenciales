function yp = lotka(t,y)
%LOTKA  Lotka-Volterra predator-prey model.

%   Copyright 1984-2014 The MathWorks, Inc.

yp = diag([y(2)-0.5*y(2)*y(1), -0.25*y(1)+0.5*y(2)*y(1)])*y 