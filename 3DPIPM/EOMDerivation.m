syms m g x y z xdot ydot zdot
p = [x; y; z];
v = [xdot; ydot; zdot];
% Symbolic Angular Momentum
K = cross(p, v);
display(K);
% Symbolic Angular Impulse
G = [0; 0; -m * g];
I = cross(p, G);
display(I);
% Solve for EOM
A = [0, -z, y; z, 0, -x; -y, x, 0];
b = [-g * m * y; g * m * z; 0];
display(rref([A, b]));