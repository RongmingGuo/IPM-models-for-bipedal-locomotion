% Deriving EOM Using MATLAB Symbolic Math ToolBox
syms x y h dx dy g m

% Vector Variables
r = [x; y; h];
v = [dx; dy; 0];
gVec = [0; 0; g];

% Angular Momentum
J = cross(r, (m .* v));
display(J);

% Angular Impulse
dJdt = cross(r, m .* gVec);
display(dJdt);